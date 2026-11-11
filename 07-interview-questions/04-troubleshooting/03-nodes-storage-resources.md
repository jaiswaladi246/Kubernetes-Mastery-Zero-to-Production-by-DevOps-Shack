<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Troubleshooting · Nodes, Storage & Resources

Questions 101–150 of the troubleshooting bank. Answer each one out loud before opening the answer.

---

**Q101. A node is NotReady. Walk through your checks.**

<details>
<summary>Show answer</summary>

`kubectl describe node` conditions and events, lease renewal time, then on the node: kubelet and containerd status and logs, disk/memory/PID pressure, CNI readiness, network reachability to the API server, and certificate validity.

</details>

**Q102. Node condition shows "PLEG is not healthy". What does it mean?**

<details>
<summary>Show answer</summary>

The kubelet's pod lifecycle event generator can't get container states from the runtime in time, often due to an overloaded or hung runtime or too many containers. Investigate containerd, node load and disk I/O.

</details>

**Q103. A node shows NetworkPluginNotReady. Fix?**

<details>
<summary>Show answer</summary>

The CNI on that node isn't initialised: check CNI DaemonSet pods, CNI config files in /etc/cni/net.d, and their logs.

</details>

**Q104. Many pods are being evicted with MemoryPressure on one node. What do you do?**

<details>
<summary>Show answer</summary>

Find pods using more memory than requested, rightsize requests to stop overcommit, move heavy pods, and set kube-reserved/system-reserved and eviction thresholds properly.

</details>

**Q105. Nodes show DiskPressure repeatedly. Causes and fixes?**

<details>
<summary>Show answer</summary>

Image accumulation, container logs, large emptyDirs or writable layers. Tune image GC, log rotation, ephemeral-storage limits and sizeLimit, and increase disk size.

</details>

**Q106. The kubelet fails to start after an OS update. What do you check?**

<details>
<summary>Show answer</summary>

journalctl -u kubelet for errors: swap re-enabled, cgroup driver mismatch, removed flags, containerd config changes, or certificate issues.

</details>

**Q107. kubelet logs show "failed to run Kubelet: running with swap on is not supported". Fix?**

<details>
<summary>Show answer</summary>

Disable swap (swapoff -a and fstab) or configure the kubelet for swap support deliberately with failSwapOn false and a swap behaviour setting.

</details>

**Q108. kubelet logs show cgroup driver mismatch errors. Fix?**

<details>
<summary>Show answer</summary>

Make containerd's SystemdCgroup setting and the kubelet's cgroupDriver match (systemd recommended), then restart both.

</details>

**Q109. A node is Ready but pods on it can't pull images. Why?**

<details>
<summary>Show answer</summary>

Node network or DNS issues, registry credentials missing on that node (IAM role), disk full, or proxy settings.

</details>

**Q110. Pods take 5 minutes to move off a dead node. Why and can you speed it up?**

<details>
<summary>Show answer</summary>

Default tolerations for not-ready and unreachable taints are 300 seconds. Lower tolerationSeconds for critical workloads (carefully) and rely on replicas so traffic shifts immediately.

</details>

**Q111. A PVC is Pending with "waiting for first consumer to be created before binding". Is it a problem?**

<details>
<summary>Show answer</summary>

No, that's WaitForFirstConsumer working as designed. It binds once a pod using it is scheduled.

</details>

**Q112. A PVC is Pending with "storageclass not found". Fix?**

<details>
<summary>Show answer</summary>

Use an existing StorageClass name, create the class, or set a default StorageClass and omit storageClassName.

</details>

**Q113. PVC provisioning fails with "UnauthorizedOperation" on AWS. Fix?**

<details>
<summary>Show answer</summary>

The EBS CSI driver's IAM role lacks permissions. Attach the correct policy to its ServiceAccount role (Pod Identity or IRSA).

</details>

**Q114. A pod fails to mount a volume with "Multi-Attach error". Fix?**

<details>
<summary>Show answer</summary>

An RWO volume is attached to another node. Ensure the old pod is gone; if the node is dead, use the out-of-service taint or delete the node to force detach; avoid RWO volumes with rolling updates across nodes.

</details>

**Q115. A pod mounting an NFS volume hangs on termination. Why?**

<details>
<summary>Show answer</summary>

Hard NFS mounts block when the server is unreachable; the kubelet can't unmount. Restore the server, use appropriate mount options, or reboot the node.

</details>

