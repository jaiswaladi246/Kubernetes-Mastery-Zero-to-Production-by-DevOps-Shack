<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Concept-Based · Workloads & Pods

Questions 51–100 of the concept-based bank. Answer each one out loud before opening the answer.

---

**Q51. What is a pod?**

<details>
<summary>Show answer</summary>

The smallest deployable unit: one or more containers scheduled together on one node, sharing a network namespace (same IP and port space, talk via localhost) and able to share volumes.

</details>

**Q52. Why does Kubernetes use pods instead of scheduling containers directly?**

<details>
<summary>Show answer</summary>

Some processes must be co-located and share resources, like an app and its log shipper or proxy. The pod gives them a shared network and storage context and a single lifecycle and scheduling unit.

</details>

**Q53. When should two containers be in the same pod?**

<details>
<summary>Show answer</summary>

Only when they must share a lifecycle, network namespace or local files, such as sidecars, ambassadors and adapters. Independent components like an app and its database belong in separate pods because they scale and fail differently.

</details>

**Q54. What are init containers?**

<details>
<summary>Show answer</summary>

Containers that run to completion, one at a time in order, before app containers start. They're used for setup like waiting for dependencies, running migrations or rendering config. A failing init container is retried per the restart policy.

</details>

**Q55. What is a native sidecar container?**

<details>
<summary>Show answer</summary>

An init container with restartPolicy Always. It starts before the app containers, keeps running alongside them, is restarted independently, and is terminated after the main containers. It fixes ordering and Job-completion issues with classic sidecars.

</details>

**Q56. What are the pod phases?**

<details>
<summary>Show answer</summary>

Pending, Running, Succeeded, Failed and Unknown. The phase is a summary; pod conditions and container states give detail.

</details>

**Q57. What are pod conditions?**

<details>
<summary>Show answer</summary>

PodScheduled, PodReadyToStartContainers, Initialized, ContainersReady and Ready. Ready determines whether the pod is included in Service endpoints.

</details>

**Q58. What are the container states?**

<details>
<summary>Show answer</summary>

Waiting (with a reason such as ContainerCreating, ImagePullBackOff or CrashLoopBackOff), Running, and Terminated (with exit code and reason such as Completed, Error or OOMKilled).

</details>

**Q59. What does CrashLoopBackOff mean?**

<details>
<summary>Show answer</summary>

The container keeps exiting and the kubelet is waiting an exponentially increasing delay (up to five minutes) before restarting it again. The cause is in previous logs and the last termination state.

</details>

**Q60. What restart policies exist?**

<details>
<summary>Show answer</summary>

Always (default, used by Deployments, StatefulSets and DaemonSets), OnFailure (restart only on non-zero exit, used by Jobs) and Never.

</details>

**Q61. What is a ReplicaSet?**

<details>
<summary>Show answer</summary>

A controller that ensures a specified number of pods matching its selector are running. Deployments manage ReplicaSets to provide rolling updates and rollback; you rarely create ReplicaSets directly.

</details>

**Q62. What is a Deployment?**

<details>
<summary>Show answer</summary>

A controller for stateless apps that manages ReplicaSets to keep N replicas running and to roll out pod template changes gradually with rollback history.

</details>

**Q63. What triggers a new Deployment rollout?**

<details>
<summary>Show answer</summary>

Only changes to spec.template (image, env, resources, labels, annotations on the template). Scaling replicas does not create a new ReplicaSet.

</details>

**Q64. Explain maxSurge and maxUnavailable.**

<details>
<summary>Show answer</summary>

During a rolling update, maxSurge is how many pods may exist above the desired count, and maxUnavailable is how many may be unavailable below it. Both accept numbers or percentages.

</details>

**Q65. What is minReadySeconds?**

<details>
<summary>Show answer</summary>

How long a newly ready pod must stay ready without crashing before it counts as available. It slows rollouts slightly but catches pods that pass readiness then fail shortly after.

</details>

**Q66. What is progressDeadlineSeconds?**

<details>
<summary>Show answer</summary>

The time a Deployment may go without making progress before its Progressing condition becomes False with reason ProgressDeadlineExceeded. It doesn't roll back automatically, but tooling can react to it.

</details>

**Q67. How do you roll back a Deployment?**

<details>
<summary>Show answer</summary>

