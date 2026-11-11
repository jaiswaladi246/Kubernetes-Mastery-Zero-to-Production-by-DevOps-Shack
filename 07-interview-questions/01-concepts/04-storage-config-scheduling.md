<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Concept-Based · Storage, Config, Resources & Scheduling

Questions 151–200 of the concept-based bank. Answer each one out loud before opening the answer.

---

**Q151. What is the difference between a volume and a PersistentVolume?**

<details>
<summary>Show answer</summary>

A volume is defined in the pod spec and lives as long as the pod (emptyDir, configMap) or points to external storage. A PersistentVolume is a cluster-level storage resource with its own lifecycle, claimed by pods through PVCs.

</details>

**Q152. What is a PersistentVolumeClaim?**

<details>
<summary>Show answer</summary>

A namespaced request for storage specifying size, access modes and StorageClass. It binds to a matching PV (static or dynamically provisioned) that pods then mount.

</details>

**Q153. What is a StorageClass?**

<details>
<summary>Show answer</summary>

A cluster object describing a type of storage: provisioner (CSI driver), parameters (disk type, encryption), reclaimPolicy, volumeBindingMode and whether expansion is allowed. PVCs use it for dynamic provisioning.

</details>

**Q154. What is dynamic provisioning?**

<details>
<summary>Show answer</summary>

Automatic creation of a PV when a PVC references a StorageClass. The CSI external-provisioner calls the driver to create the underlying disk and creates the PV.

</details>

**Q155. What are the PV access modes?**

<details>
<summary>Show answer</summary>

ReadWriteOnce (one node read-write), ReadOnlyMany (many nodes read-only), ReadWriteMany (many nodes read-write) and ReadWriteOncePod (exactly one pod).

</details>

**Q156. What are reclaim policies?**

<details>
<summary>Show answer</summary>

Delete removes the underlying storage when the PVC is deleted; Retain keeps it with the PV in Released state for manual recovery or cleanup.

</details>

**Q157. What does volumeBindingMode WaitForFirstConsumer do?**

<details>
<summary>Show answer</summary>

Delays binding and provisioning until a pod using the PVC is scheduled, so zonal disks are created in the pod's zone and topology constraints are respected.

</details>

**Q158. What is CSI?**

<details>
<summary>Show answer</summary>

The Container Storage Interface, a standard gRPC API letting storage vendors write drivers that Kubernetes uses for provisioning, attaching, mounting, resizing and snapshotting volumes without in-tree code.

</details>

**Q159. Name the main CSI sidecars.**

<details>
<summary>Show answer</summary>

external-provisioner (create/delete volumes), external-attacher (attach/detach), external-resizer (expand), external-snapshotter (snapshots), node-driver-registrar (registers the driver with the kubelet), and livenessprobe.

</details>

**Q160. What is a VolumeSnapshot?**

<details>
<summary>Show answer</summary>

A CRD-based request to snapshot a PVC through a CSI driver, with VolumeSnapshotClass and VolumeSnapshotContent. New PVCs can be created from snapshots via dataSource.

</details>

**Q161. How do you expand a PVC?**

<details>
<summary>Show answer</summary>

If the StorageClass has allowVolumeExpansion true, increase spec.resources.requests.storage on the PVC. The resizer expands the volume and the kubelet grows the filesystem, often online. Shrinking isn't supported.

</details>

**Q162. What is emptyDir?**

<details>
<summary>Show answer</summary>

A scratch volume created when a pod starts on a node and deleted when the pod is removed. It survives container restarts, can be memory-backed (tmpfs) and can have a sizeLimit.

</details>

**Q163. Why avoid hostPath volumes?**

<details>
<summary>Show answer</summary>

They expose the node's filesystem to the pod (a container escape risk), tie the pod's data to one node, and are blocked by baseline and restricted Pod Security.

</details>

**Q164. What is a local PersistentVolume?**

<details>
<summary>Show answer</summary>

A PV representing a disk on a specific node, with node affinity so pods using it schedule there. Fast, but data is lost if the node is lost, so apps must replicate data themselves.

</details>

**Q165. What is a projected volume?**

<details>
<summary>Show answer</summary>

A volume combining several sources (Secrets, ConfigMaps, downwardAPI, ServiceAccount tokens) into one directory, used for bound, audience-scoped SA tokens among other things.

