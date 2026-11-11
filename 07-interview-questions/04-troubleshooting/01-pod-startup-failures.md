<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Troubleshooting · Pod Startup Failures

Questions 1–50 of the troubleshooting bank. Answer each one out loud before opening the answer.

---

**Q1. A pod is Pending with "0/3 nodes are available: 3 Insufficient cpu". What do you do?**

<details>
<summary>Show answer</summary>

Compare the pod's CPU request with node allocatable minus requested (`kubectl describe nodes`). Lower over-sized requests, free capacity, or add nodes; check why the autoscaler didn't scale if one exists.

</details>

**Q2. A pod is Pending with "node(s) had untolerated taint". How do you fix it?**

<details>
<summary>Show answer</summary>

Identify the taint (`kubectl describe node`), then add a matching toleration if the pod belongs there, schedule elsewhere, or remove a stale taint (e.g. left over from maintenance).

</details>

**Q3. A pod is Pending and describe shows no events at all. What could cause this?**

<details>
<summary>Show answer</summary>

The pod may reference a custom schedulerName that isn't running, the scheduler itself may be down, or the pod was just created. Check spec.schedulerName and kube-scheduler pod health.

</details>

**Q4. A pod is Pending with "pod has unbound immediate PersistentVolumeClaims". Next steps?**

<details>
<summary>Show answer</summary>

Describe the PVC: missing StorageClass, provisioner failures, no matching static PV, or quota limits. Fix the storage issue and the pod will schedule.

</details>

**Q5. A pod is Pending with "didn't match pod topology spread constraints". What do you do?**

<details>
<summary>Show answer</summary>

Check maxSkew and whenUnsatisfiable DoNotSchedule against available domains (zones/nodes). Add capacity in the missing domain, relax to ScheduleAnyway, or adjust maxSkew/minDomains.

</details>

**Q6. A container shows ErrImagePull with "manifest unknown". Cause?**

<details>
<summary>Show answer</summary>

The tag doesn't exist in that repository (typo, wrong registry path, or tag not pushed yet). Verify in the registry and correct the image reference.

</details>

**Q7. ImagePullBackOff with "pull access denied, repository does not exist or may require authorization". Fix?**

<details>
<summary>Show answer</summary>

Add a correct docker-registry Secret in the pod's namespace and reference it via imagePullSecrets (or the ServiceAccount), or grant node IAM access for cloud registries; also double-check the repository name.

</details>

**Q8. Images from Docker Hub intermittently fail with "toomanyrequests". What do you do?**

<details>
<summary>Show answer</summary>

You hit Docker Hub rate limits. Authenticate pulls, mirror images to your own registry or use a pull-through cache.

</details>

**Q9. A pod fails with "exec format error". What's wrong?**

<details>
<summary>Show answer</summary>

Architecture mismatch (amd64 image on arm64 node or vice versa) or a script without a proper shebang. Build multi-arch images or constrain scheduling to the right architecture.

</details>

**Q10. A container is in CrashLoopBackOff and `kubectl logs` shows nothing. What do you check?**

<details>
<summary>Show answer</summary>

Use `kubectl logs --previous`, check the last terminated state's exit code and reason with describe, verify command and args, and check for OOMKilled or a missing binary (exit 127).

</details>

**Q11. Exit code 127 on container start. What does it mean?**

<details>
<summary>Show answer</summary>

Command not found: the entrypoint or command in the spec points to a non-existent binary or path. Fix command/args or the image.

</details>

**Q12. Exit code 126 on start. Cause?**

<details>
<summary>Show answer</summary>

The command exists but isn't executable (permissions) or can't be executed by the current user. Fix file permissions or the entrypoint.

</details>

**Q13. A container exits with code 0 immediately and the pod restarts repeatedly. Why?**

<details>
<summary>Show answer</summary>

The process completes instead of running long-lived (e.g. a script that finishes, or a server started in background mode). Run the server in the foreground as PID 1.

</details>

**Q14. The container exits with code 1 and logs say "permission denied" writing to /app/cache after hardening. Fix?**

<details>
<summary>Show answer</summary>

readOnlyRootFilesystem or non-root user prevents writes. Mount an emptyDir at the writable path or fix ownership in the image.

</details>

**Q15. Pod shows CreateContainerConfigError: "secret not found". Fix?**

<details>
<summary>Show answer</summary>

Create the referenced Secret in the same namespace (or fix the name), check External Secrets sync status, or mark the reference optional if appropriate.

</details>

**Q16. CreateContainerConfigError: "couldn't find key X in ConfigMap". What do you do?**

