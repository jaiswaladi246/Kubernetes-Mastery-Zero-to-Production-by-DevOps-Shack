<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Scenario-Based · Deployments, Rollouts & Releases

Questions 1–50 of the scenario-based bank. Answer each one out loud before opening the answer.

---

**Q1. You push a new image and the rollout hangs with new pods in ImagePullBackOff. Users are fine. What's happening and what do you do?**

<details>
<summary>Show answer</summary>

With maxUnavailable 0 the old ReplicaSet keeps serving while new pods can't pull. Check `kubectl describe pod` for the pull error (tag typo, auth, rate limit), then either fix the image reference or `kubectl rollout undo`. Make CI wait on `rollout status` with a timeout so this is caught automatically.

</details>

**Q2. A deploy went out and error rates jumped. How do you roll back fastest?**

<details>
<summary>Show answer</summary>

`kubectl rollout undo deployment/<name>` (or `--to-revision`), or in GitOps revert the commit and sync. Then confirm with `rollout status` and metrics. Investigate afterwards using the bad ReplicaSet's logs.

</details>

**Q3. You need to change five things in a Deployment but want only one rollout. How?**

<details>
<summary>Show answer</summary>

`kubectl rollout pause deployment/x`, apply all changes, then `kubectl rollout resume`. Or apply a single updated manifest containing all changes at once.

</details>

**Q4. Users report errors for a few seconds during every rolling update even though readiness probes exist. Why?**

<details>
<summary>Show answer</summary>

Termination races endpoint removal: pods get SIGTERM while load balancers and kube-proxy still route to them. Add a preStop sleep, handle SIGTERM gracefully by draining, set terminationGracePeriodSeconds above preStop plus drain time, and keep maxUnavailable 0.

</details>

**Q5. A new version passes readiness but crashes 20 seconds later, after the rollout already finished. How do you protect against that?**

<details>
<summary>Show answer</summary>

Set minReadySeconds so pods must stay ready for a while before counting as available, improve readiness to reflect real health, and use canary analysis to catch post-start failures before full rollout.

</details>

**Q6. Your database migration isn't backward compatible. How do you deploy?**

<details>
<summary>Show answer</summary>

Prefer expand and contract: add new columns/tables compatible with the old code, deploy code that works with both, migrate data, then remove old structures in a later release. If impossible, use a Recreate strategy with a maintenance window and a migration Job or hook.

</details>

**Q7. You need to ship a fix to production in 10 minutes, but rollouts of 40 replicas take 20 minutes. What can you change safely?**

<details>
<summary>Show answer</summary>

Increase maxSurge (e.g. 50-100%) while keeping maxUnavailable 0, assuming spare capacity or fast node autoscaling, and reduce minReadySeconds if it's very high. Make sure probes still gate traffic.

</details>

**Q8. Two teams changed the same Deployment: CI updates the image and an engineer scaled it manually. GitOps keeps undoing the scale. What's the right model?**

<details>
<summary>Show answer</summary>

Decide ownership. Replicas should be owned by the HPA (remove replicas from Git) or by Git (no manual scaling). Use server-side apply field ownership or Argo CD ignoreDifferences for fields managed by controllers.

</details>

**Q9. You want to test a new version with 5% of real traffic. What options do you have?**

<details>
<summary>Show answer</summary>

Weighted routing with Gateway API HTTPRoute backendRefs, a service mesh, or Argo Rollouts/Flagger canaries. A crude option is running 1 canary pod next to 19 stable pods behind the same Service.

</details>

**Q10. A canary looks fine on averages but some users complain. How do you analyse it properly?**

<details>
<summary>Show answer</summary>

Compare canary vs stable on the same SLIs (error rate, p95/p99 latency) segmented by version labels, look at specific endpoints and tenants, and use automated analysis with clear thresholds rather than eyeballing averages.

</details>

**Q11. You need instant rollback capability for a payment service release. Which strategy?**

