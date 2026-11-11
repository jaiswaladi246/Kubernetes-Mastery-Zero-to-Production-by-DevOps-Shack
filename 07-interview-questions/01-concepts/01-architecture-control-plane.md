<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Concept-Based · Architecture & Control Plane

Questions 1–50 of the concept-based bank. Answer each one out loud before opening the answer.

---

**Q1. What is Kubernetes and what problem does it solve?**

<details>
<summary>Show answer</summary>

Kubernetes is an open-source container orchestration platform. It runs containers across a cluster of machines and keeps them in the state you declare: it schedules them, restarts failed ones, scales them, rolls out new versions, gives them stable networking and attaches storage. It replaces the scripts and manual work teams used to run containers at scale.

</details>

**Q2. What does "declarative" mean in Kubernetes?**

<details>
<summary>Show answer</summary>

You describe the desired end state (for example, 3 replicas of an image behind a Service) instead of the steps to get there. Controllers continuously compare desired and actual state and act to close the gap, so the system self-corrects after failures or drift.

</details>

**Q3. Explain the reconciliation loop.**

<details>
<summary>Show answer</summary>

A controller watches objects through the API server, reads the desired state (spec), observes the actual state, and takes actions to make them match, then updates status. It is level-triggered and idempotent: it doesn't depend on seeing every event, it just fixes whatever difference exists now.

</details>

**Q4. Name the control plane components and their roles.**

<details>
<summary>Show answer</summary>

kube-apiserver (the API front door and only component that talks to etcd), etcd (the consistent key-value store for all cluster state), kube-scheduler (assigns pods to nodes), kube-controller-manager (runs built-in controllers like Deployment, ReplicaSet, Node, EndpointSlice), and cloud-controller-manager (integrates with cloud APIs for nodes, routes and load balancers).

</details>

**Q5. Name the worker node components.**

<details>
<summary>Show answer</summary>

The kubelet (node agent that runs and monitors pods assigned to the node), a container runtime such as containerd or CRI-O (pulls images, runs containers via CRI), and kube-proxy (programs Service routing rules) or an eBPF replacement such as Cilium.

</details>

**Q6. Why is the API server the only component that talks to etcd?**

<details>
<summary>Show answer</summary>

It centralises authentication, authorization, admission, validation and versioning in one place, keeps etcd's schema and access internal, enables the watch cache that protects etcd from load, and means every change goes through the same audited, policy-enforced pipeline.

</details>

**Q7. What happens to running pods if the control plane goes down?**

<details>
<summary>Show answer</summary>

They keep running. Kubelets and kube-proxy keep the last known configuration, so traffic continues. What stops is change: no scheduling, scaling, self-healing after failures, deployments or kubectl operations until the control plane returns.

</details>

**Q8. What is etcd and why does Kubernetes need it?**

<details>
<summary>Show answer</summary>

etcd is a distributed, strongly consistent key-value store using the Raft consensus algorithm. Kubernetes stores every object in it. It provides consistency across API server replicas, a watch mechanism for change notification, and high availability through replication.

</details>

**Q9. What is quorum in etcd and why use an odd number of members?**

<details>
<summary>Show answer</summary>

Quorum is a majority of members, floor(n/2)+1, needed to commit writes and elect a leader. Odd numbers maximise fault tolerance per member: 3 members tolerate 1 failure, 4 members still tolerate only 1, 5 tolerate 2.

</details>

**Q10. What does the scheduler actually do?**

<details>
<summary>Show answer</summary>

For each pod with no nodeName, it filters out nodes that can't run the pod (resources, taints, affinity, volumes), scores the remaining nodes with plugins (spread, resource balance, image locality, affinity preferences), picks the best one and writes a Binding. It never starts containers.

</details>

**Q11. Does the scheduler consider actual resource usage?**

<details>
<summary>Show answer</summary>

No. It uses resource requests and node allocatable. A node can be nearly idle but "full" if requests add up to its allocatable capacity. Usage only matters indirectly, through things like kubelet eviction.

</details>

**Q12. What is the kube-controller-manager?**

<details>
<summary>Show answer</summary>

A single binary that runs many independent control loops: Deployment, ReplicaSet, StatefulSet, DaemonSet, Job, CronJob, Node lifecycle, EndpointSlice, Namespace, ServiceAccount, garbage collector, PV binder, HPA, ResourceQuota and others. Replicas use leader election so only one is active.

</details>

**Q13. What is the cloud-controller-manager responsible for?**

<details>
<summary>Show answer</summary>

Cloud-specific logic: initialising nodes with zone, region and instance type labels and removing nodes whose VMs are gone, programming routes for pod CIDRs, and creating cloud load balancers for Services of type LoadBalancer.

</details>

**Q14. What is a watch?**

<details>
<summary>Show answer</summary>

A long-lived HTTP stream where the API server pushes ADDED, MODIFIED and DELETED events for resources from a given resourceVersion. Every controller relies on watches (via informers) instead of polling.

</details>

**Q15. What is an informer?**

<details>
<summary>Show answer</summary>

