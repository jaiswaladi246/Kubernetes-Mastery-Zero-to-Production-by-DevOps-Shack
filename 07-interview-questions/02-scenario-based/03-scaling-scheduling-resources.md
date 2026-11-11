<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Scenario-Based · Scaling, Scheduling & Resources

Questions 101–150 of the scenario-based bank. Answer each one out loud before opening the answer.

---

**Q101. Traffic spikes every morning and the API slows down before HPA catches up. What do you do?**

<details>
<summary>Show answer</summary>

Tune HPA behaviour for fast scale-up, scale on a leading metric like RPS or queue depth, keep a higher minReplicas during known peaks (KEDA cron trigger or scheduled scaling), and ensure node autoscaling and image pulls are fast.

</details>

**Q102. HPA shows the CPU target as unknown. What's wrong?**

<details>
<summary>Show answer</summary>

metrics-server isn't working or the pods lack CPU requests. Check `kubectl top pods`, the metrics APIService, metrics-server logs, and add requests.

</details>

**Q103. The HPA scaled to max but latency is still bad. What next?**

<details>
<summary>Show answer</summary>

Find the real bottleneck: database, downstream services, thread pools, CPU throttling or connection limits. Scaling pods doesn't help if a shared dependency is saturated; raise maxReplicas only if pods are truly the constraint.

</details>

**Q104. Pods scale up and down every few minutes. How do you stop flapping?**

<details>
<summary>Show answer</summary>

Add a scale-down stabilisation window (e.g. 300 s), use rate-limiting policies, pick a smoother metric, and set targets with headroom.

</details>

**Q105. You want a worker to run zero replicas when its queue is empty. How?**

<details>
<summary>Show answer</summary>

Use KEDA with a queue scaler and minReplicaCount 0, which activates the workload when messages arrive and scales back to zero when idle.

</details>

**Q106. Pods are Pending with Insufficient memory, but nodes show plenty of free memory in monitoring. Why?**

<details>
<summary>Show answer</summary>

Scheduling uses requests, not usage. The nodes are fully requested. Right-size over-requested workloads or add nodes.

</details>

**Q107. Memory-heavy batch jobs keep causing your API pods to be evicted. How do you protect critical workloads from batch jobs?**

<details>
<summary>Show answer</summary>

Give critical pods higher PriorityClasses and Guaranteed QoS, put batch on separate tainted node pools, set quotas for batch namespaces, and set realistic memory requests to prevent overcommit.

</details>

**Q108. A pod is OOMKilled every few hours. How do you decide between raising the limit and fixing a leak?**

<details>
<summary>Show answer</summary>

Look at the working set over time: a steady climb to the limit suggests a leak; spikes under load suggest the limit is too low. Check runtime heap settings, take heap dumps, then fix or resize accordingly.

</details>

**Q109. Your Java service gets OOMKilled even though heap usage looks fine. Why?**

<details>
<summary>Show answer</summary>

Non-heap memory (metaspace, thread stacks, direct buffers, native libraries) plus heap exceeds the container limit, or the heap max is too high for the limit. Use MaxRAMPercentage, account for off-heap, and measure container working set.

</details>

**Q110. Latency-sensitive pods have CPU limits and suffer p99 spikes. What do you change?**

<details>
<summary>Show answer</summary>

Measure throttling; if high, raise or remove CPU limits while keeping accurate requests, and tune runtime thread counts to the CPU allocation.

</details>

**Q111. Developers never set resources. How do you enforce sane defaults?**

<details>
<summary>Show answer</summary>

LimitRange defaults per namespace, a policy requiring requests in production namespaces, ResourceQuotas, and VPA recommendations to guide values.

</details>

**Q112. You need to guarantee a team can't use more than 20 CPUs. How?**

<details>
<summary>Show answer</summary>

A ResourceQuota on requests.cpu (and limits.cpu if you use limits) in the team's namespaces, plus LimitRange defaults so pods without requests aren't rejected.

</details>

**Q113. How would you make an app survive the loss of a zone?**

<details>
<summary>Show answer</summary>

Run replicas across three zones with topology spread constraints, keep enough capacity in the remaining zones (or fast autoscaling), use zone-redundant or replicated data stores, and add PDBs.

</details>

**Q114. Two replicas of a service ended up on the same node, which then died. How do you prevent it?**

<details>
<summary>Show answer</summary>

Add topology spread constraints on kubernetes.io/hostname (or preferred/required pod anti-affinity) and keep a PDB.

</details>

**Q115. GPU nodes are expensive and ordinary pods keep landing on them. Fix it.**

<details>
<summary>Show answer</summary>

Taint GPU nodes (e.g. nvidia.com/gpu NoSchedule) so only pods with the toleration land there, and give GPU workloads node affinity to those nodes.

</details>

**Q116. A critical pod is stuck Pending because the cluster is full of batch jobs. What's the quick fix and the long-term fix?**

