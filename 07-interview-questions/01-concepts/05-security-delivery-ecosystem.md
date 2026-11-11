<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Concept-Based · Security, Delivery, Observability & Ecosystem

Questions 201–250 of the concept-based bank. Answer each one out loud before opening the answer.

---

**Q201. How does authentication work in Kubernetes?**

<details>
<summary>Show answer</summary>

Kubernetes has no user database. Requests authenticate via X.509 client certificates, bearer tokens (ServiceAccount JWTs, OIDC ID tokens), webhook token review or an authenticating proxy. The result is a username and groups used for authorization.

</details>

**Q202. What is a ServiceAccount?**

<details>
<summary>Show answer</summary>

A namespaced identity for workloads. Pods run as a ServiceAccount and receive a short-lived, audience-bound projected token for calling the API or federating with cloud IAM.

</details>

**Q203. What is RBAC?**

<details>
<summary>Show answer</summary>

Role-Based Access Control: Roles and ClusterRoles define allowed verbs on resources, and RoleBindings and ClusterRoleBindings grant them to users, groups or ServiceAccounts. It's allow-only and additive.

</details>

**Q204. Role vs ClusterRole?**

<details>
<summary>Show answer</summary>

A Role grants permissions within one namespace. A ClusterRole is cluster-wide and can grant cluster-scoped resources, non-resource URLs, or be reused across namespaces through RoleBindings.

</details>

**Q205. What does binding a ClusterRole with a RoleBinding do?**

<details>
<summary>Show answer</summary>

Grants the ClusterRole's rules only within the RoleBinding's namespace, which lets you define common roles once and grant them per namespace.

</details>

**Q206. What are the built-in user-facing ClusterRoles?**

<details>
<summary>Show answer</summary>

cluster-admin (everything), admin (full namespace control including RBAC), edit (modify most objects, read Secrets) and view (read most objects, no Secrets).

</details>

**Q207. What are aggregated ClusterRoles?**

<details>
<summary>Show answer</summary>

ClusterRoles whose rules are assembled from other ClusterRoles matching a label selector, used to extend built-in roles like view and edit with permissions for CRDs.

</details>

**Q208. How do you test permissions?**

<details>
<summary>Show answer</summary>

`kubectl auth can-i <verb> <resource> -n <ns> --as=<user> --as-group=<group>` and `kubectl auth can-i --list`. `kubectl auth whoami` shows your own identity.

</details>

**Q209. What is admission control?**

<details>
<summary>Show answer</summary>

Plugins and webhooks that intercept requests after authorization to mutate or validate objects before they're stored, enforcing defaults and policies.

</details>

**Q210. Mutating vs validating admission?**

<details>
<summary>Show answer</summary>

Mutating admission can change objects (inject sidecars, set defaults) and runs first; validating admission only accepts or rejects and runs after, so it sees the final object.

</details>

**Q211. What is Pod Security Admission?**

<details>
<summary>Show answer</summary>

A built-in admission controller enforcing the Pod Security Standards (privileged, baseline, restricted) per namespace via labels for enforce, warn and audit modes. It replaced PodSecurityPolicy.

</details>

**Q212. What does the restricted Pod Security profile require?**

<details>
<summary>Show answer</summary>

Everything in baseline plus running as non-root, disallowing privilege escalation, dropping all capabilities (only NET_BIND_SERVICE may be added), seccomp RuntimeDefault or Localhost, and restricted volume types.

</details>

**Q213. What is ValidatingAdmissionPolicy?**

<details>
<summary>Show answer</summary>

An in-process admission policy written in CEL, bound with ValidatingAdmissionPolicyBinding and optional parameters. It avoids running and operating webhook servers.

</details>

**Q214. What is a securityContext?**

<details>
<summary>Show answer</summary>

Pod- and container-level security settings: runAsUser, runAsGroup, runAsNonRoot, fsGroup, capabilities, privileged, allowPrivilegeEscalation, readOnlyRootFilesystem, seccomp and AppArmor/SELinux options.

</details>

**Q215. What are Linux capabilities in containers?**

<details>
<summary>Show answer</summary>

Fine-grained root privileges like NET_ADMIN or SYS_ADMIN. Containers get a default set from the runtime; best practice is to drop ALL and add back only what's needed.

</details>

**Q216. What is seccomp?**