<details>
<summary>Show answer</summary>

Blue-green: deploy green alongside blue, test via a preview Service, switch traffic by changing the Service selector or route, and switch back instantly if needed. Keep blue running until confidence is high.

</details>

**Q12. After a rollback, the bad version comes back on the next GitOps sync. Why?**

<details>
<summary>Show answer</summary>

Git still contains the bad version; the agent reconciles to Git. Roll back by reverting the commit (or pinning the previous tag) in Git, not just in the cluster.

</details>

**Q13. A StatefulSet upgrade must be tested on one replica first. How?**

<details>
<summary>Show answer</summary>

Set updateStrategy.rollingUpdate.partition to the highest ordinal so only that pod updates, verify it, then lower the partition step by step to zero.

</details>

**Q14. You changed a ConfigMap but pods still use old values. What do you do?**

<details>
<summary>Show answer</summary>

If consumed as env vars, restart pods (`kubectl rollout restart`). For a lasting fix, version ConfigMap names or add a checksum annotation to the pod template so config changes trigger rollouts automatically.

</details>

**Q15. A rollout is stuck because new pods are Pending with insufficient CPU. What are your options?**

<details>
<summary>Show answer</summary>

Lower maxSurge or allow maxUnavailable temporarily, right-size requests, add nodes or fix the autoscaler, or free capacity by scaling down non-critical workloads.

</details>

**Q16. A team deploys with :latest and two pods run different code. How do you fix this practice?**

<details>
<summary>Show answer</summary>

Use immutable tags (git SHA or semver) or digests, enforce it with an admission policy that rejects latest, and set imagePullPolicy appropriately. Promote the same digest across environments.

</details>

**Q17. You must run a one-time data fix against production. How do you do it safely in Kubernetes?**

<details>
<summary>Show answer</summary>

Run a Job with the app image and a specific command, using the app's ServiceAccount and config, with resource limits, backoffLimit 0 or small, logs captured, and ideally a dry-run mode first. Commit the Job manifest for audit.

</details>

**Q18. A Deployment shows 3/3 ready but the Service returns 503 from the ingress. Where do you look?**

<details>
<summary>Show answer</summary>

Check that the Service selector and targetPort match the pods, that EndpointSlices list ready addresses, that the Ingress or route references the right Service and port, and read the ingress controller logs for upstream errors.

</details>

**Q19. You need to deploy the same app to dev, staging and prod with different replicas, resources and hosts. How do you structure it?**

<details>
<summary>Show answer</summary>

A Helm chart with per-environment values files, or a Kustomize base with overlays, stored in Git and deployed by GitOps per environment.

</details>

**Q20. A Helm upgrade fails halfway and now says another operation is in progress. What do you do?**

<details>
<summary>Show answer</summary>

Inspect `helm history`; the release is stuck in pending-upgrade. Roll back to the last deployed revision with `helm rollback`, and use `--atomic` and timeouts for future upgrades.

</details>

**Q21. Your rollout needs to run database migrations before new pods start. How do you sequence it?**

<details>
<summary>Show answer</summary>

Use a Helm pre-upgrade hook Job, an Argo CD PreSync hook or sync wave, or an init container in the new pods if migrations are idempotent and safe to run concurrently (often with a lock).

</details>

**Q22. You want every PR to have its own running environment. How?**

<details>
<summary>Show answer</summary>

Create a namespace per PR, deploy the PR image via CI or an Argo CD ApplicationSet pull request generator, post the URL to the PR, apply quotas, and delete the namespace when the PR closes.

</details>

**Q23. A rollback is needed but the previous image was deleted from the registry by a retention policy. What now?**

<details>
<summary>Show answer</summary>

Rebuild from the previous Git commit and redeploy. Prevent recurrence by protecting images that are or were recently deployed from retention rules and promoting by digest.

</details>

**Q24. How would you deploy a change to 50 clusters safely?**

