<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Troubleshooting · Rollouts, Autoscaling, GitOps & Tooling

Questions 201–250 of the troubleshooting bank. Answer each one out loud before opening the answer.

---

**Q201. A Deployment rollout is stuck at "Waiting for deployment rollout to finish: 1 out of 3 new replicas have been updated". How do you debug?**

<details>
<summary>Show answer</summary>

Check the new ReplicaSet's pods: ImagePullBackOff, CrashLoopBackOff, Pending or not ready. Describe the new pods and RS, fix the cause or roll back.

</details>

**Q202. rollout status reports ProgressDeadlineExceeded. What does it mean?**

<details>
<summary>Show answer</summary>

The Deployment made no progress within progressDeadlineSeconds. It doesn't auto-rollback; investigate new pods and roll back with rollout undo if needed.

</details>

**Q203. kubectl rollout undo didn't fix the issue. Why?**

<details>
<summary>Show answer</summary>

The problem isn't in the pod template (config in a ConfigMap changed separately, a dependency broke, or infrastructure changed), or the previous revision also had the bug. Check what else changed.

</details>

**Q204. A rollout creates new pods but old pods never terminate. Why?**

<details>
<summary>Show answer</summary>

New pods aren't becoming available (readiness or minReadySeconds), so the controller won't scale down old ones under maxUnavailable constraints.

</details>

**Q205. Every deployment causes a few 502 errors. Where's the problem?**

<details>
<summary>Show answer</summary>

Graceful termination: endpoints removed after SIGTERM, missing preStop delay, app exiting immediately, or load balancer deregistration slower than shutdown.

</details>

**Q206. Pods were all restarted at once during a deploy. Why?**

<details>
<summary>Show answer</summary>

Strategy Recreate, maxUnavailable 100%, or a change to a shared ConfigMap with a checksum triggering many Deployments simultaneously.

</details>

**Q207. HPA doesn't scale even under heavy load. What do you check?**

<details>
<summary>Show answer</summary>

`kubectl describe hpa` conditions: metrics availability, missing requests, at maxReplicas, or a metric that doesn't reflect load. Also check whether new pods are Pending.

</details>

**Q208. HPA shows current CPU as 0% though pods are busy. Why?**

<details>
<summary>Show answer</summary>

metrics-server can't scrape kubelets, or the HPA targets the wrong deployment or containers. Check kubectl top and metrics-server logs.

</details>

**Q209. HPA scales up but immediately scales down again. Why?**

<details>
<summary>Show answer</summary>

Missing scale-down stabilisation, a noisy metric, or a GitOps tool resetting replicas from Git. Tune behaviour and remove replicas from manifests.

</details>

**Q210. HPA with a custom metric reports "unable to fetch metrics from custom metrics API". Fix?**

<details>
<summary>Show answer</summary>

Prometheus Adapter (or KEDA) isn't serving the metric: check its APIService, rules mapping, metric names and labels.

</details>

**Q211. KEDA isn't scaling from zero. What do you check?**

<details>
<summary>Show answer</summary>

ScaledObject status and KEDA operator logs, trigger authentication, connectivity to the event source, and activation thresholds.

</details>

**Q212. VPA recommendations look absurdly high. Why?**

<details>
<summary>Show answer</summary>

Short or unrepresentative history (spikes, startup bursts), memory leaks, or incorrect container targeting. Set maxAllowed and gather more data.

</details>

**Q213. A PDB blocks a node drain. How do you resolve it safely?**

<details>
<summary>Show answer</summary>

Check `kubectl get pdb` for allowed disruptions; scale the workload up or wait for unhealthy pods to recover, coordinate with owners, and avoid force-deleting critical pods.

</details>

**Q214. kubectl drain hangs on "evicting pod". Why?**

<details>
<summary>Show answer</summary>

A PDB allows zero disruptions, or the pod is slow to terminate. Check PDB status and pod termination progress.

</details>

**Q215. Argo CD shows "Degraded" health for a Deployment that looks fine. Why?**

<details>
<summary>Show answer</summary>

Health checks consider status conditions; a Deployment with ProgressDeadlineExceeded or unavailable replicas is degraded. Check status and events; custom health checks may also misbehave.

</details>

**Q216. Argo CD keeps reverting a manual hotfix. Why?**

<details>
<summary>Show answer</summary>