<details>
<summary>Show answer</summary>

The ConfigMap exists but lacks that key. Correct the key name in the pod spec or add the key to the ConfigMap.

</details>

**Q17. CreateContainerConfigError: "container has runAsNonRoot and image will run as root". Fix?**

<details>
<summary>Show answer</summary>

Set runAsUser to a non-zero UID in the securityContext, or use an image that defines a non-root USER.

</details>

**Q18. A pod is stuck in ContainerCreating with "FailedMount ... timed out waiting for the condition". What do you check?**

<details>
<summary>Show answer</summary>

CSI node plugin pods on that node, VolumeAttachment status, cloud permissions, whether the volume is attached elsewhere, and kubelet logs on the node.

</details>

**Q19. ContainerCreating with "failed to set up sandbox container network". Cause?**

<details>
<summary>Show answer</summary>

CNI failure: CNI pods not running on the node, misconfiguration, or IP exhaustion. Check CNI DaemonSet pods and logs on that node.

</details>

**Q20. On EKS, pods are stuck with "failed to assign an IP address to container". Fix?**

<details>
<summary>Show answer</summary>

The node ran out of ENI IPs or the subnet is exhausted. Enable prefix delegation, use larger instance types or subnets, add secondary CIDRs, or reduce max pods per node.

</details>

**Q21. A pod stays Init:0/1 forever. How do you debug?**

<details>
<summary>Show answer</summary>

`kubectl logs <pod> -c <init-container>` to see what it's waiting for (often a dependency check), and describe the pod for errors.

</details>

**Q22. A pod is in Init:CrashLoopBackOff. What does it mean?**

<details>
<summary>Show answer</summary>

An init container keeps failing; app containers won't start until it succeeds. Read its logs and fix the underlying setup step.

</details>

**Q23. A container is OOMKilled right at startup. Why?**

<details>
<summary>Show answer</summary>

The memory limit is below the app's startup footprint or the runtime's default heap exceeds the limit. Raise the limit or configure heap settings.

</details>

**Q24. A pod restarts every 30 seconds but the logs look healthy. What's likely?**

<details>
<summary>Show answer</summary>

A failing liveness probe (wrong port/path, too short timeout, slow endpoint). Check describe events for "Liveness probe failed" and fix the probe.

</details>

**Q25. Readiness probe fails with "connection refused" but the app is running. Why?**

<details>
<summary>Show answer</summary>

The probe targets the wrong port, or the app listens on 127.0.0.1 instead of 0.0.0.0. Align the probe and listener.

</details>

**Q26. Probes fail only under load with "context deadline exceeded". Fix?**

<details>
<summary>Show answer</summary>

Probe timeouts are too short for the endpoint under load, often due to CPU throttling or GC. Increase timeoutSeconds, make the endpoint cheaper, and check CPU limits.

</details>

**Q27. A slow-starting app is killed before it becomes ready. Fix?**

<details>
<summary>Show answer</summary>

Add a startupProbe with enough failureThreshold × periodSeconds to cover startup, instead of a short liveness initialDelay.

</details>

**Q28. The pod shows Running but READY 1/2. What do you check?**

<details>
<summary>Show answer</summary>

Which container is not ready (`kubectl get pod -o jsonpath` on containerStatuses), then its readiness probe failures and logs; sidecars often fail readiness due to config.

</details>

**Q29. A pod is stuck in PodInitializing. What's going on?**

<details>
<summary>Show answer</summary>

Init containers completed but app containers are still being created: image pulls, volume mounts or a native sidecar waiting to start. Describe the pod for events.

</details>

**Q30. A pod was Evicted. How do you find out why?**

<details>
<summary>Show answer</summary>

`kubectl describe pod` shows the eviction message (memory, ephemeral-storage, PID pressure). Check node conditions and the pod's resource usage vs requests.

</details>

**Q31. A Job's pods keep failing and the Job never finishes. What do you check?**

<details>
<summary>Show answer</summary>

Pod logs and exit codes, backoffLimit, podFailurePolicy, activeDeadlineSeconds, and whether the work is idempotent. Fix the cause or configure failure handling.

</details>

**Q32. A Job never completes even though the main container exited 0. Why?**

<details>
<summary>Show answer</summary>

A sidecar container (proxy, log shipper) keeps running. Use native sidecars or make the sidecar exit when the main container finishes.

</details>

**Q33. A CronJob didn't run at its scheduled time. Why might that happen?**

<details>
<summary>Show answer</summary>