**Q116. Volume expansion was requested but the size inside the pod didn't change. Why?**

<details>
<summary>Show answer</summary>

The filesystem resize may be pending until the pod restarts for some drivers (FileSystemResizePending condition), or the StorageClass doesn't allow expansion.

</details>

**Q117. A StatefulSet pod is stuck Pending with "volume node affinity conflict". Fix?**

<details>
<summary>Show answer</summary>

Its PV is in a zone with no available nodes. Add capacity in that zone or restore data into a new volume in another zone.

</details>

**Q118. A pod is stuck ContainerCreating because a Secret volume is missing. Fix?**

<details>
<summary>Show answer</summary>

Create the Secret in the pod's namespace or correct the name; check whether a secret manager sync failed.

</details>

**Q119. A container is CPU-throttled heavily. How do you prove it?**

<details>
<summary>Show answer</summary>

Check cpu.stat in the container's cgroup (nr_throttled, throttled_usec) or Prometheus container_cpu_cfs_throttled_periods_total versus periods.

</details>

**Q120. kubectl top shows "metrics not available". Why?**

<details>
<summary>Show answer</summary>

metrics-server isn't installed or healthy, the APIService isn't available, or the kubelet's metrics endpoint isn't reachable (TLS issues on self-managed clusters).

</details>

**Q121. Node memory usage is high but pods' usage seems low. What else uses memory?**

<details>
<summary>Show answer</summary>

System daemons, kernel page cache and slab, the kubelet and runtime, and non-Kubernetes processes. Check kube-reserved/system-reserved and node-exporter metrics.

</details>

**Q122. Pods get OOMKilled even though the node has free memory. Why?**

<details>
<summary>Show answer</summary>

Container memory limits are per container; exceeding its own limit triggers OOM regardless of node free memory.

</details>

**Q123. The node OOM killer kills random processes including the kubelet. Fix?**

<details>
<summary>Show answer</summary>

Memory overcommit: requests far below usage. Set realistic requests, reserve memory for system components and set eviction thresholds so the kubelet evicts before the kernel OOMs.

</details>

**Q124. Pods fail with "Insufficient ephemeral-storage". Fix?**

<details>
<summary>Show answer</summary>

Lower ephemeral-storage requests, free node disk, or use nodes with larger disks; check what's consuming disk.

</details>

**Q125. The cluster autoscaler doesn't add a node though pods are Pending. What do you check first?**

<details>
<summary>Show answer</summary>

Autoscaler logs for why no node group can fit the pod (max size, quotas, constraints, unsupported resources like specific GPU types) and that Pending is resource-related.

</details>

**Q126. Karpenter isn't launching nodes. How do you debug?**

<details>
<summary>Show answer</summary>

Check Karpenter logs, NodePool requirements and limits, EC2NodeClass configuration (subnets, security groups, AMIs), IAM permissions and whether pod constraints match any NodePool.

</details>

**Q127. Nodes created by the autoscaler stay NotReady. Why?**

<details>
<summary>Show answer</summary>

Bootstrap failures (user data, AMI issues), CNI not starting (IP exhaustion), wrong security groups preventing API server contact, or missing IAM permissions for node registration.

</details>

**Q128. A node can't join the cluster with "Unauthorized". Fix?**

<details>
<summary>Show answer</summary>

Bootstrap token expired or wrong, node IAM role not mapped (EKS access entries), or CSR not approved. Generate a new token or fix identity mapping.

</details>

**Q129. Pending CSRs pile up. What does it mean?**

<details>
<summary>Show answer</summary>

Kubelet serving or client certificate requests aren't approved automatically. Configure auto-approval for kubelet client CSRs and approve serving certs as per policy.

</details>

**Q130. Pods on a specific node run much slower than elsewhere. Causes?**

<details>
<summary>Show answer</summary>

Noisy neighbour pods, CPU throttling, disk I/O saturation, different instance type, thermal throttling or kernel issues. Compare node metrics.

</details>

**Q131. A GPU pod is Pending with "Insufficient nvidia.com/gpu". Fix?**

<details>
<summary>Show answer</summary>

GPU nodes aren't present or the device plugin isn't advertising GPUs (driver issues). Check node allocatable for nvidia.com/gpu and the GPU operator pods.

</details>

**Q132. A GPU pod starts but can't see the GPU. Why?**

<details>
<summary>Show answer</summary>

Wrong container image (CUDA mismatch), the NVIDIA container runtime isn't configured, or the pod didn't request the GPU resource.