selfHeal is enabled, so the live state is reconciled back to Git. Commit the fix to Git or temporarily disable auto-sync with clear tracking.

</details>

**Q217. Argo CD can't access the Git repo. What do you check?**

<details>
<summary>Show answer</summary>

Repository credentials or SSH known hosts in Argo CD, network egress from the repo-server, and token expiry.

</details>

**Q218. Argo CD app stuck in "Progressing" forever. Why?**

<details>
<summary>Show answer</summary>

A resource never becomes healthy (e.g. a Service of type LoadBalancer pending, an Ingress without address, a custom resource without health check). Find the resource and fix it or add a health customisation.

</details>

**Q219. Flux HelmRelease fails with "install retries exhausted". How do you debug?**

<details>
<summary>Show answer</summary>

`flux get helmreleases` and `kubectl describe helmrelease` show the Helm error; check the chart values, failed hooks and pods created by the release.

</details>

**Q220. A Helm upgrade succeeded but pods didn't change. Why?**

<details>
<summary>Show answer</summary>

Only values not affecting the pod template changed, or ConfigMap changes lack checksum annotations so pods don't roll.

</details>

**Q221. helm template works but helm install fails. Why?**

<details>
<summary>Show answer</summary>

Server-side validation, admission policies, missing CRDs, existing resources, or lookup functions behaving differently against a live cluster.

</details>

**Q222. Kustomize build fails with "may not add resource with an already registered id". Fix?**

<details>
<summary>Show answer</summary>

The same resource is included twice (from multiple bases or resources lists). Remove the duplicate or use patches instead.

</details>

**Q223. A Kustomize patch isn't applied. Why?**

<details>
<summary>Show answer</summary>

The target doesn't match (name, kind, namespace after transformations), or a JSON patch path is wrong. Check the rendered output.

</details>

**Q224. Image tag updates from CI don't reach the cluster in GitOps. Where do you look?**

<details>
<summary>Show answer</summary>

Whether CI committed to the right branch and path, whether the GitOps tool detected the change (refresh, webhooks), and sync errors.

</details>

**Q225. A CronJob is creating overlapping runs. Fix?**

<details>
<summary>Show answer</summary>

Set concurrencyPolicy Forbid (or Replace) and make jobs finish within the schedule interval.

</details>

**Q226. A Job is marked Failed after a node drain. How do you prevent that?**

<details>
<summary>Show answer</summary>

Use podFailurePolicy rules ignoring DisruptionTarget conditions and set an adequate backoffLimit.

</details>

**Q227. Pods of a StatefulSet aren't updated after changing the template. Why?**

<details>
<summary>Show answer</summary>

updateStrategy OnDelete requires manual pod deletion, or a partition prevents lower ordinals from updating, or a stuck pod blocks OrderedReady progress.

</details>

**Q228. A StatefulSet scale-down is stuck. Why?**

<details>
<summary>Show answer</summary>

With OrderedReady, it waits for the highest pod to terminate and for others to be healthy; a terminating or unhealthy pod blocks it.

</details>

**Q229. After moving to a service mesh, deployments hang. Why?**

<details>
<summary>Show answer</summary>

Sidecars delay readiness or Jobs never finish with classic sidecars; injected init containers may fail due to CNI or permissions. Check mesh injection and use native sidecar support.

</details>

**Q230. Argo Rollouts canary is stuck at a pause step. Why?**

<details>
<summary>Show answer</summary>

An indefinite pause requires manual promotion, or analysis is inconclusive. Use `kubectl argo rollouts get rollout` and promote or abort.

</details>

**Q231. Argo Rollouts aborts canaries even though the app is fine. Why?**

<details>
<summary>Show answer</summary>

The analysis query is wrong (no data, wrong labels, divide by zero), thresholds are too strict, or the canary receives too little traffic for statistical significance.

</details>

**Q232. A preview environment namespace wasn't cleaned up. Why?**

<details>
<summary>Show answer</summary>

The PR-closed event wasn't processed, the ApplicationSet generator lost track, or finalizers blocked deletion. Add TTL cleanup jobs as a safety net.

</details>

**Q233. A deployment works in staging but fails in production with the same manifests. What do you compare?**

<details>
<summary>Show answer</summary>

Differences in policies (PSA, Kyverno), quotas, secrets/config values, node types and architectures, network policies, Kubernetes versions and add-on versions.

</details>