`kubectl rollout undo deployment/name`, optionally `--to-revision=N`. It scales the previous ReplicaSet back up and the current one down. In GitOps you revert the commit instead.

</details>

**Q68. What does kubectl rollout restart do?**

<details>
<summary>Show answer</summary>

It adds a restartedAt timestamp annotation to the pod template, which triggers a normal rolling update with the same spec, useful to pick up changed Secrets or ConfigMaps consumed as env vars.

</details>

**Q69. Compare RollingUpdate and Recreate strategies.**

<details>
<summary>Show answer</summary>

RollingUpdate replaces pods gradually with no downtime but briefly runs two versions. Recreate kills all old pods before starting new ones, causing downtime but guaranteeing a single version, useful for incompatible versions or RWO volumes.

</details>

**Q70. What is a StatefulSet?**

<details>
<summary>Show answer</summary>

A controller for stateful apps that gives each replica a stable ordinal name, stable DNS via a headless Service, and its own PVC from volumeClaimTemplates, with ordered start, scale and update by default.

</details>

**Q71. Why does a StatefulSet need a headless Service?**

<details>
<summary>Show answer</summary>

The headless Service (clusterIP None) governs DNS so each pod gets a stable record like pod-0.svc.ns.svc.cluster.local, which clustered apps use for peer discovery.

</details>

**Q72. What is podManagementPolicy?**

<details>
<summary>Show answer</summary>

OrderedReady (default) starts and stops pods one at a time in order; Parallel launches and terminates all pods at once while keeping stable identities.

</details>

**Q73. What is a StatefulSet partition?**

<details>
<summary>Show answer</summary>

In RollingUpdate, only pods with ordinal greater than or equal to the partition are updated. It allows canarying a new version on the highest ordinals before rolling to all.

</details>

**Q74. Do StatefulSet PVCs get deleted when you delete the StatefulSet?**

<details>
<summary>Show answer</summary>

Not by default; they're retained to protect data. persistentVolumeClaimRetentionPolicy can delete them when the StatefulSet is deleted or scaled down.

</details>

**Q75. What is a DaemonSet?**

<details>
<summary>Show answer</summary>

A controller that runs one pod on every node (or every node matching a selector), adding pods automatically as nodes join. Used for node agents like log collectors, monitoring exporters, CNI and CSI node plugins.

</details>

**Q76. How do DaemonSets run on tainted nodes?**

<details>
<summary>Show answer</summary>

Through tolerations in the pod template. The DaemonSet controller also adds some default tolerations (not-ready, unreachable, pressure conditions). To run on control plane nodes you must tolerate their taint.

</details>

**Q77. What is a Job?**

<details>
<summary>Show answer</summary>

A controller that runs pods until a specified number complete successfully, with retries up to backoffLimit and options for parallelism, indexes and failure policies.

</details>

**Q78. What is an Indexed Job?**

<details>
<summary>Show answer</summary>

A Job with completionMode Indexed where each pod gets a completion index (0..completions-1) via JOB_COMPLETION_INDEX, useful for static sharding of work.

</details>

**Q79. What is a CronJob?**

<details>
<summary>Show answer</summary>

A controller that creates Jobs on a cron schedule, with timeZone, concurrencyPolicy (Allow, Forbid, Replace), startingDeadlineSeconds, suspend, and history limits.

</details>

**Q80. What does ttlSecondsAfterFinished do?**

<details>
<summary>Show answer</summary>

It deletes a finished Job (and its pods) automatically after the given number of seconds, preventing clutter.

</details>

**Q81. What is podFailurePolicy?**

<details>
<summary>Show answer</summary>