It may be suspended, missed its startingDeadlineSeconds, blocked by concurrencyPolicy Forbid with a long-running previous Job, a timezone mismatch, or the controller was down. Check CronJob status and events.

</details>

**Q34. A CronJob created hundreds of Jobs at once after an outage. Why?**

<details>
<summary>Show answer</summary>

Missed schedules were caught up. Set startingDeadlineSeconds and concurrencyPolicy to prevent bursts.

</details>

**Q35. A pod fails with "Error: failed to create containerd task: OCI runtime create failed". What do you check?**

<details>
<summary>Show answer</summary>

The underlying error text: invalid mounts, missing devices, seccomp/AppArmor profile issues, cgroup problems or kernel features. Check runtime logs on the node.

</details>

**Q36. A DaemonSet pod isn't running on one node. Why?**

<details>
<summary>Show answer</summary>

Node taints without tolerations, nodeSelector/affinity excluding it, insufficient resources, or the node is cordoned/NotReady. Check DaemonSet status and node details.

</details>

**Q37. A Deployment shows 0 pods and no errors in pod list. Where do you look?**

<details>
<summary>Show answer</summary>

At the ReplicaSet events: quota exceeded, admission webhook denial, Pod Security rejection, or invalid pod spec. `kubectl describe rs` shows the reason.

</details>

**Q38. Pods are rejected with "violates PodSecurity restricted". How do you fix?**

<details>
<summary>Show answer</summary>

Read the listed violations and fix the securityContext (runAsNonRoot, drop ALL capabilities, seccomp RuntimeDefault, allowPrivilegeEscalation false), or run in a namespace with an approved exception.

</details>

**Q39. A pod with a Windows container never starts on Linux nodes. Fix?**

<details>
<summary>Show answer</summary>

Add nodeSelector kubernetes.io/os: windows and tolerations for Windows node taints, and ensure Windows node pools exist.

</details>

**Q40. A container can't resolve any names right after starting, then works. Why?**

<details>
<summary>Show answer</summary>

Startup race with DNS or network readiness, or NetworkPolicy/egress delays. Add retries with backoff in the app; check CNI readiness on new nodes.

</details>

**Q41. A pod with hostPort won't schedule on a node that has capacity. Why?**

<details>
<summary>Show answer</summary>

Another pod already uses that hostPort on the node. hostPorts are exclusive per node.

</details>

**Q42. Ephemeral container attach fails with "ephemeral containers are disabled". Why?**

<details>
<summary>Show answer</summary>

Very old clusters had the feature off; on current versions it's enabled. Otherwise, the user may lack permission on pods/ephemeralcontainers.

</details>

**Q43. A pod is killed with exit code 143 during normal operation. What happened?**

<details>
<summary>Show answer</summary>

It received SIGTERM, typically from deletion, rollout, eviction or scale-down. Check events and controller activity.

</details>

**Q44. A container's command works locally with docker run but fails in Kubernetes. What differs?**

<details>
<summary>Show answer</summary>

Different user (runAsUser), read-only filesystem, missing env vars or mounted files, command/args override semantics, or resource limits. Compare spec with the docker run flags.

</details>

**Q45. A Java app's container keeps getting killed with exit code 137 but describe doesn't say OOMKilled. Why?**

<details>
<summary>Show answer</summary>

It may have exceeded terminationGracePeriodSeconds and been SIGKILLed, or a node-level OOM killed it. Check events, node dmesg and shutdown timing.

</details>

**Q46. A pod's container logs are truncated or missing old lines. Why?**

<details>
<summary>Show answer</summary>

Log rotation by the kubelet (containerLogMaxSize/MaxFiles) or the container restarted. Use centralised logging for history.

</details>

**Q47. Pods fail to start with "no space left on device". Where?**

<details>
<summary>Show answer</summary>

Node disk (images, logs, emptyDir) or imagefs is full. Clean images, fix logging, enlarge disks and set ephemeral-storage limits.

</details>

**Q48. A pod gets "Too many open files". Fix?**

<details>
<summary>Show answer</summary>

Raise file descriptor limits in the container runtime or app, fix descriptor leaks, and check node-level limits.

</details>

**Q49. An init container waiting for a Service never succeeds although the Service works from other pods. Why?**

<details>
<summary>Show answer</summary>

NetworkPolicy applies to the init container's pod labels too, or it queries the wrong namespace or port; also DNS may be blocked by egress policy.

</details>

**Q50. A pod using a projected ServiceAccount token can't call the API: "token has expired". Why?**

<details>
<summary>Show answer</summary>

The app cached the token and didn't reload the rotated file. Use a recent client library that reloads tokens automatically.

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