<details>
<summary>Show answer</summary>

A kernel feature that filters system calls. The RuntimeDefault profile blocks dangerous syscalls and is required by the restricted Pod Security profile.

</details>

**Q217. What is image signing and verification?**

<details>
<summary>Show answer</summary>

Signing images (e.g. cosign with Sigstore) and verifying signatures at admission (Kyverno, policy-controller) ensures only images built by trusted pipelines run in the cluster.

</details>

**Q218. What is an SBOM?**

<details>
<summary>Show answer</summary>

A Software Bill of Materials listing an image's components and versions, generated by tools like Syft or Trivy, used for vulnerability tracking and compliance.

</details>

**Q219. What is workload identity?**

<details>
<summary>Show answer</summary>

Mechanisms that let pods assume cloud IAM roles using their ServiceAccount identity (EKS Pod Identity/IRSA, AKS Workload Identity, GKE Workload Identity Federation) instead of static credentials.

</details>

**Q220. What is Helm?**

<details>
<summary>Show answer</summary>

A package manager for Kubernetes. Charts are templated bundles of manifests with default values; a release is an installed instance with its own revision history.

</details>

**Q221. What are the main parts of a Helm chart?**

<details>
<summary>Show answer</summary>

Chart.yaml (metadata, version, dependencies), values.yaml (defaults), templates/ (Go templates and helpers), optional values.schema.json, charts/ for dependencies and NOTES.txt.

</details>

**Q222. Where does Helm store release state?**

<details>
<summary>Show answer</summary>

In Secrets (by default) in the release's namespace, one per revision, named sh.helm.release.v1.<name>.v<revision>.

</details>

**Q223. What are Helm hooks?**

<details>
<summary>Show answer</summary>

Annotated resources executed at lifecycle points like pre-install, pre-upgrade, post-upgrade, pre-delete and test, commonly used for migrations and tests.

</details>

**Q224. What is Kustomize?**

<details>
<summary>Show answer</summary>

A template-free configuration tool built into kubectl that layers overlays (patches, image changes, generators, name prefixes) on top of plain-YAML bases.

</details>

**Q225. Helm or Kustomize?**

<details>
<summary>Show answer</summary>

Helm suits packaging and distributing configurable software with versioning; Kustomize suits environment overlays of your own plain YAML. Many teams use Helm for third-party charts and Kustomize for in-house apps, or combine them.

</details>

**Q226. What is GitOps?**

<details>
<summary>Show answer</summary>

Operating systems by keeping desired state declaratively in Git and having in-cluster agents continuously pull and reconcile it, providing audit history, easy rollback and drift correction.

</details>

**Q227. What are Argo CD and Flux?**

<details>
<summary>Show answer</summary>

CNCF GitOps tools. Argo CD centres on Applications with a UI and multi-cluster management; Flux is a set of composable controllers (source, kustomize, helm, notification, image automation). Both continuously sync Git to clusters.

</details>

**Q228. What is drift and self-heal in GitOps?**

<details>
<summary>Show answer</summary>

Drift is when live state differs from Git (for example, a manual kubectl edit). Self-heal makes the GitOps agent revert the cluster to the Git state automatically.

</details>

**Q229. What is an Argo CD ApplicationSet?**

<details>
<summary>Show answer</summary>

A controller that generates many Applications from templates and generators (clusters, Git directories, lists, pull requests), used for multi-cluster and multi-tenant deployments.

</details>

**Q230. What are canary and blue-green deployments?**

<details>
<summary>Show answer</summary>

Canary shifts a small percentage of traffic to the new version and increases it while watching metrics. Blue-green runs the new version alongside the old and switches all traffic at once, keeping the old for instant rollback.

</details>

**Q231. What is Argo Rollouts?**

<details>
<summary>Show answer</summary>

A controller providing a Rollout resource with blue-green and canary strategies, traffic routing integrations (ingress, mesh, Gateway API) and automated analysis against metrics.

</details>

**Q232. What are the three pillars of observability?**

<details>
<summary>Show answer</summary>

Metrics (numeric time series), logs (discrete events) and traces (request paths across services), often complemented by profiles and Kubernetes events.

</details>

**Q233. What is kube-state-metrics?**

<details>
<summary>Show answer</summary>

An exporter that turns Kubernetes object state (deployments, pods, nodes, HPAs, jobs) into Prometheus metrics, complementing resource usage metrics from cAdvisor and node-exporter.