<details>
<summary>Show answer</summary>

Use GitOps with an ApplicationSet or Flux per cluster, roll out in waves (canary cluster, then regions), gate each wave on health checks and SLOs, and keep a quick revert path.

</details>

**Q25. Your app needs 60 seconds to warm caches before serving. How do you deploy without latency spikes?**

<details>
<summary>Show answer</summary>

Make readiness fail until warm-up completes (use a startup probe for boot), keep maxUnavailable 0, and consider pre-warming via an init step. Gradual canaries help too.

</details>

**Q26. You deployed an app, but kubectl apply reports "field is immutable" on a Deployment selector. What do you do?**

<details>
<summary>Show answer</summary>

Selectors can't change. Create a new Deployment with the new selector (and shift traffic), or delete and recreate the Deployment (with downtime unless traffic is moved first).

</details>

**Q27. A Deployment has 10 replicas and you need to rotate a Secret it reads as an env var. How do you minimise risk?**

<details>
<summary>Show answer</summary>

Support both old and new credentials temporarily, update the Secret, then `kubectl rollout restart` so pods pick it up gradually. Revoke the old credential after the rollout finishes.

</details>

**Q28. You need different behaviour for a small group of beta users. How can Kubernetes help?**

<details>
<summary>Show answer</summary>

Route by header or cookie with Gateway API HTTPRoute matches or a mesh to a separate beta Deployment, or use feature flags in the app. Keep the beta backend isolated with its own Service.

</details>

**Q29. CI runs `kubectl apply` with cluster-admin credentials. What would you change?**

<details>
<summary>Show answer</summary>

Move to GitOps so CI only writes to Git, or give CI a ServiceAccount with a namespaced least-privilege Role and short-lived tokens via OIDC federation. Remove static admin kubeconfigs.

</details>

**Q30. A team wants to deploy a quick hotfix by editing the live Deployment. What's your response?**

<details>
<summary>Show answer</summary>

In GitOps that edit will be reverted or cause drift. Make the change in Git (a fast-tracked PR), or temporarily pause auto-sync for that app with a clear record, then reconcile Git immediately.

</details>

**Q31. How do you make sure a deploy is verified before it's declared successful?**

<details>
<summary>Show answer</summary>

CI/CD waits for rollout status, runs smoke tests against the new version, checks key metrics or uses automated canary analysis, and only then marks success. Failures trigger rollback.

</details>

**Q32. The previous ReplicaSet has 0 replicas and 50 old ReplicaSets clutter the namespace. Fix it.**

<details>
<summary>Show answer</summary>

Set revisionHistoryLimit (e.g. 5) on Deployments. The controller deletes old ReplicaSets beyond the limit.

</details>

**Q33. A rollout restarted all pods at once and caused a short outage. Why might that happen?**

<details>
<summary>Show answer</summary>

The strategy might be Recreate, maxUnavailable may be 100% or large, the PDB may be missing, or readiness may pass instantly. Fix strategy settings and add proper readiness.

</details>

**Q34. Your new version must not run alongside the old one even for a moment. How do you deploy?**

<details>
<summary>Show answer</summary>

Use the Recreate strategy, accepting a brief downtime, or blue-green with a hard switch where the old version stops serving before the new one starts.

</details>

**Q35. An app uses a ReadWriteOnce volume and its Deployment rollouts hang. Why?**

<details>
<summary>Show answer</summary>

The new pod may be scheduled on a different node and can't attach the disk still held by the old pod. Use Recreate, a StatefulSet, or RWX storage.

</details>

**Q36. A Job you deploy with every release keeps failing on reruns because it already exists. What's the fix?**

<details>
<summary>Show answer</summary>

Jobs are immutable in key fields. Give each run a unique name (include a revision), delete it before re-creating, use ttlSecondsAfterFinished, or use Helm/Argo hooks with delete policies.

</details>

**Q37. You want to slow down a rollout to observe each step. How?**