<details>
<summary>Show answer</summary>

Quick: scale down batch work or add nodes. Long-term: PriorityClasses so critical pods preempt batch, separate node pools, and quotas.

</details>

**Q117. A node is running hot while others are idle. Why and what can you do?**

<details>
<summary>Show answer</summary>

The scheduler only balances at placement time, and requests may not reflect usage. Fix requests, use topology spread, and run the descheduler to rebalance.

</details>

**Q118. You want to bin-pack nodes to save money for a batch cluster. How?**

<details>
<summary>Show answer</summary>

Configure a scheduler profile using NodeResourcesFit MostAllocated scoring, and use Karpenter consolidation or Cluster Autoscaler scale-down settings to remove empty nodes.

</details>

**Q119. A pod needs to run on nodes with SSDs if available, but anywhere otherwise. How?**

<details>
<summary>Show answer</summary>

Use preferredDuringSchedulingIgnoredDuringExecution node affinity on an ssd label with a weight, instead of a required rule.

</details>

**Q120. The cluster autoscaler doesn't add nodes even though pods are Pending. What do you check?**

<details>
<summary>Show answer</summary>

Autoscaler logs for the reason: node group max size, cloud quotas or capacity, pod constraints no node group template satisfies (labels, taints, zones), or pods Pending for non-resource reasons like PVC zones.

</details>

**Q121. Nodes never scale down at night. What blocks them?**

<details>
<summary>Show answer</summary>

Pods with restrictive PDBs, pods without controllers, local storage, safe-to-evict false annotations, DaemonSet-only nodes misconfigured, or utilisation above the scale-down threshold. The autoscaler logs or status ConfigMap list the blockers.

</details>

**Q122. You need to run a nightly job that uses 200 CPUs for an hour. How do you avoid paying for idle capacity?**

<details>
<summary>Show answer</summary>

Let a node autoscaler (Karpenter) provision spot or on-demand nodes for the job's pods and consolidate them afterwards; use a dedicated tainted NodePool and a Job with appropriate parallelism.

</details>

**Q123. A pod needs more CPU temporarily during startup only. How can you handle it?**

<details>
<summary>Show answer</summary>

Leave CPU limits unset or generous so it can burst on spare capacity, or use in-place pod resize to lower resources after startup in newer versions.

</details>

**Q124. How do you set requests for a new service with no history?**

<details>
<summary>Show answer</summary>

Load test in staging, observe p95 usage, set requests near that and memory limit with headroom, then refine with production metrics and VPA recommendations after launch.

</details>

**Q125. Pods are evicted with DiskPressure. What's consuming disk and how do you stop it?**

<details>
<summary>Show answer</summary>

Usually container logs, large emptyDirs or writable layers, or too many images. Set ephemeral-storage limits and emptyDir sizeLimit, fix verbose logging, ensure log rotation, enlarge disks and tune image GC.

</details>

**Q126. You want different scheduling behaviour for batch pods than for web pods. How?**

<details>
<summary>Show answer</summary>

Use separate scheduler profiles via schedulerName (one bin-packing), separate node pools with taints, PriorityClasses, or a batch scheduler like Volcano or Kueue.

</details>

**Q127. A StatefulSet pod can't be rescheduled after its node died. Why?**

<details>
<summary>Show answer</summary>

Kubernetes won't create a replacement with the same identity while the old pod might still be running on an unreachable node. After confirming the node is gone, delete the pod forcefully or apply the out-of-service taint so volumes detach.

</details>

**Q128. Pods take 3 minutes to start because image pulls are slow. What helps?**

<details>
<summary>Show answer</summary>

Smaller images, regional registry mirrors, pre-pulling via DaemonSet for critical images, image streaming/lazy pulling, and keeping nodes warm for burst workloads.

</details>

**Q129. How do you ensure DNS and CNI pods always get scheduled even when nodes are full?**

<details>
<summary>Show answer</summary>

Give them system-cluster-critical or system-node-critical PriorityClasses and appropriate tolerations; DaemonSets for CNI tolerate taints.

</details>

**Q130. A team asks for guaranteed resources for a latency-critical service. What do you configure?**

<details>
<summary>Show answer</summary>

Guaranteed QoS (requests equal limits), a high PriorityClass, spread across zones, a PDB, and possibly the static CPU manager policy for exclusive cores on dedicated nodes.

</details>

**Q131. How do you plan capacity for Black Friday traffic?**

<details>
<summary>Show answer</summary>

Load test to find per-pod capacity, compute replicas for expected peak with headroom, pre-scale minReplicas and node pools ahead of time, verify cloud quotas, and freeze risky changes.

</details>

**Q132. An HPA scales on memory and never scales down. Why?**

<details>
<summary>Show answer</summary>

Many runtimes don't release memory back to the OS, so memory stays high after load drops. Prefer CPU, RPS or queue-based metrics for scaling.

</details>

