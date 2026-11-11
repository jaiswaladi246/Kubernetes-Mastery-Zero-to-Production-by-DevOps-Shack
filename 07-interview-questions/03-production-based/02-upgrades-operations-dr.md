<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Production-Based · Upgrades, Operations & Disaster Recovery

Questions 51–100 of the production-based bank. Answer each one out loud before opening the answer.

---

**Q51. Walk me through your Kubernetes cluster upgrade process.**

<details>
<summary>Show answer</summary>

Read release notes, scan for removed APIs (pluto, kubent, deprecated API metrics), check add-on compatibility, back up etcd and run Velero, upgrade staging first, upgrade the control plane, then add-ons, then nodes in batches (surge or blue-green pools) with PDBs respected, and verify with smoke tests and SLOs.

</details>

**Q52. Why can't you skip minor versions when upgrading?**

<details>
<summary>Show answer</summary>

The version skew policy and API migrations are designed for one minor step at a time; storage version migrations and component compatibility are only guaranteed between adjacent minors.

</details>

**Q53. How do you upgrade nodes with minimal risk?**

<details>
<summary>Show answer</summary>

Blue-green node pools (new pool on new version, cordon and drain old pool gradually) or surge upgrades in small batches, with PDBs and monitoring, keeping the old pool until confident.

</details>

**Q54. How often do you upgrade Kubernetes?**

<details>
<summary>Show answer</summary>

At least two to three times a year to stay within support windows. Managed providers support each minor for a limited period, and extended support costs extra.

</details>

**Q55. How do you find deprecated APIs before an upgrade?**

<details>
<summary>Show answer</summary>

Scan manifests and Helm releases with pluto or kubent, check the apiserver_requested_deprecated_apis metric and audit logs for live usage, and update charts and operators.

</details>

**Q56. A Helm release has manifests with removed APIs and won't upgrade. What do you do?**

<details>
<summary>Show answer</summary>

Use the helm-mapkubeapis plugin to rewrite the stored release manifests to supported APIs, then upgrade with updated charts.

</details>

**Q57. How do you back up a cluster?**

<details>
<summary>Show answer</summary>

Self-managed: etcd snapshots plus Velero for resources and volumes. Managed: Velero for namespaces and volumes, GitOps repositories as the source of truth, and database-native backups for data.

</details>

**Q58. What's the difference between etcd backups and Velero backups?**

<details>
<summary>Show answer</summary>

etcd snapshots capture the entire cluster state at once and restore the whole cluster; Velero backs up selected resources and volume data via the API and can restore selectively or into another cluster.

</details>

**Q59. How do you restore a single deleted namespace?**

<details>
<summary>Show answer</summary>

Re-sync from GitOps for the manifests, and restore data with Velero (including PV data) or from database backups. etcd restore is too coarse for one namespace.

</details>

**Q60. How do you define RPO and RTO for a platform?**

<details>
<summary>Show answer</summary>

Agree per service with the business: how much data loss (RPO) and downtime (RTO) is acceptable, then design backup frequency, replication and failover accordingly, and test.

</details>

**Q61. Describe your disaster recovery strategy for a regional outage.**

<details>
<summary>Show answer</summary>

Infrastructure as code to recreate clusters, GitOps to redeploy workloads, data replicated or backed up cross-region, global DNS failover, documented runbooks, and regular game days measuring RTO and RPO.

</details>

**Q62. How do you test backups?**

<details>
<summary>Show answer</summary>

Scheduled automated restores into isolated namespaces or clusters, integrity and application checks, and tracking restore duration against RTO.

</details>

**Q63. How do you manage node OS patching?**

<details>
<summary>Show answer</summary>

Immutable node images rebuilt regularly and rolled out by replacing nodes (managed node groups, Karpenter drift, Cluster API), or kured for in-place reboots, always respecting PDBs.

</details>

**Q64. How do you handle kubeadm certificate renewal?**

<details>
<summary>Show answer</summary>

Certificates renew automatically during kubeadm upgrades; otherwise run `kubeadm certs renew all` before expiry, restart control plane components and update kubeconfigs. Monitor expiry dates.

</details>

**Q65. How do you upgrade critical add-ons like the CNI?**

<details>
<summary>Show answer</summary>

Follow the vendor's upgrade path, test in staging, upgrade in a maintenance window with rollback plans, watch for connectivity regressions, and upgrade one node pool at a time when possible.

</details>

**Q66. How do you manage cluster configuration as code?**