A client-side component that LISTs then WATCHes a resource type, keeps a local cache, and triggers event handlers. Controllers read from the cache and push object keys into a work queue, which reduces load on the API server.

</details>

**Q16. What is resourceVersion used for?**

<details>
<summary>Show answer</summary>

It's an opaque version of an object (and of collections) used for optimistic concurrency and watches. Updates must include the version they read; if the object changed meanwhile the API returns 409 Conflict. Watches resume from a resourceVersion.

</details>

**Q17. What is optimistic concurrency in Kubernetes?**

<details>
<summary>Show answer</summary>

Kubernetes doesn't lock objects. Writers send the resourceVersion they read; if another writer changed the object first, the write fails with 409 and the client re-reads and retries. This keeps the API scalable without distributed locks.

</details>

**Q18. Describe the API server request pipeline.**

<details>
<summary>Show answer</summary>

TLS, authentication, audit, API Priority and Fairness, authorization (RBAC, Node, webhook), mutating admission, schema validation, validating admission, then persistence to etcd and a response plus watch events to watchers.

</details>

**Q19. What is API Priority and Fairness?**

<details>
<summary>Show answer</summary>

An API server feature that classifies requests into flow schemas and priority levels with their own concurrency shares and queues, so a noisy client or controller can't starve critical traffic like kubelets or leader election. Excess requests get 429.

</details>

**Q20. What are API groups and versions?**

<details>
<summary>Show answer</summary>

APIs are grouped (core with no name, apps, batch, networking.k8s.io, etc.) and versioned (v1alpha1, v1beta1, v1). A resource can be served at multiple versions and stored at one storage version; maturity levels signal stability and deprecation rules.

</details>

**Q21. What is the difference between alpha, beta and GA APIs?**

<details>
<summary>Show answer</summary>

Alpha is experimental, off by default and can change or vanish. Beta is well tested; new beta APIs are off by default since 1.24. GA (v1) is stable and supported long term, with deprecation only under strict policy.

</details>

**Q22. What is a static pod?**

<details>
<summary>Show answer</summary>

A pod the kubelet runs directly from a manifest file on the node (staticPodPath), without the API server. The kubelet creates a read-only mirror pod in the API so you can see it. kubeadm uses static pods for the control plane.

</details>

**Q23. What is leader election and which components use it?**

<details>
<summary>Show answer</summary>

Replicas compete for a Lease object; the holder renews it periodically and acts, others wait and take over if renewal stops. kube-scheduler, kube-controller-manager, cloud-controller-manager and most operators use it.

</details>

**Q24. What is a Lease object used for besides leader election?**

<details>
<summary>Show answer</summary>

Node heartbeats. Each kubelet updates a Lease in kube-node-lease every ~10 seconds, which is cheaper than updating the whole Node status. The node lifecycle controller uses lease renewals to detect unhealthy nodes.

</details>

**Q25. What is the role of kube-proxy?**

<details>
<summary>Show answer</summary>

It watches Services and EndpointSlices and programs the node's packet-forwarding rules (iptables, IPVS or nftables) so traffic to a Service's virtual IP is load-balanced to backend pod IPs. It doesn't proxy traffic in userspace in modern modes.

</details>

**Q26. What is CRI?**

<details>
<summary>Show answer</summary>

The Container Runtime Interface, a gRPC API between the kubelet and container runtimes. It lets Kubernetes use containerd, CRI-O or others without runtime-specific code in the kubelet.

</details>

**Q27. Why was dockershim removed and does it break Docker images?**

<details>
<summary>Show answer</summary>

Docker Engine didn't implement CRI, so the kubelet needed an adapter (dockershim) that was costly to maintain; it was removed in 1.24. Docker-built images are standard OCI images and run fine on containerd or CRI-O.

</details>

**Q28. What is the difference between containerd and runc?**

<details>
<summary>Show answer</summary>

containerd is a high-level runtime that manages images, snapshots and container lifecycle and exposes CRI. runc is a low-level OCI runtime that actually asks the kernel to create the namespaces, cgroups and process.

</details>

**Q29. What is a RuntimeClass?**

<details>
<summary>Show answer</summary>

An object that lets pods choose a different low-level runtime handler, for example gVisor or Kata Containers for stronger isolation, via spec.runtimeClassName.

</details>

**Q30. What is the pause container?**

<details>
<summary>Show answer</summary>

A tiny container that starts first in every pod and holds the pod's network (and optionally IPC/PID) namespace. App containers join it, so the pod keeps its IP even if app containers restart.

</details>

**Q31. What is a namespace in Kubernetes?**

<details>
<summary>Show answer</summary>

A virtual partition of a cluster that scopes names and is the unit for RBAC, quotas, limit ranges, network policies and Pod Security labels. It is not a security boundary by itself: pods share nodes and the network unless policies say otherwise.

</details>

**Q32. Name some cluster-scoped resources.**

<details>
<summary>Show answer</summary>

Nodes, Namespaces, PersistentVolumes, StorageClasses, ClusterRoles, ClusterRoleBindings, CustomResourceDefinitions, IngressClasses, PriorityClasses, and admission webhook configurations.