Rules on a Job that decide what a pod failure means based on exit codes or pod conditions: FailJob, Ignore (don't count against backoffLimit, e.g. disruptions), Count, or FailIndex.

</details>

**Q82. What is the downward API?**

<details>
<summary>Show answer</summary>

A way to expose pod and container metadata (name, namespace, labels, node name, pod IP, resource limits) to containers as environment variables or files, without calling the API server.

</details>

**Q83. What is the difference between command and args in a pod spec?**

<details>
<summary>Show answer</summary>

command overrides the image ENTRYPOINT; args overrides CMD. If you set only args, the image entrypoint runs with your arguments.

</details>

**Q84. What are ephemeral containers?**

<details>
<summary>Show answer</summary>

Temporary containers added to a running pod with `kubectl debug` for troubleshooting, useful for distroless images. They can't have ports or probes and remain until the pod is deleted.

</details>

**Q85. What does terminationGracePeriodSeconds control?**

<details>
<summary>Show answer</summary>

The time between the start of pod termination (preStop then SIGTERM) and SIGKILL. Default 30 seconds.

</details>

**Q86. What are lifecycle hooks?**

<details>
<summary>Show answer</summary>

postStart runs right after a container is created (not guaranteed before the entrypoint) and preStop runs before SIGTERM during termination. preStop is commonly used to delay shutdown while endpoints are removed.

</details>

**Q87. What are the three probe types and their effects?**

<details>
<summary>Show answer</summary>

Startup probe (gates the others until the app has started; restart on failure threshold), liveness probe (restarts the container when it fails), readiness probe (removes the pod from Service endpoints when it fails without restarting).

</details>

**Q88. What probe mechanisms are available?**

<details>
<summary>Show answer</summary>

httpGet, tcpSocket, exec and grpc. Each has periodSeconds, timeoutSeconds, failureThreshold, successThreshold and initialDelaySeconds.

</details>

**Q89. Why shouldn't a liveness probe check a database?**

<details>
<summary>Show answer</summary>

If the database blips, every pod fails liveness and restarts simultaneously, amplifying a dependency issue into a full outage. Liveness should check only the process's own health; readiness can reflect dependencies.

</details>

**Q90. What is a PodDisruptionBudget?**

<details>
<summary>Show answer</summary>

A policy limiting how many pods of an application can be down due to voluntary disruptions (drains, upgrades, autoscaler scale-down), expressed as minAvailable or maxUnavailable. It's enforced through the Eviction API.

</details>

**Q91. Voluntary vs involuntary disruptions?**

<details>
<summary>Show answer</summary>

Voluntary are initiated by people or automation: drains, upgrades, scaling down. Involuntary are failures: node crash, kernel panic, OOM, hardware loss. PDBs only govern voluntary ones.

</details>

**Q92. What does a Deployment's selector have to do with its template?**

<details>
<summary>Show answer</summary>

The selector must match the template's labels, and it's immutable after creation. A mismatch is rejected by the API.

</details>

**Q93. What is revisionHistoryLimit?**

<details>
<summary>Show answer</summary>

How many old ReplicaSets a Deployment keeps for rollback (default 10). Lower values keep etcd tidy.

</details>

**Q94. What is a pod template hash?**

<details>
<summary>Show answer</summary>

A label (pod-template-hash) the Deployment controller adds to each ReplicaSet and its pods, derived from the template, so ReplicaSets of different revisions don't select each other's pods.

</details>

**Q95. How do pods get unique hostnames?**

<details>
<summary>Show answer</summary>

The hostname defaults to the pod name. StatefulSet pods get stable ordinal names, and you can set hostname and subdomain fields to create DNS records with a headless Service.

</details>

**Q96. What is shareProcessNamespace?**

<details>
<summary>Show answer</summary>

A pod setting that puts all containers in one PID namespace so they can see and signal each other's processes, useful for sidecars that reload a main process or for debugging.

</details>

**Q97. What are QoS classes?**

<details>
<summary>Show answer</summary>

Guaranteed (requests equal limits for CPU and memory in every container), Burstable (some requests or limits set), BestEffort (none). They influence eviction order under node pressure and OOM score adjustments.

</details>

**Q98. What is the difference between a Deployment and a StatefulSet for a database?**

<details>
<summary>Show answer</summary>

A Deployment's pods are interchangeable and share or recreate volumes, which breaks clustered databases. A StatefulSet gives each replica a stable identity and its own persistent volume, though replication and failover still need the database or an operator.

</details>

**Q99. What is a bare pod and why avoid it?**

<details>
<summary>Show answer</summary>

A pod created without a controller. If its node fails or it's evicted, nothing recreates it. Use Deployments, StatefulSets, DaemonSets or Jobs instead.

</details>

**Q100. How do you run a pod on a specific node?**

<details>
<summary>Show answer</summary>

Prefer nodeSelector or node affinity with node labels. spec.nodeName bypasses the scheduler entirely and should be reserved for debugging.

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
