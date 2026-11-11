<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# 06 · Assignments

**112 real-world assignments**, from your first cluster tour to building and running a production platform. Each assignment gives you a scenario, tasks, acceptance criteria, hidden hints and a stretch goal.

| Level | Count |
|---|---|
| 🟢 Beginner | 20 |
| 🔵 Intermediate | 51 |
| 🟣 Advanced | 35 |
| 🔴 Expert | 6 |

## How to use them

1. Read the linked module first.
2. Work in your own Git repository; commit as you go.
3. Check every acceptance criterion before opening the hints.
4. Do the stretch goal for anything you want to talk about in interviews.
5. Write `NOTES.md` for each one. Those notes become your interview stories.

## Foundations

| # | Assignment | Level |
|---|---|---|
| A001 | [Cluster Tour](A001-cluster-tour.md) | 🟢 Beginner |
| A002 | [Kubeconfig & Contexts](A002-kubeconfig-contexts.md) | 🟢 Beginner |
| A003 | [Imperative to Declarative](A003-imperative-to-declarative.md) | 🟢 Beginner |
| A004 | [The kubectl explain Hunt](A004-kubectl-explain-hunt.md) | 🟢 Beginner |
| A005 | [Namespace Hygiene](A005-namespace-hygiene.md) | 🟢 Beginner |

## Pods

| # | Assignment | Level |
|---|---|---|
| A006 | [Multi-Container Pod](A006-multi-container-pod.md) | 🟢 Beginner |
| A007 | [Init Containers that Wait](A007-init-container-wait.md) | 🟢 Beginner |
| A008 | [Native Sidecar Log Shipper](A008-native-sidecar-logging.md) | 🔵 Intermediate |
| A009 | [Debugging with Ephemeral Containers](A009-pod-debugging-ephemeral.md) | 🔵 Intermediate |
| A010 | [Static Pods](A010-static-pod.md) | 🔵 Intermediate |

## Deployments

| # | Assignment | Level |
|---|---|---|
| A011 | [Rolling Update Tuning](A011-rolling-update-tuning.md) | 🟢 Beginner |
| A012 | [Rollback Drill](A012-rollback-drill.md) | 🟢 Beginner |
| A013 | [Recreate vs RollingUpdate](A013-recreate-vs-rolling.md) | 🟢 Beginner |
| A014 | [Prove Zero-Downtime Deploys](A014-zero-downtime-deploy.md) | 🔵 Intermediate |
| A015 | [Revision History & Change Causes](A015-deployment-revision-history.md) | 🟢 Beginner |

## Services

| # | Assignment | Level |
|---|---|---|
| A016 | [Service Types Tour](A016-service-types-tour.md) | 🟢 Beginner |
| A017 | [Headless Services & DNS](A017-headless-service-dns.md) | 🔵 Intermediate |
| A018 | [ExternalName for an External Database](A018-externalname-database.md) | 🔵 Intermediate |
| A019 | [Client IP Preservation](A019-external-traffic-policy.md) | 🔵 Intermediate |
| A020 | [Fix Five Broken Services](A020-debug-broken-service.md) | 🔵 Intermediate |

## Configuration

| # | Assignment | Level |
|---|---|---|
| A021 | [ConfigMaps as Env and Files](A021-configmap-env-and-files.md) | 🟢 Beginner |
| A022 | [Config Hot Reload](A022-config-hot-reload.md) | 🔵 Intermediate |
| A023 | [Secrets Done Right](A023-secrets-done-right.md) | 🔵 Intermediate |
| A024 | [Immutable Config Rollouts](A024-immutable-config-rollout.md) | 🔵 Intermediate |

## Storage

| # | Assignment | Level |
|---|---|---|
| A025 | [Dynamic Provisioning](A025-dynamic-provisioning.md) | 🟢 Beginner |
| A026 | [Expand a Live Volume](A026-pvc-expansion.md) | 🔵 Intermediate |
| A027 | [Snapshot and Restore a Volume](A027-snapshot-restore.md) | 🔵 Intermediate |
| A028 | [Shared RWX Storage](A028-rwx-shared-storage.md) | 🔵 Intermediate |

## StatefulSets

| # | Assignment | Level |
|---|---|---|
| A029 | [PostgreSQL on a StatefulSet](A029-postgres-statefulset.md) | 🔵 Intermediate |
| A030 | [Stable Identity Under Scaling](A030-statefulset-scaling-identity.md) | 🔵 Intermediate |
| A031 | [Partitioned StatefulSet Rollouts](A031-statefulset-rolling-partition.md) | 🟣 Advanced |

## DaemonSets & Jobs

| # | Assignment | Level |
|---|---|---|
| A032 | [Node Agent DaemonSet](A032-node-exporter-daemonset.md) | 🟢 Beginner |
| A033 | [Parallel Indexed Jobs](A033-parallel-job-queue.md) | 🔵 Intermediate |
| A034 | [Scheduled Backup CronJob](A034-cronjob-backup.md) | 🔵 Intermediate |
| A035 | [Job Failure Policies](A035-job-failure-policy.md) | 🟣 Advanced |