**Q133. VPA keeps evicting pods to apply new requests. How do you avoid disruption?**

<details>
<summary>Show answer</summary>

Use updateMode Off or Initial and apply recommendations during deploys, set minAllowed/maxAllowed, rely on PDBs, or use in-place resize where supported.

</details>

**Q134. How do you scale a deployment based on Kafka consumer lag?**

<details>
<summary>Show answer</summary>

KEDA's Kafka scaler (lag per partition target), or the HPA with an external metric from Prometheus Adapter exposing lag.

</details>

**Q135. A pod needs exactly one replica cluster-wide at any time. How do you guarantee it?**

<details>
<summary>Show answer</summary>

Use a Deployment with replicas 1 and Recreate strategy, or a StatefulSet with replicas 1, plus app-level leader election if correctness requires strict single-writer behaviour.

</details>

**Q136. You have mixed amd64 and arm64 nodes. How do you schedule correctly?**

<details>
<summary>Show answer</summary>

Build multi-arch images; for single-arch images use nodeSelector kubernetes.io/arch. Karpenter or node pools can provision both for cost savings.

</details>

**Q137. How do you keep one noisy tenant from starving the API server?**

<details>
<summary>Show answer</summary>

API Priority and Fairness configuration to isolate tenants' controllers, quotas on object counts, and reviewing heavy LIST/WATCH clients.

</details>

**Q138. A Job needs all 8 worker pods running at the same time or none. How?**

<details>
<summary>Show answer</summary>

Use gang scheduling via Kueue, Volcano or the JobSet with appropriate admission so partial starts don't waste resources.

</details>

**Q139. You want to reserve capacity so new pods schedule instantly during spikes. How?**

<details>
<summary>Show answer</summary>

Run low-priority placeholder pods (overprovisioning) that get preempted when real pods arrive, prompting the autoscaler to add nodes in the background.

</details>

**Q140. A namespace keeps hitting its pod quota due to completed Job pods. Fix it.**

<details>
<summary>Show answer</summary>

Set ttlSecondsAfterFinished on Jobs and history limits on CronJobs so finished pods are cleaned up.

</details>

**Q141. Your HPA metric is requests per second from Prometheus. How do you wire it up?**

<details>
<summary>Show answer</summary>

Expose the metric from the app, scrape it, install Prometheus Adapter with a rule mapping a PromQL rate to a custom pods metric, then reference it in the HPA as type Pods.

</details>

**Q142. How do you scale a workload on a schedule?**

<details>
<summary>Show answer</summary>

KEDA's cron scaler, a CronJob that patches minReplicas, or cloud scheduled scaling for node groups.

</details>

**Q143. A pod needs huge pages. What do you configure?**

<details>
<summary>Show answer</summary>

Pre-allocate huge pages on nodes, then request them as resources (hugepages-2Mi or hugepages-1Gi) with matching limits and mount a medium HugePages emptyDir.

</details>

**Q144. Workloads get CPU-starved by system daemons on nodes. How do you fix it?**

<details>
<summary>Show answer</summary>

Configure kube-reserved and system-reserved in the kubelet so allocatable excludes daemon usage, and set eviction thresholds.

</details>

**Q145. How do you choose node sizes for a cluster?**

<details>
<summary>Show answer</summary>

Balance per-node overhead and failure blast radius: larger nodes pack better and reduce overhead but lose more pods per failure; consider pod density limits (IPs), workload shapes, and use a few instance families with autoscaling.

</details>

**Q146. You need to drain a node but a PDB blocks it. What are your options?**

<details>
<summary>Show answer</summary>

Scale the workload up so the PDB allows an eviction, temporarily relax the PDB with the owner's agreement, or wait for other disruptions to finish. Avoid deleting pods directly without understanding the impact.

</details>

**Q147. How would you right-size 100 deployments across teams?**

<details>
<summary>Show answer</summary>

Collect usage with Prometheus, generate VPA or Goldilocks recommendations, publish a report per team with savings and risk, apply changes gradually with monitoring, and enforce requests via policy.

</details>

**Q148. Pods with the same labels get unevenly spread across zones after a zone recovered. How do you rebalance?**

<details>
<summary>Show answer</summary>

The scheduler doesn't move running pods. Use the descheduler's topology spread strategy, or perform a rolling restart so pods reschedule with spread constraints.

</details>

**Q149. A pod must start on a node only after a node-level agent is ready. How?**

<details>
<summary>Show answer</summary>

Use a startup taint that the agent removes when ready (common for CNI and storage agents), or readiness gates on the workload.

</details>

**Q150. How do you test that your cluster autoscaling works before a big event?**

<details>
<summary>Show answer</summary>

Run a load test or deploy placeholder pods requiring more capacity, measure time-to-node and time-to-ready, and confirm scale-down afterwards.

</details>

---

← [Scenario-Based index](README.md) · [All interview banks](../README.md)

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
