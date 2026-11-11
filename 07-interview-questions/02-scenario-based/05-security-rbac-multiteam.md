<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Scenario-Based · Security, RBAC & Multi-Team

Questions 201–250 of the scenario-based bank. Answer each one out loud before opening the answer.

---

**Q201. A developer needs to view logs in production but shouldn't change anything. What access do you give?**

<details>
<summary>Show answer</summary>

A RoleBinding in the app's namespace to the view ClusterRole plus get on pods/log, bound to their SSO group, with no Secrets access. Add exec only if justified, and audit it.

</details>

**Q202. CI needs to deploy to one namespace. How do you set up access?**

<details>
<summary>Show answer</summary>

A ServiceAccount with a Role allowing update/patch on the needed resources in that namespace only, short-lived tokens (or OIDC federation), and no cluster-wide rights. Better still, use GitOps so CI never touches the cluster.

</details>

**Q203. You found a ClusterRoleBinding granting cluster-admin to system:authenticated. What do you do?**

<details>
<summary>Show answer</summary>

Treat it as a critical incident: remove the binding, audit logs for misuse, rotate exposed credentials, and add policy preventing such bindings.

</details>

**Q204. A user with create pods permission says they can't read Secrets. Are they right?**

<details>
<summary>Show answer</summary>

No. They can create a pod that mounts any Secret in the namespace or uses any ServiceAccount there, then read it. Pod creation is effectively Secret access within that namespace.

</details>

**Q205. You must enforce that no container runs as root in a namespace. How?**

<details>
<summary>Show answer</summary>

Label the namespace with Pod Security enforce=restricted, which requires runAsNonRoot among other controls. For finer rules use ValidatingAdmissionPolicy or Kyverno.

</details>

**Q206. A third-party chart fails under restricted Pod Security. What are your options?**

<details>
<summary>Show answer</summary>

Configure the chart's securityContext values to comply, patch it with Kustomize post-rendering, ask the vendor, or run it in a dedicated namespace with baseline enforcement and compensating controls.

</details>

**Q207. How do you prevent images from untrusted registries?**

<details>
<summary>Show answer</summary>

An admission policy (ValidatingAdmissionPolicy, Kyverno or Gatekeeper) allowing only approved registries, ideally plus signature verification.

</details>

**Q208. A security scan finds a critical CVE in a base image used by 40 services. How do you respond?**

<details>
<summary>Show answer</summary>

Identify affected images via SBOMs or registry scanning, rebuild on a patched base through CI, roll out by priority, and verify with rescans. Add continuous scanning to catch it earlier.

</details>

**Q209. Someone opened a shell in a production container. How would you detect it?**

<details>
<summary>Show answer</summary>

Runtime security like Falco or Tetragon alerting on shells in containers, plus audit logs for pods/exec requests showing who did it.

</details>

**Q210. How do you give a pod AWS permissions without static keys?**

<details>
<summary>Show answer</summary>

EKS Pod Identity or IRSA: associate the pod's ServiceAccount with an IAM role that has least-privilege policies.

</details>

**Q211. A pod is compromised. How do you limit blast radius in advance?**

<details>
<summary>Show answer</summary>

Least-privilege ServiceAccount with no token automount if unused, NetworkPolicies restricting egress, non-root and read-only filesystems, dropped capabilities, no host access, workload identity scoped to that app, and secrets scoped per app.

</details>

**Q212. How do you make sure every namespace has a default-deny network policy?**

<details>
<summary>Show answer</summary>

Generate it automatically on namespace creation (Kyverno generate rules, namespace provisioning templates via GitOps), and audit for namespaces missing it.

</details>

**Q213. Auditors ask who deleted a Deployment last Tuesday. How do you answer?**

<details>
<summary>Show answer</summary>

From API server audit logs (shipped to central logging) filtering verb delete on that resource; GitOps history shows declared changes too.

</details>

**Q214. How do you onboard a new team to a shared cluster?**

<details>
<summary>Show answer</summary>

Create their namespaces from a template with labels, quota, LimitRange, default-deny policies, Pod Security labels, RoleBindings to their SSO groups and monitoring/logging routing, all via GitOps.

</details>

**Q215. Two teams need complete isolation including their own CRDs. What do you recommend?**

<details>
<summary>Show answer</summary>

Separate clusters or virtual clusters (vCluster). Namespaces can't isolate cluster-scoped resources like CRDs and webhooks.

</details>

**Q216. A webhook from a security tool is blocking all deployments because its pods are down. How do you recover?**