<details>
<summary>Show answer</summary>

Terraform/OpenTofu, Cluster API or eksctl/CDK for infrastructure, GitOps for in-cluster add-ons and policies, all versioned and reviewed.

</details>

**Q67. How do you roll back a failed control plane upgrade?**

<details>
<summary>Show answer</summary>

Managed control planes usually can't be downgraded, so fix forward or fail over to another cluster. For kubeadm, restoring etcd and previous binaries is possible but risky; prevention through staging tests matters most.

</details>

**Q68. How do you handle drain timeouts during node maintenance?**

<details>
<summary>Show answer</summary>

Identify blockers (PDBs, unmanaged pods, long termination grace periods), coordinate with owners, scale up to satisfy PDBs, and set drain timeouts with alerts instead of forcing deletion.

</details>

**Q69. How do you operate etcd in self-managed clusters?**

<details>
<summary>Show answer</summary>

Dedicated fast disks, monitoring of latency, DB size and leader changes, regular compaction and defragmentation, encrypted off-cluster snapshots, tested restores and member replacement procedures.

</details>

**Q70. What's your approach to cluster lifecycle at scale (dozens of clusters)?**

<details>
<summary>Show answer</summary>

Treat clusters as cattle: standardised templates, Cluster API or IaC modules, fleet GitOps, centralised observability and policy, automated upgrades in waves.

</details>

**Q71. How do you migrate workloads between clusters?**

<details>
<summary>Show answer</summary>

Deploy to the new cluster via GitOps, migrate data via replication or Velero, shift traffic gradually with DNS or global load balancing, validate, then decommission the old cluster.

</details>

**Q72. How do you handle Kubernetes version differences between environments?**

<details>
<summary>Show answer</summary>

Keep environments on the same version where possible, upgrade lower environments first with a short lag, and test workloads against the next version in CI with kind.

</details>

**Q73. What runbooks should a platform team have?**

<details>
<summary>Show answer</summary>

Node NotReady, DNS failures, ingress outage, etcd issues, certificate expiry, webhook outage, cluster upgrade, node pool rotation, restore from backup, scaling for events, and access emergencies.

</details>

**Q74. How do you track add-on versions across clusters?**

<details>
<summary>Show answer</summary>

Declare them in GitOps with pinned versions, report versions per cluster in dashboards, and use automated dependency updates (Renovate) with staged rollouts.

</details>

**Q75. How do you plan maintenance windows for stateful workloads?**

<details>
<summary>Show answer</summary>

Coordinate with owners, ensure replicas and backups are healthy beforehand, drain one node at a time, use operator-aware maintenance (switchover before drain), and monitor replication lag.

</details>

**Q76. How do you decommission a cluster safely?**

<details>
<summary>Show answer</summary>

Confirm no traffic and workloads remain, take final backups, delete load balancers and volumes intentionally, remove DNS records, revoke credentials, and clean up IaC state.

</details>

**Q77. How do you reduce toil in cluster operations?**

<details>
<summary>Show answer</summary>

Automate upgrades, node rotation, certificate management, onboarding and backups; use managed services where sensible; and invest in self-service for app teams.

</details>

**Q78. What is your strategy for container image management in production?**

<details>
<summary>Show answer</summary>

Private registries with replication, immutable tags, retention policies that protect deployed images, vulnerability scanning, signing, and pull-through caches for public images.

</details>

**Q79. How do you handle cloud quota limits?**

<details>
<summary>Show answer</summary>

Track quotas (vCPUs, IPs, load balancers, volumes) in monitoring, request increases ahead of growth or events, and design for graceful failure when limits hit.

</details>

**Q80. How do you approach Kubernetes cost reviews operationally?**

<details>
<summary>Show answer</summary>

Monthly reports per team from OpenCost or Kubecost, rightsizing recommendations, idle resource cleanup, commitment planning for baseline usage and spot for flexible workloads.

</details>

**Q81. How do you make cluster upgrades boring?**

<details>
<summary>Show answer</summary>

Frequent small upgrades, automated pre-checks, staging parity, blue-green node pools, good observability, rehearsed runbooks, and compatibility tests for add-ons in CI.

</details>

**Q82. How do you handle the removal of a feature you rely on, like PodSecurityPolicy?**

<details>
<summary>Show answer</summary>

Track deprecations early, map functionality to replacements (Pod Security Admission plus policy engines), migrate gradually with audit modes, and complete before the removal version.

</details>

**Q83. How do you know when to scale the control plane in self-managed clusters?**