</details>

**Q166. What is a ConfigMap?**

<details>
<summary>Show answer</summary>

A namespaced object storing non-sensitive configuration as key/value pairs or files, consumed by pods as env vars, command arguments or mounted files.

</details>

**Q167. What is a Secret and how is it different from a ConfigMap?**

<details>
<summary>Show answer</summary>

A Secret stores sensitive data, base64-encoded in the API, mounted on tmpfs on nodes, with typically tighter RBAC and optional encryption at rest. Base64 is encoding, not encryption.

</details>

**Q168. Do pods see ConfigMap updates?**

<details>
<summary>Show answer</summary>

Mounted volumes update eventually (kubelet sync period plus cache TTL), except subPath mounts. Environment variables are fixed at container start and need a pod restart.

</details>

**Q169. What are immutable ConfigMaps and Secrets?**

<details>
<summary>Show answer</summary>

Objects with immutable true can't be changed, only deleted and recreated. They prevent accidental changes and reduce API server load because kubelets stop watching them.

</details>

**Q170. What Secret types exist?**

<details>
<summary>Show answer</summary>

Opaque (generic), kubernetes.io/tls, kubernetes.io/dockerconfigjson (registry credentials), kubernetes.io/basic-auth, kubernetes.io/ssh-auth, kubernetes.io/service-account-token and bootstrap tokens.

</details>

**Q171. How do you encrypt Secrets at rest?**

<details>
<summary>Show answer</summary>

Configure the API server with an EncryptionConfiguration using aescbc, aesgcm, secretbox or preferably a KMS v2 provider, then rewrite existing Secrets so they're stored encrypted.

</details>

**Q172. What is the size limit for ConfigMaps and Secrets?**

<details>
<summary>Show answer</summary>

1 MiB per object, a limit inherited from etcd request size considerations.

</details>

**Q173. What are resource requests and limits?**

<details>
<summary>Show answer</summary>

Requests are the resources reserved for scheduling and the guaranteed share under contention; limits are hard caps enforced by cgroups (CPU throttled above limit, memory OOM-killed above limit).

</details>

**Q174. What happens when a container exceeds its CPU limit?**

<details>
<summary>Show answer</summary>

It's throttled by the CFS quota for the rest of the scheduling period. It isn't killed, but latency can suffer badly.

</details>

**Q175. What happens when a container exceeds its memory limit?**

<details>
<summary>Show answer</summary>

The kernel OOM killer terminates it; the container shows OOMKilled with exit code 137 and is restarted according to the restart policy.

</details>

**Q176. What is node allocatable?**

<details>
<summary>Show answer</summary>

Node capacity minus kube-reserved, system-reserved and eviction thresholds. It's what the scheduler can allocate to pods.

</details>

**Q177. What is a LimitRange?**

<details>
<summary>Show answer</summary>

A namespaced policy setting default requests and limits for containers and min/max bounds for containers, pods and PVCs, applied at admission time.

</details>

**Q178. What is a ResourceQuota?**

<details>
<summary>Show answer</summary>

A namespaced cap on aggregate resource usage (CPU and memory requests/limits, storage, object counts like pods, Services, LoadBalancers). Requests beyond quota are rejected.

</details>

**Q179. Why do quotas often require LimitRanges?**

<details>
<summary>Show answer</summary>

Once a quota covers requests.cpu or memory, every pod must specify them or it's rejected. LimitRange defaults fill them in automatically.

</details>

**Q180. What is ephemeral-storage as a resource?**

<details>
<summary>Show answer</summary>

Local disk used by container writable layers, logs and emptyDir. It can be requested and limited; exceeding limits causes eviction.

</details>

**Q181. What is in-place pod resize?**

<details>
<summary>Show answer</summary>

The ability to change a running pod's container CPU and memory requests/limits without recreating it, controlled per resource by resizePolicy, through the resize subresource.

</details>

**Q182. What is nodeSelector?**

<details>
<summary>Show answer</summary>

A simple pod field requiring nodes to have specific labels for scheduling.

</details>

**Q183. What is node affinity?**

<details>
<summary>Show answer</summary>

An expressive way to attract pods to nodes by label: requiredDuringSchedulingIgnoredDuringExecution (hard) and preferredDuringSchedulingIgnoredDuringExecution (soft, weighted), with operators like In, NotIn, Exists, Gt, Lt.

