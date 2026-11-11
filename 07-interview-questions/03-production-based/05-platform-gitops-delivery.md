<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Production-Based · Platform Engineering, GitOps & Delivery

Questions 201–250 of the production-based bank. Answer each one out loud before opening the answer.

---

**Q201. What is platform engineering and how does Kubernetes fit in?**

<details>
<summary>Show answer</summary>

Building internal platforms that give developers self-service, paved roads for building, deploying and operating software. Kubernetes is often the runtime foundation, wrapped with GitOps, templates, policies, observability and portals.

</details>

**Q202. What is a golden path?**

<details>
<summary>Show answer</summary>

An opinionated, supported way to build and ship a service (templates, CI/CD, manifests, observability and security defaults) that makes the right thing the easy thing.

</details>

**Q203. How do you design a GitOps repository structure for many teams?**

<details>
<summary>Show answer</summary>

Separate platform and application concerns, per-cluster entry points, per-app base and environment overlays, ApplicationSets or Flux Kustomizations for fan-out, and clear ownership via CODEOWNERS.

</details>

**Q204. Mono-repo or multi-repo for GitOps?**

<details>
<summary>Show answer</summary>

Mono-repo simplifies visibility and cross-cutting changes but needs strict ownership and scaling; multi-repo isolates teams and permissions but complicates coordination. Many orgs use a platform repo plus per-team app config repos.

</details>

**Q205. How do you promote releases across environments with GitOps?**

<details>
<summary>Show answer</summary>

Image tags or chart versions bumped in each environment's overlay via automated PRs, with checks and approvals for production; tools like Kargo or image updaters automate promotion.

</details>

**Q206. How do you handle secrets in GitOps?**

<details>
<summary>Show answer</summary>

Never plaintext: use External Secrets referencing a vault, Sealed Secrets or SOPS-encrypted files decrypted in-cluster.

</details>

**Q207. What is drift and how do you handle it in production?**

<details>
<summary>Show answer</summary>

Live state differing from Git. Enable self-heal for most resources, ignore fields owned by controllers (replicas under HPA), and alert on persistent drift.

</details>

**Q208. How do you manage add-ons across many clusters?**

<details>
<summary>Show answer</summary>

Declare them once with per-cluster values using ApplicationSets or Flux, pin versions, roll out in waves, and track versions centrally.

</details>

**Q209. How do you give developers self-service namespaces?**

<details>
<summary>Show answer</summary>

A request (PR or portal) creates a namespace from a template with quotas, RBAC, policies and observability via GitOps, often through Backstage templates or a platform API.

</details>

**Q210. What is Backstage and why use it?**

<details>
<summary>Show answer</summary>

An open-source developer portal for service catalogs, templates, docs and plugins, often used as the front door to an internal platform built on Kubernetes.

</details>

**Q211. How do you standardise deployments across 100 services?**

<details>
<summary>Show answer</summary>

Shared Helm library charts or Kustomize bases, CI templates, policy enforcement and GitOps, with an upgrade path for the shared components.

</details>

**Q212. How do you implement progressive delivery at scale?**

<details>
<summary>Show answer</summary>

Argo Rollouts or Flagger with standard analysis templates based on SLIs, integrated with ingress or mesh traffic routing, with sensible defaults teams can adopt easily.

</details>

**Q213. How do you test Kubernetes manifests in CI?**

<details>
<summary>Show answer</summary>

Render (Helm/Kustomize), validate schemas with kubeconform, lint with kube-linter, run policy tests (Kyverno CLI, conftest), check deprecated APIs, and deploy to an ephemeral kind cluster for smoke tests.

</details>

**Q214. How do you prevent breaking changes to shared Helm charts?**

<details>
<summary>Show answer</summary>

Semantic versioning, chart tests and unit tests, changelogs, canary adoption by a few teams, and automated dependency PRs to consumers.

</details>

**Q215. How do you choose between Argo CD and Flux?**

<details>
<summary>Show answer</summary>

Argo CD offers a rich UI, ApplicationSets and app-centric workflows; Flux offers composable controllers, strong Helm and image automation, and a Kubernetes-native CLI-first model. Both are mature; pick based on team workflow and ecosystem fit.

</details>

**Q216. How do you manage infrastructure (databases, queues) alongside apps?**

<details>
<summary>Show answer</summary>

Terraform/OpenTofu pipelines, or Kubernetes-native tools like Crossplane or cloud controllers (ACK, Config Connector), managed through GitOps so apps and their infrastructure are declared together.