**Q234. CI's kubectl rollout status times out but the deployment eventually succeeds. Fix?**

<details>
<summary>Show answer</summary>

Increase the timeout to match realistic rollout time (replicas × readiness and minReadySeconds), or speed up rollouts with higher maxSurge.

</details>

**Q235. A Deployment's pods have mixed image versions after a failed rollout. Why?**

<details>
<summary>Show answer</summary>

The rollout stalled partway, leaving both ReplicaSets with replicas. Fix the new version or roll back to converge.

</details>

**Q236. After a rollback, a ConfigMap change still breaks pods. Why?**

<details>
<summary>Show answer</summary>

Rollback only changes the pod template. If config is in a mutable ConfigMap, it wasn't rolled back. Use versioned config to make rollbacks complete.

</details>

**Q237. kubectl diff shows changes on every run for the same manifest. Why?**

<details>
<summary>Show answer</summary>

Defaults or mutating webhooks change fields, or the manifest lacks fields set by controllers. Use server-side apply and include defaults explicitly where relevant.

</details>

**Q238. An operator isn't reconciling its custom resources. How do you debug?**

<details>
<summary>Show answer</summary>

Check operator pod logs, leader election, RBAC errors, CRD version mismatches, and the custom resource's status conditions.

</details>

**Q239. A Velero backup is PartiallyFailed. What do you check?**

<details>
<summary>Show answer</summary>

`velero backup describe --details` and logs for failed items: volume snapshot or file-system backup errors, permissions, unsupported volume types.

</details>

**Q240. A Velero restore leaves pods Pending. Why?**

<details>
<summary>Show answer</summary>

StorageClass names differ in the target cluster, volumes are in another zone or region, or the PVs failed to restore. Use storage class mapping and check restore logs.

</details>

**Q241. Pods won't start after migrating to a new cluster with Velero. Why?**

<details>
<summary>Show answer</summary>

Missing CRDs, secrets from external systems, image pull credentials, node labels/taints, or cluster-scoped resources excluded from the backup.

</details>

**Q242. A GitOps sync deleted resources unexpectedly. Why?**

<details>
<summary>Show answer</summary>

prune was enabled and the resources were removed from Git or moved to a different app, or a path change made the app stop tracking them. Use prune protections (Prune=false annotations) for critical resources.

</details>

**Q243. A Prometheus alert for a deployment fires constantly though everything works. Why?**

<details>
<summary>Show answer</summary>

Wrong labels or thresholds, stale series from old pods, or the alert expression doesn't handle scale-to-zero. Fix the query and test with historical data.

</details>

**Q244. Logs from some pods don't appear in the logging backend. Why?**

<details>
<summary>Show answer</summary>

The node agent isn't running on those nodes (taints), parsing errors drop logs, rate limits or buffer overflows, or the pods log to files instead of stdout.

</details>

**Q245. Traces are missing spans from one service. Why?**

<details>
<summary>Show answer</summary>

The service isn't instrumented or propagates context incorrectly, sampling drops spans, or its exporter can't reach the collector.

</details>

**Q246. Grafana dashboards show gaps for one cluster. Why?**

<details>
<summary>Show answer</summary>

Prometheus restarts, remote write failures, scrape timeouts, or high cardinality causing dropped samples. Check Prometheus logs and target health.

</details>

**Q247. kubectl port-forward disconnects frequently. Why?**

<details>
<summary>Show answer</summary>

Idle timeouts in proxies or load balancers in front of the API server, network instability, or the pod restarting. Use it only for debugging, not as a tunnel for production traffic.

</details>

**Q248. A new team member's kubectl commands affect the wrong cluster. How do you prevent this?**

<details>
<summary>Show answer</summary>

Prompts showing context, separate kubeconfig files per environment, kubectx tooling, confirmations for production and RBAC limiting production write access.

</details>

**Q249. A cluster upgrade broke an ingress controller with "unknown field" errors. Why?**

<details>
<summary>Show answer</summary>

The controller version is incompatible with the new Kubernetes API versions or CRDs. Upgrade the controller to a supported version.

</details>

**Q250. After enabling a new admission policy, several teams' deploys fail. How do you handle it?**

<details>
<summary>Show answer</summary>

Switch the policy to audit or warn, communicate violations with remediation guidance, set a deadline, and offer scoped exceptions where justified before enforcing again.

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