<details>
<summary>Show answer</summary>

Restore the webhook pods if possible; otherwise temporarily set failurePolicy Ignore or exclude namespaces, recover, then revert. Prevent it with HA, PDBs and namespace exclusions.

</details>

**Q217. How do you secure the Kubernetes API endpoint of a managed cluster?**

<details>
<summary>Show answer</summary>

Private endpoint or IP allowlist, SSO-based authentication with MFA, least-privilege RBAC, audit logging, and no long-lived admin credentials.

</details>

**Q218. How do you protect etcd data in a self-managed cluster?**

<details>
<summary>Show answer</summary>

Encryption at rest (KMS), mTLS between etcd and API servers, restricted network access to etcd ports, encrypted off-cluster backups, and limited node access.

</details>

**Q219. A team wants privileged pods for a debugging tool. What do you do?**

<details>
<summary>Show answer</summary>

Avoid it in shared namespaces; use kubectl debug node with tightly controlled access, or a dedicated privileged namespace with RBAC limited to platform engineers and audit logging.

</details>

**Q220. How do you ensure only signed images run in production?**

<details>
<summary>Show answer</summary>

Sign images in CI with cosign (keyless via OIDC), and verify signatures and attestations at admission with Kyverno verifyImages or Sigstore policy-controller.

</details>

**Q221. You need to rotate the cluster CA. What's involved?**

<details>
<summary>Show answer</summary>

A planned multi-step process: distribute the new CA alongside the old, reissue component and kubelet certificates, update kubeconfigs and ServiceAccount token signing keys carefully, then remove the old CA. Managed services provide their own rotation features.

</details>

**Q222. A ServiceAccount token was leaked from a CI log. What do you do?**

<details>
<summary>Show answer</summary>

Delete the token or ServiceAccount (legacy secrets), rotate credentials, review audit logs for its use, move to short-lived tokens or OIDC federation, and mask secrets in CI logs.

</details>

**Q223. How do you stop pods from using the default ServiceAccount?**

<details>
<summary>Show answer</summary>

Create dedicated ServiceAccounts per workload, set automountServiceAccountToken false on the default SA, and add a policy requiring a non-default serviceAccountName.

</details>

**Q224. How do you implement multi-tenancy fairly in one cluster?**

<details>
<summary>Show answer</summary>

Namespaces per tenant with quotas, LimitRanges, PriorityClasses, network policies, RBAC, separate node pools for noisy tenants, and API Priority and Fairness for API fairness.

</details>

**Q225. A tenant created an Ingress for another tenant's hostname. How do you prevent this?**

<details>
<summary>Show answer</summary>

Use Gateway API listeners with hostname restrictions per namespace, or an admission policy validating hostnames against tenant ownership.

</details>

**Q226. How do you control egress to the internet for compliance?**

<details>
<summary>Show answer</summary>

Default-deny egress policies, allowlisted destinations via FQDN-capable CNI policies or an egress proxy/gateway, and logging of egress flows.

</details>

**Q227. How would you rotate secrets automatically every 30 days?**

<details>
<summary>Show answer</summary>

Store them in a vault with rotation (AWS Secrets Manager rotation, Vault dynamic secrets), sync with External Secrets, and roll pods automatically on change.

</details>

**Q228. You need to prove to auditors that pods meet CIS benchmarks. How?**

<details>
<summary>Show answer</summary>

Run kube-bench for node and control plane checks, Kubescape or Trivy for workload posture, export reports regularly and track remediation.

</details>

**Q229. An engineer needs temporary admin access during an incident. How do you handle it?**

<details>
<summary>Show answer</summary>

Break-glass access via a time-bound role assignment (approval workflow), MFA, full audit logging and automatic expiry, reviewed after the incident.

</details>

**Q230. How do you prevent containers from reaching the node's kubelet API?**

<details>
<summary>Show answer</summary>

Kubelet authentication and authorization (webhook mode, no anonymous access), disable the read-only port, and NetworkPolicies or host firewall rules restricting pod access to node ports.

</details>

**Q231. How do you secure Helm usage in a cluster?**

<details>
<summary>Show answer</summary>

Helm 3 uses the user's RBAC, so restrict who can install in which namespaces, verify chart provenance/signatures, pin versions, and prefer GitOps-driven releases.

</details>

**Q232. A dependency in your image is vulnerable but there's no fix yet. What do you do?**

<details>
<summary>Show answer</summary>

Assess exploitability, apply mitigations (network restrictions, disabling features, WAF rules), document the accepted risk with expiry, and track for a fix.