</details>

**Q217. How do you handle multi-cluster service discovery?**

<details>
<summary>Show answer</summary>

Multi-Cluster Services API, Cilium Cluster Mesh, Istio multi-cluster, or DNS-based global load balancing, depending on latency and failover needs.

</details>

**Q218. What is Cluster API and when would you use it?**

<details>
<summary>Show answer</summary>

Kubernetes-style declarative management of cluster lifecycle across infrastructures; useful when operating many clusters consistently, especially on-prem or multi-cloud.

</details>

**Q219. How do you ensure every service has monitoring by default?**

<details>
<summary>Show answer</summary>

Templates include ServiceMonitors and dashboards, the platform scrapes standard ports via labels, and policies or readiness reviews check monitoring exists.

</details>

**Q220. How do you design SLO tooling for a platform?**

<details>
<summary>Show answer</summary>

Provide an SLO spec format (Sloth, Pyrra or OpenSLO), generate recording and alerting rules automatically, and show error budgets on standard dashboards.

</details>

**Q221. How do you approach multi-cloud with Kubernetes?**

<details>
<summary>Show answer</summary>

Use Kubernetes as a consistent runtime with portable manifests and GitOps, abstract differences (load balancers, storage, identity) in platform layers, and accept that data gravity and managed services limit true portability.

</details>

**Q222. How do you support preview environments at scale?**

<details>
<summary>Show answer</summary>

ApplicationSet PR generators or CI-driven namespaces, shared ingress with wildcard DNS, seeded data, quotas and TTL cleanup.

</details>

**Q223. How do you make developer onboarding fast?**

<details>
<summary>Show answer</summary>

Templates that scaffold a service with CI/CD, manifests and observability, a portal, documentation, and a local development workflow (Tilt, Skaffold, DevSpace) mirroring production.

</details>

**Q224. How do you enforce standards without blocking teams?**

<details>
<summary>Show answer</summary>

Policies in audit then enforce, clear messages, CI pre-checks, exception workflows, and paved roads that make compliance the default.

</details>

**Q225. How do you handle versioning of platform APIs (CRDs) you provide?**

<details>
<summary>Show answer</summary>

Versioned CRDs with conversion webhooks, deprecation policies and timelines, documentation and migration tooling for consumers.

</details>

**Q226. How do you build an internal Kubernetes operator responsibly?**

<details>
<summary>Show answer</summary>

Use Kubebuilder or Operator SDK, idempotent reconciliation, status conditions, finalizers for cleanup, owner references, rate limiting, metrics, tests (envtest), and careful RBAC.

</details>

**Q227. When should you write an operator versus using Helm?**

<details>
<summary>Show answer</summary>

Use Helm for installing and configuring; write an operator when you need ongoing automated day-2 operations (failover, backups, scaling decisions) that require continuous reconciliation.

</details>

**Q228. How do you manage CRDs safely in GitOps?**

<details>
<summary>Show answer</summary>

Apply CRDs before CRs (sync waves, separate apps), avoid deleting CRDs (which deletes all CRs), use Replace or server-side apply for large CRDs, and review CRD changes carefully.

</details>

**Q229. How do you implement policy across clusters consistently?**

<details>
<summary>Show answer</summary>

Policies as code in Git distributed by GitOps to all clusters, with the same engine (Kyverno or Gatekeeper) and versioned rollout.

</details>

**Q230. How do you approach local development for Kubernetes apps?**

<details>
<summary>Show answer</summary>

kind or k3d clusters, Tilt or Skaffold for inner-loop rebuilds, remote development tools (Telepresence, mirrord) for connecting to shared environments, and consistent manifests.

</details>

**Q231. How do you measure developer experience on the platform?**

<details>
<summary>Show answer</summary>

DORA metrics, time to first deploy for new services, survey feedback, support ticket volume, and adoption of golden paths.

</details>

**Q232. How do you handle dependency updates across clusters and charts?**

<details>
<summary>Show answer</summary>

Renovate or Dependabot for images, charts and Terraform modules, automated tests, staged rollouts and dashboards of outdated components.

</details>

**Q233. How do you design namespaces and clusters for a growing company?**

<details>
<summary>Show answer</summary>

Start with separate prod and non-prod clusters, namespaces per team or app, then split clusters by region, compliance or criticality as scale demands, keeping everything templated.

</details>

**Q234. How do you handle Kubernetes for edge locations?**

<details>
<summary>Show answer</summary>

