<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Architecture 05 · Controllers & Reconciliation

If the API server is the brain's memory, controllers are its reflexes. A controller is a loop that watches some objects, compares desired state with actual state, and takes action to make them match. `kube-controller-manager` is one binary that runs a few dozen of these loops.

## The control loop

```mermaid
flowchart LR
    W[Watch events<br/>from API server] --> I[Informer<br/>local cache + event handlers]
    I --> Q[Work queue<br/>deduplicated keys: ns/name]
    Q --> R[Reconcile ns/name]
    R --> G[Read desired state<br/>from cache]
    G --> O[Read actual state]
    O --> D{Diff?}
    D -- yes --> A[Create / update / delete<br/>via API server]
    D -- no --> DONE[Done]
    A --> S[Update status]
    R -- error --> RQ[Requeue with<br/>exponential backoff]
    RQ --> Q
```

Key properties that make controllers robust:

- **Level-triggered, not edge-triggered.** The reconciler doesn't care *what* changed. It looks at the whole current state and fixes it. Missed an event? The next resync catches it.
- **Idempotent.** Running reconcile twice gives the same result. Crashing halfway is safe.
- **Informer caches.** Controllers read from a local in-memory cache fed by watches, so they don't hammer the API server.
- **Work queue deduplication.** Ten rapid changes to the same Deployment collapse into one reconcile.

## Controllers inside kube-controller-manager

| Controller | Watches | Ensures |
|---|---|---|
| Deployment | Deployments, ReplicaSets | Right ReplicaSets exist; rolling updates progress |
| ReplicaSet | ReplicaSets, Pods | Exactly N pods match the selector |
| StatefulSet | StatefulSets, Pods, PVCs | Ordered, stable-identity pods with their own PVCs |
| DaemonSet | DaemonSets, Nodes, Pods | One pod per matching node |
| Job / CronJob | Jobs, CronJobs, Pods | Pods run to completion; Jobs created on schedule |
| Node lifecycle | Nodes, Leases | Marks nodes NotReady, taints them, triggers eviction |
| EndpointSlice | Services, Pods | Each Service's endpoint list tracks ready pods |
| Namespace | Namespaces | Deletes everything inside a terminating namespace |
| ServiceAccount / token | Namespaces, SAs | Default SA exists in every namespace |
| Garbage collector | Everything with ownerReferences | Dependents are deleted with their owner |
| PV binder / attach-detach | PVCs, PVs, VolumeAttachments | Claims bind to volumes; volumes attach to the right node |
| HPA | HPAs, metrics API | Replica counts follow metrics |
| ResourceQuota | Quotas, objects in namespace | Usage is tracked against quota |

## A Deployment, traced through three controllers

```mermaid
sequenceDiagram
    participant U as You
    participant API as API server
    participant DC as Deployment controller
    participant RSC as ReplicaSet controller
    participant S as Scheduler
    participant K as kubelet
    U->>API: create Deployment web (replicas 3)
    API-->>DC: ADDED Deployment web
    DC->>API: create ReplicaSet web-7d4f (replicas 3)
    API-->>RSC: ADDED ReplicaSet web-7d4f
    RSC->>API: create 3 Pods (nodeName empty)
    API-->>S: 3 unscheduled Pods
    S->>API: bind pods to nodes
    API-->>K: Pod assigned to my node
    K->>K: pull image, start containers
    K->>API: update Pod status Running/Ready
    API-->>RSC: Pods ready
    RSC->>API: update RS status readyReplicas 3
    DC->>API: update Deployment status available 3
```

No component tells the next one what to do. Each one just watches the API and reacts. This loose coupling is why Kubernetes is so extensible: you can add your own controller and it participates exactly like the built-in ones.

## Rolling updates as reconciliation

```mermaid
flowchart LR
    subgraph Before
        RS1a["RS v1: 3 pods"]
    end
    subgraph Step1["maxSurge 1"]
        RS1b["RS v1: 3"] --- RS2b["RS v2: 1"]
    end
    subgraph Step2
        RS1c["RS v1: 2"] --- RS2c["RS v2: 2"]
    end
    subgraph Step3
        RS1d["RS v1: 1"] --- RS2d["RS v2: 3"]
    end
    subgraph After
        RS1e["RS v1: 0 (kept for rollback)"] --- RS2e["RS v2: 3"]
    end
    Before --> Step1 --> Step2 --> Step3 --> After
```

The Deployment controller only ever adjusts the replica counts of two ReplicaSets, gated by `maxSurge`, `maxUnavailable` and pod readiness. Rollback (`kubectl rollout undo`) simply scales the old ReplicaSet back up.

## Owner references and garbage collection

```mermaid
flowchart TB
    D[Deployment web] -- ownerReference --> RS[ReplicaSet web-7d4f]
    RS -- ownerReference --> P1[Pod web-7d4f-a]
    RS -- ownerReference --> P2[Pod web-7d4f-b]
```

Delete the Deployment and the garbage collector deletes the ReplicaSet, then its Pods. Propagation policies:

- `Background` (default): owner deleted immediately, dependents cleaned up after.
- `Foreground`: dependents deleted first; owner waits with a `foregroundDeletion` finalizer.
- `Orphan`: dependents are kept and their ownerReferences removed (`kubectl delete deploy web --cascade=orphan`).

## Finalizers: "don't delete me yet"

A finalizer is a string in `metadata.finalizers`. When you delete an object that has finalizers, the API server only sets `deletionTimestamp`. The object stays until every controller that owns a finalizer does its cleanup and removes its string.

```mermaid
sequenceDiagram
    participant U as You
    participant API as API server
    participant C as Controller (e.g. PV protection)
    U->>API: delete PVC data
    API->>API: set deletionTimestamp, keep object
    API-->>C: MODIFIED PVC (being deleted)
    C->>C: is a pod still using it? wait
    C->>API: remove finalizer kubernetes.io/pvc-protection
    API->>API: no finalizers left: delete for real
```

A namespace stuck in `Terminating` almost always means some object inside has a finalizer whose controller is gone (for example, a CRD's operator was uninstalled first). Fix the controller, or as a last resort remove the finalizer knowingly.

## Leader election

Controller managers and schedulers run with several replicas for HA, but only one may act at a time. They compete for a `Lease` object in `kube-system`; the holder renews it every few seconds. If it stops renewing, another replica takes over.

```bash
kubectl -n kube-system get lease kube-controller-manager kube-scheduler -o wide
```

## Check yourself

1. What does "level-triggered" mean, and why is it more robust than reacting to individual events?
2. Trace the controllers involved from `kubectl create deployment` to running pods.
3. What happens to pods when you delete a Deployment with `--cascade=orphan`?
4. Why might a namespace be stuck in Terminating?
5. How do three controller-manager replicas avoid fighting each other?

Next: [06 · cloud-controller-manager](06-cloud-controller-manager.md)

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