## Resource Management

| # | Assignment | Level |
|---|---|---|
| A036 | [Requests, Limits & QoS](A036-requests-limits-qos.md) | 🟢 Beginner |
| A037 | [LimitRange Defaults](A037-limitrange-defaults.md) | 🔵 Intermediate |
| A038 | [ResourceQuota for a Team](A038-resourcequota-team.md) | 🔵 Intermediate |
| A039 | [OOMKill Investigation](A039-oomkill-investigation.md) | 🔵 Intermediate |
| A040 | [CPU Throttling Analysis](A040-cpu-throttling-analysis.md) | 🟣 Advanced |

## Health & Lifecycle

| # | Assignment | Level |
|---|---|---|
| A041 | [Design Probes for Three Apps](A041-probe-design.md) | 🔵 Intermediate |
| A042 | [Graceful Shutdown](A042-graceful-shutdown.md) | 🟣 Advanced |
| A043 | [Taming a Slow-Starting App](A043-slow-start-app.md) | 🔵 Intermediate |

## Scheduling

| # | Assignment | Level |
|---|---|---|
| A044 | [Dedicated Node Pool](A044-dedicated-node-pool.md) | 🔵 Intermediate |
| A045 | [Zone Spreading](A045-zone-spread.md) | 🔵 Intermediate |
| A046 | [Anti-Affinity for HA](A046-anti-affinity-ha.md) | 🔵 Intermediate |
| A047 | [Priority & Preemption](A047-priority-preemption.md) | 🟣 Advanced |
| A048 | [The Pending Pod Puzzle](A048-pending-pod-puzzle.md) | 🔵 Intermediate |

## Autoscaling

| # | Assignment | Level |
|---|---|---|
| A049 | [HPA on CPU](A049-hpa-cpu.md) | 🟢 Beginner |
| A050 | [HPA on Custom Metrics](A050-hpa-custom-metrics.md) | 🟣 Advanced |
| A051 | [VPA Recommendations](A051-vpa-recommendations.md) | 🔵 Intermediate |
| A052 | [Event-Driven Scaling with KEDA](A052-keda-queue-scaling.md) | 🟣 Advanced |
| A053 | [Node Autoscaling Design](A053-cluster-autoscaler-sim.md) | 🟣 Advanced |

## Ingress & Gateway API

| # | Assignment | Level |
|---|---|---|
| A054 | [Host and Path Routing](A054-ingress-host-path.md) | 🟢 Beginner |
| A055 | [TLS with cert-manager](A055-tls-with-cert-manager.md) | 🔵 Intermediate |
| A056 | [Gateway API Canary](A056-gateway-api-canary.md) | 🔵 Intermediate |
| A057 | [Migrate Ingress to Gateway API](A057-ingress-to-gateway-migration.md) | 🟣 Advanced |

## Network Policies

| # | Assignment | Level |
|---|---|---|
| A058 | [Default Deny](A058-default-deny-namespace.md) | 🔵 Intermediate |
| A059 | [Three-Tier Network Policies](A059-three-tier-policies.md) | 🔵 Intermediate |
| A060 | [Egress Lockdown](A060-egress-lockdown.md) | 🟣 Advanced |
| A061 | [Cross-Namespace Access](A061-cross-namespace-policy.md) | 🔵 Intermediate |

## RBAC

| # | Assignment | Level |
|---|---|---|
| A062 | [Least-Privilege Developer Role](A062-developer-role.md) | 🟢 Beginner |
| A063 | [CI ServiceAccount](A063-ci-serviceaccount.md) | 🔵 Intermediate |
| A064 | [RBAC Audit](A064-rbac-audit.md) | 🟣 Advanced |
| A065 | [SSO Groups to RBAC](A065-oidc-groups-mapping.md) | 🟣 Advanced |

## Security

| # | Assignment | Level |
|---|---|---|
| A066 | [Enforce Restricted Pod Security](A066-restricted-pod-security.md) | 🔵 Intermediate |
| A067 | [Harden a Deployment](A067-harden-a-deployment.md) | 🔵 Intermediate |
| A068 | [Image Scanning Gate](A068-image-scanning-gate.md) | 🔵 Intermediate |
| A069 | [CEL Admission Policies](A069-admission-policy-cel.md) | 🟣 Advanced |
| A070 | [Policy-as-Code with Kyverno](A070-kyverno-policies.md) | 🟣 Advanced |
| A071 | [Runtime Detection with Falco](A071-runtime-detection-falco.md) | 🟣 Advanced |

## Secrets Management

| # | Assignment | Level |
|---|---|---|
| A072 | [External Secrets Operator](A072-external-secrets.md) | 🔵 Intermediate |
| A073 | [Sealed Secrets in Git](A073-sealed-secrets.md) | 🔵 Intermediate |
| A074 | [Encrypt Secrets at Rest](A074-etcd-encryption-at-rest.md) | 🟣 Advanced |

## Helm