</details>

**Q133. The kubelet reports "image garbage collection failed". Fix?**

<details>
<summary>Show answer</summary>

Disk is full of images in use or the threshold settings are too tight. Free space, enlarge disks or adjust imageGCHighThresholdPercent.

</details>

**Q134. Node clocks are drifting and TLS fails intermittently. Fix?**

<details>
<summary>Show answer</summary>

Ensure NTP/chrony runs on all nodes; TLS and token validation are time-sensitive.

</details>

**Q135. Static pods on a control plane node aren't running after a manifest edit. Why?**

<details>
<summary>Show answer</summary>

Syntax errors in the manifest; the kubelet can't parse it. Check kubelet logs and validate YAML.

</details>

**Q136. A node has many pods stuck Terminating after a network blip. What do you do?**

<details>
<summary>Show answer</summary>

Check node connectivity; once the kubelet reconnects, pods finalise. If the node is gone, force-delete pods after confirming they aren't running.

</details>

**Q137. Container runtime is unresponsive on a node. How do you recover?**

<details>
<summary>Show answer</summary>

Cordon and drain if possible, restart containerd, check disk and kernel issues, and replace the node if problems persist.

</details>

**Q138. The node shows PIDPressure. Fix?**

<details>
<summary>Show answer</summary>

Find processes forking excessively (leaks, fork bombs), set podPidsLimit, and fix the offending application.

</details>

**Q139. Pods can't write to a volume due to permission denied. Fix?**

<details>
<summary>Show answer</summary>

Set fsGroup or runAsUser/runAsGroup matching volume ownership, use fsGroupChangePolicy, or fix permissions with an init container in a permitted context.

</details>

**Q140. A snapshot restore produced an empty volume. Why?**

<details>
<summary>Show answer</summary>

The snapshot was taken from the wrong PVC, the application hadn't flushed data (crash-consistency), or the restore used a different StorageClass/driver incorrectly.

</details>

**Q141. Volume attach takes very long on new nodes. Why?**

<details>
<summary>Show answer</summary>

Cloud API throttling, attach limits per instance reached, or CSI controller backlog. Check CSI logs and instance volume limits.

</details>

**Q142. Pods are evicted every time a large batch job runs. Fix?**

<details>
<summary>Show answer</summary>

Isolate batch on separate tainted nodes, set correct requests so the scheduler accounts for usage, and use PriorityClasses to protect critical pods.

</details>

**Q143. A Windows node is NotReady. Any Windows-specific checks?**

<details>
<summary>Show answer</summary>

Kubelet and containerd services on Windows, CNI (e.g. Calico or Azure CNI Windows) status, and logs under C:\k or event logs.

</details>

**Q144. A pod's local disk usage grows forever. Where do you look?**

<details>
<summary>Show answer</summary>

Writable container layer (files written outside volumes), log files inside the container, and emptyDirs. Use ephemeral-storage limits and fix the app to write to stdout or volumes.

</details>

**Q145. After resizing a node group to larger instances, pods still don't fit. Why?**

<details>
<summary>Show answer</summary>

Allocatable may not have increased as expected (max pods limits, reserved resources), or pod constraints still target old labels.

</details>

**Q146. Some nodes ignore new kubelet configuration. Why?**

<details>
<summary>Show answer</summary>

Configuration is only applied on node bootstrap in many setups; old nodes need replacement or a kubelet restart with updated config.

</details>

**Q147. Kubelet logs show "Failed to garbage collect required amount of images". Impact?**

<details>
<summary>Show answer</summary>

Disk pressure may persist and evictions occur. Free space or increase disk; check for large images.

</details>

**Q148. A pod uses much more memory than its working set suggests. Which metric is right?**

<details>
<summary>Show answer</summary>

The OOM killer and eviction use working set (memory usage minus inactive file cache). RSS and cache numbers can mislead; use container_memory_working_set_bytes.

</details>

**Q149. A DaemonSet rollout is stuck at some nodes. Why?**

<details>
<summary>Show answer</summary>

maxUnavailable reached because some pods aren't becoming ready on certain nodes (resource limits, node-specific issues). Investigate those pods.

</details>

**Q150. After a node reboot, pods using local PVs don't start. Why?**

<details>
<summary>Show answer</summary>

The local disk path or mount changed, or the disk didn't remount. Check node mounts and the local PV path.

</details>

---

← [Troubleshooting index](README.md) · [All interview banks](../README.md)

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