</details>

**Q184. What are taints and tolerations?**

<details>
<summary>Show answer</summary>

Taints on nodes repel pods; tolerations on pods allow (but don't force) them onto tainted nodes. Effects: NoSchedule, PreferNoSchedule, NoExecute (also evicts running pods).

</details>

**Q185. How do you dedicate nodes to a workload?**

<details>
<summary>Show answer</summary>

Taint the nodes so other pods are repelled and label them; give the workload a matching toleration and node affinity so it is both allowed and attracted.

</details>

**Q186. What is pod affinity and anti-affinity?**

<details>
<summary>Show answer</summary>

Rules that place pods relative to other pods by label within a topology domain (node, zone): affinity co-locates, anti-affinity separates. Each can be required or preferred.

</details>

**Q187. What are topology spread constraints?**

<details>
<summary>Show answer</summary>

Rules that spread matching pods evenly across topology domains (zones, nodes) with maxSkew, whenUnsatisfiable (DoNotSchedule or ScheduleAnyway), minDomains and label selectors.

</details>

**Q188. What does IgnoredDuringExecution mean?**

<details>
<summary>Show answer</summary>

The rule is only evaluated at scheduling time. Later label changes on nodes or pods don't evict running pods.

</details>

**Q189. What is a PriorityClass?**

<details>
<summary>Show answer</summary>

A cluster object assigning an integer priority to pods. Higher-priority pods are scheduled first and can preempt lower-priority pods when resources are scarce (unless preemptionPolicy is Never).

</details>

**Q190. What is preemption?**

<details>
<summary>Show answer</summary>

When a high-priority pod can't be scheduled, the scheduler may evict lower-priority pods from a node to make room, nominating that node for the pending pod.

</details>

**Q191. What is the descheduler?**

<details>
<summary>Show answer</summary>

A separate component that evicts pods to improve placement over time (balance utilisation, fix violated affinities or spread), since the scheduler never moves running pods.

</details>

**Q192. What is the HorizontalPodAutoscaler?**

<details>
<summary>Show answer</summary>

A controller that adjusts a workload's replicas based on metrics (CPU and memory utilisation of requests, custom or external metrics), with configurable scale-up and scale-down behaviour.

</details>

**Q193. How does HPA compute desired replicas?**

<details>
<summary>Show answer</summary>

desired = ceil(currentReplicas × currentMetricValue / targetValue), evaluated per metric; with multiple metrics it takes the maximum. Stabilisation windows and policies smooth changes.

</details>

**Q194. What does metrics-server provide?**

<details>
<summary>Show answer</summary>

Short-window CPU and memory usage for pods and nodes via the metrics.k8s.io API, used by kubectl top, HPA and VPA. It isn't a monitoring system and keeps no history.

</details>

**Q195. What is the VerticalPodAutoscaler?**

<details>
<summary>Show answer</summary>

A component that recommends or applies container requests based on observed usage, in Off, Initial or Recreate/Auto modes.

</details>

**Q196. What is KEDA?**

<details>
<summary>Show answer</summary>

Kubernetes Event-Driven Autoscaling: scales workloads based on external event sources (queues, streams, Prometheus, cron) and can scale to zero, by managing HPAs and its own activation logic.

</details>

**Q197. What is the Cluster Autoscaler?**

<details>
<summary>Show answer</summary>

A component that adds nodes to node groups when pods are unschedulable due to resources and removes underutilised nodes whose pods can be rescheduled elsewhere.

</details>

**Q198. What is Karpenter?**

<details>
<summary>Show answer</summary>

A node provisioner that watches pending pods and launches right-sized nodes directly from a flexible set of instance types, and consolidates or replaces nodes to reduce cost.

</details>

**Q199. What blocks the Cluster Autoscaler from removing a node?**

<details>
<summary>Show answer</summary>

Pods with restrictive PDBs, pods not managed by a controller, pods with local storage (by default), pods annotated safe-to-evict false, system pods without PDBs in some configurations, and node-group minimum sizes.

</details>

**Q200. What is a resource quota scope?**

<details>
<summary>Show answer</summary>

A filter limiting which pods a quota applies to, such as BestEffort, NotBestEffort, Terminating, NotTerminating or PriorityClass, enabling different budgets per priority.

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