| # | Assignment | Level |
|---|---|---|
| A075 | [Helm Chart from Scratch](A075-helm-chart-from-scratch.md) | 🔵 Intermediate |
| A076 | [Values per Environment](A076-helm-values-per-env.md) | 🔵 Intermediate |
| A077 | [Helm Upgrade & Rollback](A077-helm-upgrade-rollback.md) | 🟢 Beginner |
| A078 | [Lint and Test a Chart](A078-helm-chart-testing.md) | 🟣 Advanced |

## Kustomize

| # | Assignment | Level |
|---|---|---|
| A079 | [Kustomize Overlays](A079-kustomize-overlays.md) | 🔵 Intermediate |
| A080 | [Kustomize Components](A080-kustomize-components.md) | 🟣 Advanced |

## GitOps

| # | Assignment | Level |
|---|---|---|
| A081 | [Argo CD App of Apps](A081-argocd-app-of-apps.md) | 🔵 Intermediate |
| A082 | [Sync Waves and Hooks](A082-argocd-sync-waves.md) | 🟣 Advanced |
| A083 | [Flux Image Automation](A083-flux-image-automation.md) | 🟣 Advanced |
| A084 | [Environment Promotion](A084-gitops-promotion.md) | 🟣 Advanced |

## CI/CD

| # | Assignment | Level |
|---|---|---|
| A085 | [CI/CD Pipeline to Kubernetes](A085-github-actions-to-k8s.md) | 🔵 Intermediate |
| A086 | [Preview Environments per PR](A086-preview-environments.md) | 🟣 Advanced |

## Observability

| # | Assignment | Level |
|---|---|---|
| A087 | [Prometheus Monitoring Stack](A087-prometheus-stack.md) | 🔵 Intermediate |
| A088 | [SLOs and Burn-Rate Alerts](A088-slo-alerting.md) | 🟣 Advanced |
| A089 | [Centralized Logging](A089-centralized-logging.md) | 🔵 Intermediate |
| A090 | [Distributed Tracing](A090-distributed-tracing.md) | 🟣 Advanced |
| A091 | [Golden Signals Dashboard](A091-dashboards-golden-signals.md) | 🔵 Intermediate |

## Deployment Strategies

| # | Assignment | Level |
|---|---|---|
| A092 | [Blue-Green Deployment](A092-blue-green.md) | 🔵 Intermediate |
| A093 | [Canary with Argo Rollouts](A093-argo-rollouts-canary.md) | 🟣 Advanced |
| A094 | [Automated Canary Analysis](A094-progressive-delivery-analysis.md) | 🟣 Advanced |

## Service Mesh

| # | Assignment | Level |
|---|---|---|
| A095 | [Service Mesh mTLS](A095-mesh-mtls.md) | 🟣 Advanced |
| A096 | [Mesh Traffic Shifting & Resilience](A096-mesh-traffic-shifting.md) | 🟣 Advanced |

## Cluster Operations

| # | Assignment | Level |
|---|---|---|
| A097 | [Build a Cluster with kubeadm](A097-kubeadm-cluster.md) | 🟣 Advanced |
| A098 | [Upgrade a Cluster](A098-cluster-upgrade.md) | 🟣 Advanced |
| A099 | [Node Maintenance](A099-node-maintenance-drain.md) | 🔵 Intermediate |
| A100 | [etcd Backup and Restore](A100-etcd-backup-restore.md) | 🟣 Advanced |
| A101 | [Certificate Expiry Drill](A101-certificate-renewal.md) | 🟣 Advanced |

## Backup & DR

| # | Assignment | Level |
|---|---|---|
| A102 | [Velero Backup & Restore](A102-velero-backup-restore.md) | 🔵 Intermediate |
| A103 | [Disaster Recovery Game Day](A103-dr-game-day.md) | 🔴 Expert |

## Multi-Tenancy

| # | Assignment | Level |
|---|---|---|
| A104 | [Self-Service Tenant Onboarding](A104-tenant-onboarding.md) | 🟣 Advanced |

## Cost Optimization

| # | Assignment | Level |
|---|---|---|
| A105 | [Rightsizing Report](A105-rightsizing-report.md) | 🔵 Intermediate |
| A106 | [Running on Spot Capacity](A106-spot-nodes.md) | 🟣 Advanced |

## Multi-Cluster

| # | Assignment | Level |
|---|---|---|
| A107 | [Multi-Cluster GitOps](A107-multi-cluster-gitops.md) | 🔴 Expert |

## Kubernetes for AI/ML

| # | Assignment | Level |
|---|---|---|
| A108 | [GPU Workloads](A108-gpu-workload.md) | 🟣 Advanced |

## Capstones

| # | Assignment | Level |
|---|---|---|
| A109 | [Production Readiness Review](A109-production-readiness-review.md) | 🔴 Expert |
| A110 | [Capstone: Microservices Platform](A110-capstone-microservices-platform.md) | 🔴 Expert |
| A111 | [Capstone: Incident Simulation](A111-capstone-incident-simulation.md) | 🔴 Expert |
| A112 | [Capstone: Migrate a VM App](A112-capstone-migrate-vm-app.md) | 🔴 Expert |

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