<details>
<summary>Show answer</summary>

Watch API server CPU/memory and latency, etcd DB size and latency, object counts, and controller queue depths; scale vertically and tune limits before issues hit SLOs.

</details>

**Q84. How do you manage kubelet configuration across nodes?**

<details>
<summary>Show answer</summary>

Through node templates (launch templates, NodeClasses, machine configs) or KubeletConfiguration via kubeadm, versioned in Git and rolled out by node replacement.

</details>

**Q85. What's your approach to logging retention and compliance?**

<details>
<summary>Show answer</summary>

Define retention per data class, store audit logs immutably for the required period, separate access to sensitive logs, and archive to cheaper storage tiers.

</details>

**Q86. How do you handle emergency changes in a GitOps workflow?**

<details>
<summary>Show answer</summary>

Fast-track PRs with minimal review, or a documented break-glass path (pause sync, apply manually, reconcile Git immediately after), with audit trails.

</details>

**Q87. How do you verify DR readiness continuously?**

<details>
<summary>Show answer</summary>

Automated backup verification, periodic restore tests, infrastructure rebuild tests from IaC, and DR drills with measured outcomes.

</details>

**Q88. How do you handle a cluster where etcd lost quorum?**

<details>
<summary>Show answer</summary>

If members can be recovered, bring them back to restore quorum. Otherwise restore from the latest snapshot into a new etcd cluster, accept data loss since the snapshot, and reconcile with GitOps.

</details>

**Q89. How do you manage Kubernetes access for contractors?**

<details>
<summary>Show answer</summary>

SSO identities with group-based, time-limited bindings to specific namespaces, MFA, audit logging, and automatic removal at contract end.

</details>

**Q90. How do you ensure nodes are consistent and secure?**

<details>
<summary>Show answer</summary>

Minimal hardened images (Bottlerocket, Talos, COS, Flatcar), immutable infrastructure, CIS benchmarks, regular rebuilds, and no SSH by default.

</details>

**Q91. How do you keep container base images current?**

<details>
<summary>Show answer</summary>

Automated rebuilds on base image updates (Renovate/Dependabot), scheduled rebuilds, scanning gates, and dashboards of image age per service.

</details>

**Q92. How do you plan IP address space for clusters?**

<details>
<summary>Show answer</summary>

Size pod and service CIDRs for growth, avoid overlaps with VPCs and on-prem networks, plan per-cluster ranges for multi-cluster connectivity, and use prefix delegation or overlays where VPC space is scarce.

</details>

**Q93. How do you approach operator upgrades?**

<details>
<summary>Show answer</summary>

Read operator release notes and CRD changes, upgrade CRDs safely (conversion webhooks), test in staging, upgrade during low traffic, and verify managed resources after.

</details>

**Q94. How do you manage CRD version migrations?**

<details>
<summary>Show answer</summary>

Serve both versions with a conversion webhook, migrate stored objects to the new storage version, update clients, then stop serving the old version.

</details>

**Q95. How do you organise multiple environments: clusters or namespaces?**

<details>
<summary>Show answer</summary>

Commonly separate clusters for prod and non-prod (often separate accounts), namespaces for apps within a cluster; trade-offs are isolation and blast radius versus cost and overhead.

</details>

**Q96. What KPIs show your platform is improving?**

<details>
<summary>Show answer</summary>

Deployment frequency, lead time, change failure rate, MTTR, platform SLO attainment, upgrade cadence, cost per workload, and developer satisfaction.

</details>

**Q97. How do you handle stuck namespaces and resources at scale?**

<details>
<summary>Show answer</summary>

Detect them via alerts, fix root causes (broken APIServices, missing controllers), document safe finalizer removal procedures, and enforce uninstall ordering.

</details>

**Q98. How do you manage the lifecycle of PVs and snapshots to control cost?**

<details>
<summary>Show answer</summary>

Retention policies for snapshots, reports of Released and orphaned volumes, automated cleanup with safeguards, and right storage tiers.

</details>

**Q99. How do you ensure observability survives cluster outages?**

<details>
<summary>Show answer</summary>

Ship metrics and logs to systems outside the cluster (or another cluster), so you can investigate even when the cluster is down.

</details>

**Q100. How do you onboard a legacy app team to Kubernetes operations?**

<details>
<summary>Show answer</summary>

Templates and golden paths, training, shared runbooks, pairing on the first migrations, clear support boundaries, and paved-road tooling for deploys and observability.

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