</details>

**Q234. What is the Prometheus Operator?**

<details>
<summary>Show answer</summary>

An operator that manages Prometheus and Alertmanager and uses CRDs like ServiceMonitor, PodMonitor and PrometheusRule to configure scraping and alerting declaratively.

</details>

**Q235. How are container logs collected?**

<details>
<summary>Show answer</summary>

Containers log to stdout/stderr, the runtime writes to files under /var/log/pods, and a node-level agent (Fluent Bit, Vector, OTel Collector) tails, enriches and ships them to a backend.

</details>

**Q236. What is OpenTelemetry?**

<details>
<summary>Show answer</summary>

A CNCF standard and set of SDKs, APIs and the Collector for producing and exporting traces, metrics and logs in a vendor-neutral way.

</details>

**Q237. What are SLIs, SLOs and error budgets?**

<details>
<summary>Show answer</summary>

An SLI is a measured indicator (e.g. success rate); an SLO is a target for it (99.9% over 30 days); the error budget is the allowed unreliability (0.1%) that teams can spend on change.

</details>

**Q238. What is a burn-rate alert?**

<details>
<summary>Show answer</summary>

An alert on how fast the error budget is being consumed, typically using multiple windows (e.g. 1h and 5m) to catch fast and slow burns with low noise.

</details>

**Q239. What is the Kubernetes Dashboard?**

<details>
<summary>Show answer</summary>

A web UI for viewing and managing cluster resources. Teams often prefer tools like Lens, Headlamp or k9s, and the dashboard must be locked down because it can expose powerful access.

</details>

**Q240. What is k9s?**

<details>
<summary>Show answer</summary>

A terminal UI for navigating, observing and managing Kubernetes resources quickly, popular for day-to-day operations.

</details>

**Q241. What is a kubectl plugin?**

<details>
<summary>Show answer</summary>

Any executable named kubectl-<name> on the PATH, invoked as kubectl <name>. Krew is the plugin manager.

</details>

**Q242. What is Cluster API?**

<details>
<summary>Show answer</summary>

A Kubernetes project that manages the lifecycle of clusters (create, upgrade, scale, delete) declaratively using Kubernetes-style APIs and providers for each infrastructure.

</details>

**Q243. What is Crossplane?**

<details>
<summary>Show answer</summary>

A framework that extends Kubernetes to provision and manage cloud infrastructure and services through CRDs and compositions, enabling platform APIs.

</details>

**Q244. What is a virtual cluster (vCluster)?**

<details>
<summary>Show answer</summary>

A Kubernetes control plane running inside a namespace of a host cluster, giving tenants their own API server and CRDs while sharing the host's nodes.

</details>

**Q245. What is Dynamic Resource Allocation?**

<details>
<summary>Show answer</summary>

An API for requesting and sharing specialised devices such as GPUs through ResourceClaims and device classes, supporting richer parameters, sharing and partitioning than device plugins.

</details>

**Q246. How does a pod request a GPU?**

<details>
<summary>Show answer</summary>

With a device plugin, by setting an extended resource limit such as nvidia.com/gpu: 1 (usually with tolerations and node selectors for GPU nodes). With DRA, through a ResourceClaim.

</details>

**Q247. What is Kueue?**

<details>
<summary>Show answer</summary>

A Kubernetes-native job queueing system that manages quotas, fair sharing and admission of batch and AI workloads into the cluster.

</details>

**Q248. What are the CNCF Kubernetes certifications?**

<details>
<summary>Show answer</summary>

KCNA (fundamentals), CKAD (application developer), CKA (administrator), CKS (security specialist), plus KCSA (security associate). CKA, CKAD and CKS are hands-on, performance-based exams.

</details>

**Q249. What is the CNCF?**

<details>
<summary>Show answer</summary>

The Cloud Native Computing Foundation, part of the Linux Foundation, which hosts Kubernetes and projects like Prometheus, Envoy, containerd, Helm, Argo, Flux and OpenTelemetry.

</details>

**Q250. What is the difference between audit logging and events?**

<details>
<summary>Show answer</summary>

Audit logs record every API request (who did what, when, with what result) according to an audit policy and are meant for security and compliance. Events are short-lived objects describing what happened to resources, meant for operational debugging.

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