</details>

**Q233. How do you separate production and non-production securely?**

<details>
<summary>Show answer</summary>

Separate clusters (often separate cloud accounts), separate identities and pipelines, network isolation, and no shared credentials.

</details>

**Q234. How do you prevent users from creating NodePort Services?**

<details>
<summary>Show answer</summary>

An admission policy rejecting type NodePort in tenant namespaces, or quota services.nodeports: 0.

</details>

**Q235. A container needs to modify network settings (NET_ADMIN). How do you handle the request?**

<details>
<summary>Show answer</summary>

Validate the need, grant only that capability for that workload in a namespace with an exception to restricted policy, and document the risk. Often a CNI feature or init container in a privileged system namespace is a better fit.

</details>

**Q236. How do you enforce resource requests on every pod?**

<details>
<summary>Show answer</summary>

A validating policy (CEL or Kyverno) requiring requests, plus LimitRange defaults as a safety net.

</details>

**Q237. How do you protect against crypto-miners in compromised pods?**

<details>
<summary>Show answer</summary>

Least privilege, egress restrictions, CPU limits or quotas, runtime detection rules for mining behaviour, image provenance, and alerts on unusual CPU usage.

</details>

**Q238. How do you manage RBAC for 50 teams?**

<details>
<summary>Show answer</summary>

Group-based bindings from the IdP, reusable ClusterRoles, namespace templates applied by GitOps, and periodic access reviews with tools like rbac-tool.

</details>

**Q239. What would you do if a namespace's pods should never talk to other namespaces?**

<details>
<summary>Show answer</summary>

Default-deny plus policies allowing only intra-namespace traffic (podSelector {} within the namespace), DNS, and specific shared services like monitoring.

</details>

**Q240. How do you keep kubeconfig files from being shared insecurely?**

<details>
<summary>Show answer</summary>

Use SSO-based exec plugins issuing short-lived tokens instead of static certs, disable static token files, and audit kubeconfig distribution.

</details>

**Q241. A developer wants to use hostPath to read node logs. Alternative?**

<details>
<summary>Show answer</summary>

Ship logs through the logging pipeline and give them access to the log backend, or use kubectl debug node under controlled access.

</details>

**Q242. How do you prevent workloads from mounting the Docker or containerd socket?**

<details>
<summary>Show answer</summary>

Pod Security baseline/restricted blocks hostPath; add explicit policies denying socket paths for any namespace with exceptions.

</details>

**Q243. How do you secure inter-service communication without a mesh?**

<details>
<summary>Show answer</summary>

NetworkPolicies for segmentation plus TLS in apps using cert-manager-issued certificates, or SPIFFE/SPIRE for workload identity.

</details>

**Q244. You need to give an external auditor read-only access to cluster configuration without secrets. How?**

<details>
<summary>Show answer</summary>

A custom ClusterRole listing resources explicitly (excluding secrets), bound to their identity, time-limited, with audit logging.

</details>

**Q245. How do you handle policy exceptions without weakening policies for everyone?**

<details>
<summary>Show answer</summary>

Scoped exceptions (Kyverno PolicyException, namespace or label-based exclusions) with owners, expiry dates and review.

</details>

**Q246. A team runs workloads in kube-system to avoid restrictions. How do you stop that?**

<details>
<summary>Show answer</summary>

RBAC denying create in kube-system for non-platform identities, admission policies, and regular audits of non-system workloads there.

</details>

**Q247. How do you ensure clusters stay compliant over time, not just at setup?**

<details>
<summary>Show answer</summary>

Continuous policy enforcement at admission, posture scanning on schedules, GitOps self-heal against drift, and alerts on new violations.

</details>

**Q248. How do you mitigate the risk of a malicious Helm chart?**

<details>
<summary>Show answer</summary>

Use trusted sources, review templates, verify signatures/provenance, render and scan manifests before apply, run with least-privilege RBAC, and enforce admission policies.

</details>

**Q249. How do you secure access to the Kubernetes Dashboard or similar UIs?**

<details>
<summary>Show answer</summary>

Don't expose them publicly; require SSO, use least-privilege per-user RBAC (not a shared admin token), and prefer local tools like k9s or Headlamp with user credentials.

</details>

**Q250. How do you contain a runaway controller hammering the API server?**

<details>
<summary>Show answer</summary>

Identify it from audit logs or APF metrics, scale it down or fix it, and configure a dedicated flow schema with limited priority level for that client.

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
