<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 01 · Your First Cluster

**Goal:** create a 3-node kind cluster, explore it, deploy an app, and watch reconciliation happen.
**Time:** 30 minutes · **Level:** 🟢 Beginner · **Module:** [01 · Foundations](../../02-modules/01-foundations-and-setup.md)

## Prerequisites

Docker, `kubectl` and `kind` installed.

## Step 1 · Create the cluster

```bash
kind create cluster --config manifests/kind-3node.yaml
kubectl get nodes -o wide
kubectl get pods -n kube-system -o wide
```

Identify the control plane pods: `etcd-*`, `kube-apiserver-*`, `kube-controller-manager-*`, `kube-scheduler-*`. They're **static pods**. Look at them on the node:

```bash
docker exec -it devopsshack-lab-control-plane ls /etc/kubernetes/manifests
```

## Step 2 · Explore the API

```bash
kubectl api-resources | head -30
kubectl explain deployment.spec.strategy
kubectl get --raw /healthz; echo
kubectl get pods -A -v=6 2>&1 | grep GET | head -3    # the REST calls kubectl makes
```

## Step 3 · Deploy and expose an app

```bash
kubectl apply -f manifests/hello.yaml
kubectl -n lab01 rollout status deploy/hello
kubectl -n lab01 get deploy,rs,pods,svc -o wide
curl -s localhost:30080 | head -5
```

## Step 4 · Watch reconciliation

In one terminal: `kubectl -n lab01 get pods -w`. In another:

```bash
kubectl -n lab01 delete pod -l app=hello --wait=false
```

The ReplicaSet controller notices fewer pods than desired and creates new ones within a second or two.

## Step 5 · Break a node

```bash
docker stop devopsshack-lab-worker
kubectl get nodes -w          # NotReady after ~40s
kubectl -n lab01 get pods -o wide -w   # pods on that node are replaced after the eviction timeout (~5 min)
docker start devopsshack-lab-worker
```

## Verify

- [ ] 3 nodes Ready
- [ ] `curl localhost:30080` returns the hello page
- [ ] You can explain why deleted pods came back

## Clean up

```bash
kubectl delete ns lab01
# keep the cluster for the next labs, or: kind delete cluster --name devopsshack-lab
```

## What you learned

kind topology, static pods, the API as REST, Deployments → ReplicaSets → Pods, NodePort, reconciliation, node failure behaviour.

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