</details>

**Q33. What are labels and selectors?**

<details>
<summary>Show answer</summary>

Labels are key/value pairs on objects used to identify and group them. Selectors query labels (equality or set-based). Services, controllers, network policies, PDBs and affinity rules all find their targets through label selectors.

</details>

**Q34. How do annotations differ from labels?**

<details>
<summary>Show answer</summary>

Annotations hold non-identifying metadata for tools and humans (change causes, scrape config, controller settings) and can be large. They are never used for selection. Labels are short and used for selecting and grouping.

</details>

**Q35. What are owner references?**

<details>
<summary>Show answer</summary>

Metadata linking a dependent object to its owner (a Pod to its ReplicaSet, a ReplicaSet to its Deployment). The garbage collector uses them to delete dependents when the owner is deleted.

</details>

**Q36. What are finalizers?**

<details>
<summary>Show answer</summary>

Strings in metadata.finalizers that block final deletion. On delete, the API sets deletionTimestamp; controllers perform cleanup and remove their finalizer; when the list is empty the object is removed.

</details>

**Q37. What are the deletion propagation policies?**

<details>
<summary>Show answer</summary>

Background (default; owner deleted immediately, dependents cleaned up afterwards), Foreground (dependents deleted first, owner waits), and Orphan (dependents kept with owner references removed).

</details>

**Q38. What is the difference between spec and status?**

<details>
<summary>Show answer</summary>

spec is the desired state written by users or tools; status is the observed state written by controllers. Many resources expose status as a separate subresource so permissions and updates can be separated.

</details>

**Q39. What is server-side apply?**

<details>
<summary>Show answer</summary>

An apply mode where the API server merges changes and tracks field ownership in managedFields per manager. It allows multiple tools to own different fields and reports conflicts when two managers try to own the same field.

</details>

**Q40. What is API aggregation?**

<details>
<summary>Show answer</summary>

The API server proxies requests for an API group to an extension API server registered through an APIService object. metrics.k8s.io served by metrics-server is the common example.

</details>

**Q41. What are the key differences between Kubernetes control plane HA topologies?**

<details>
<summary>Show answer</summary>

Stacked: each control plane node runs an API server and an etcd member; simpler, but a node loss removes both. External etcd: a separate etcd cluster; more resilient and tunable, but more machines and operations.

</details>

**Q42. Is the API server stateless?**

<details>
<summary>Show answer</summary>

Yes. All persistent state lives in etcd, so multiple API server replicas can run active-active behind a load balancer. Each keeps an in-memory watch cache that can be rebuilt from etcd.

</details>

**Q43. How does the node lifecycle controller react to an unreachable node?**

<details>
<summary>Show answer</summary>

After the lease stops renewing for the grace period (around 40-50 seconds), it marks the node condition Unknown and adds not-ready or unreachable NoExecute taints. Pods tolerate those for 300 seconds by default, then are evicted and recreated elsewhere by their controllers.

</details>

**Q44. What are Kubernetes events?**

<details>
<summary>Show answer</summary>

Short-lived objects recording things that happened (scheduling failures, image pulls, probe failures, scaling). They're kept for about an hour by default and are invaluable for debugging; ship them to a log system for history.

</details>

**Q45. What is a kubeconfig file?**

<details>
<summary>Show answer</summary>

A YAML file listing clusters (API endpoint and CA), users (credentials or exec plugins) and contexts (cluster + user + default namespace), plus the current context. kubectl and client libraries use it to connect.

</details>

**Q46. What is the version skew policy?**

<details>
<summary>Show answer</summary>

Components may differ in versions within limits: kube-apiserver replicas within one minor of each other, controller-manager and scheduler not newer than the API server and at most one minor older, kubelets up to three minors older but never newer, kubectl within one minor of the API server.

</details>

**Q47. What does kubeadm do?**

<details>
<summary>Show answer</summary>

It bootstraps a conformant cluster: preflight checks, generates certificates and kubeconfigs, writes control plane static pod manifests, installs CoreDNS and kube-proxy, and provides join tokens and upgrade commands. It doesn't provision machines or install a CNI.

</details>

**Q48. What is a CRD?**

<details>
<summary>Show answer</summary>

A CustomResourceDefinition adds a new resource type to the API with its own schema, versions and validation. Custom resources are stored in etcd and get RBAC, kubectl support and watches like built-in resources.

</details>

**Q49. What is an operator?**

<details>
<summary>Show answer</summary>

A custom controller, usually paired with CRDs, that encodes operational knowledge for an application: installation, upgrades, failover, backups and scaling. It reconciles custom resources the same way built-in controllers reconcile Deployments.

</details>

**Q50. What is the difference between managed and self-managed Kubernetes?**

<details>
<summary>Show answer</summary>

In managed services (EKS, AKS, GKE) the provider runs, patches, scales and backs up the control plane. You still own nodes (unless fully managed modes), add-ons, workloads, security configuration, application backups and upgrades scheduling.

</details>

---

← [Concept-Based index](README.md) · [All interview banks](../README.md)

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