<details>
<summary>Show answer</summary>

Use small maxSurge/maxUnavailable, a larger minReadySeconds, pause and resume manually, or use Argo Rollouts canary steps with pauses and analysis.

</details>

**Q38. Release notes for a new version require a new environment variable. How do you avoid breaking pods if it's missing?**

<details>
<summary>Show answer</summary>

Deploy config before code (ConfigMap or Secret first), make the app fail fast with a clear error, and use admission or CI validation that required keys exist.

</details>

**Q39. How would you roll out a change to a DaemonSet running on 500 nodes?**

<details>
<summary>Show answer</summary>

Use RollingUpdate with maxUnavailable as a small percentage (or maxSurge for supported cases), monitor node agent health per batch, and pause or roll back on failures.

</details>

**Q40. Your app's new version needs more memory. What do you change and how do you validate?**

<details>
<summary>Show answer</summary>

Increase memory requests and limits in the manifest based on load tests, deploy with a canary, and watch working set vs limit and OOMKill counts before full rollout.

</details>

**Q41. An engineer accidentally deleted a Deployment in production. How do you recover?**

<details>
<summary>Show answer</summary>

Re-apply from Git (or let GitOps resync immediately), check that dependent objects are intact, and investigate RBAC so humans can't delete production workloads directly.

</details>

**Q42. You need to roll back a Helm release including its hooks. What should you check?**

<details>
<summary>Show answer</summary>

`helm rollback` re-applies the previous manifests; hooks run according to their annotations (pre/post-rollback). Verify database migration hooks are safe to run or skip in reverse.

</details>

**Q43. Deployments are slow because images are 2 GB. What do you do?**

<details>
<summary>Show answer</summary>

Shrink images (multi-stage builds, distroless, remove build tools), use layer caching and smaller base images, pre-pull on nodes for critical images, or use lazy-loading image formats where supported.

</details>

**Q44. How do you deploy a configuration change only to one region's cluster first?**

<details>
<summary>Show answer</summary>

In GitOps, structure per-cluster overlays and change only that cluster's overlay, verify, then promote the change to other clusters via PRs or ApplicationSet progressive sync.

</details>

**Q45. A deployment depends on a CRD that doesn't exist yet. How do you order it?**

<details>
<summary>Show answer</summary>

Install CRDs first (sync wave -1 or a separate Application), then the controller, then custom resources. Helm puts CRDs in the crds/ directory for first install.

</details>

**Q46. You must deploy an app that listens on port 80 but runs as non-root. How?**

<details>
<summary>Show answer</summary>

Configure the app to listen on a high port (e.g. 8080) and map Service port 80 to it, or add the NET_BIND_SERVICE capability, which restricted Pod Security allows.

</details>

**Q47. Your rolling update creates new pods but they can't reach a new backend service yet. How do you avoid traffic failures?**

<details>
<summary>Show answer</summary>

Deploy dependencies first, make readiness reflect dependency availability for that path, or feature-flag the new behaviour until the backend is live.

</details>

**Q48. A team wants automatic deploys to production on every merge. What guardrails do you put in?**

<details>
<summary>Show answer</summary>

Automated tests, image scanning and signing, policy checks on manifests, progressive delivery with automatic analysis and rollback, SLO-based freezes, and audit trails through GitOps.

</details>

**Q49. The HPA scaled a Deployment to 20 and then your manual apply set replicas back to 3. What happened?**

<details>
<summary>Show answer</summary>

The manifest's replicas field overwrote the HPA's value. Remove replicas from the manifest when an HPA manages the workload.

</details>

**Q50. How do you deploy a Windows workload into a mixed cluster?**

<details>
<summary>Show answer</summary>

Add Windows node pools, select them with nodeSelector kubernetes.io/os: windows (and taints/tolerations), and use Windows-compatible images. Linux-only DaemonSets need os selectors to avoid Windows nodes.

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