Lightweight distributions (k3s, K0s, MicroK8s), GitOps pull-based sync tolerant of intermittent connectivity, fleet management tools, and small resource footprints.

</details>

**Q235. How do you provide databases as a service on Kubernetes?**

<details>
<summary>Show answer</summary>

Operators exposing custom resources (Database, Cluster) with backups, monitoring and upgrades, or Crossplane compositions provisioning managed databases, plus self-service templates.

</details>

**Q236. What's your approach to API gateway versus Ingress/Gateway API?**

<details>
<summary>Show answer</summary>

Gateway API handles routing and TLS; API gateways (Kong, Envoy-based) add auth, rate limiting, transformations and developer portals. Many Gateway implementations now cover common API gateway needs.

</details>

**Q237. How do you migrate from Jenkins push-based deploys to GitOps?**

<details>
<summary>Show answer</summary>

Keep Jenkins for CI, have it update config repos instead of running kubectl, introduce Argo CD or Flux per environment, migrate services gradually, and remove cluster credentials from Jenkins.

</details>

**Q238. How do you organise Helm values for many environments and regions?**

<details>
<summary>Show answer</summary>

Layered values files (base, environment, region, cluster) with clear precedence, generated via ApplicationSets or Helmfile, avoiding duplication.

</details>

**Q239. How do you handle feature flags with Kubernetes deployments?**

<details>
<summary>Show answer</summary>

Use a feature flag service (OpenFeature-compatible) to decouple release from deploy, combined with progressive delivery for infrastructure-level changes.

</details>

**Q240. How do you support multiple Kubernetes versions in your platform tooling?**

<details>
<summary>Show answer</summary>

Test tooling and charts against supported versions in CI with kind matrices, use API discovery (Capabilities in Helm), and maintain a compatibility matrix.

</details>

**Q241. How do you make Kubernetes approachable for developers who don't want to learn it deeply?**

<details>
<summary>Show answer</summary>

Higher-level abstractions (app CRDs, Score, templates), a portal with self-service actions, sensible defaults, and good docs; keep escape hatches for advanced users.

</details>

**Q242. How do you approach platform documentation?**

<details>
<summary>Show answer</summary>

Docs as code next to platform components, task-oriented guides, runbooks, architecture decision records, and examples for every golden path.

</details>

**Q243. How do you handle breaking changes in the platform?**

<details>
<summary>Show answer</summary>

Announce early, provide migration guides and tooling, support both paths for a deprecation window, track adoption, and help teams migrate.

</details>

**Q244. How do you decide what belongs in the platform versus in app teams?**

<details>
<summary>Show answer</summary>

Platform owns shared, undifferentiated concerns (clusters, networking, CI/CD, observability, security baselines); app teams own business logic, their configurations and SLOs, with clear interfaces.

</details>

**Q245. How do you design a multi-tenant observability stack?**

<details>
<summary>Show answer</summary>

Tenant-aware backends (Mimir, Loki, Tempo with tenant IDs), per-team dashboards and alert routing, quotas on ingestion and RBAC on queries.

</details>

**Q246. How do you keep GitOps sync fast with thousands of resources?**

<details>
<summary>Show answer</summary>

Shard Argo CD controllers, tune resource exclusions and reconciliation intervals, use webhooks for change detection, and split large applications.

</details>

**Q247. How do you evaluate a new CNCF tool for your platform?**

<details>
<summary>Show answer</summary>

Check maturity, community health, security posture, operational cost, integration with existing stack, exit strategy, and run a time-boxed proof of concept with success criteria.

</details>

**Q248. How do you approach AI/ML platform needs on Kubernetes?**

<details>
<summary>Show answer</summary>

GPU node pools with operators, queueing (Kueue), training frameworks (Kubeflow Training, Ray), model serving (KServe, vLLM), data access via workload identity, and cost controls for GPUs.

</details>

**Q249. How do you make platform upgrades transparent to app teams?**

<details>
<summary>Show answer</summary>

Maintenance windows, compatibility testing, versioned APIs, release notes, status pages, and avoiding changes to app-facing contracts without notice.

</details>

**Q250. What would your first 90 days look like as a platform engineer on a new Kubernetes platform?**

<details>
<summary>Show answer</summary>

Learn the architecture and pain points, review reliability and security baselines, fix urgent risks (backups, certs, upgrades), establish observability and runbooks, then improve golden paths based on developer feedback.

</details>

---

← [Production-Based index](README.md) · [All interview banks](../README.md)

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
