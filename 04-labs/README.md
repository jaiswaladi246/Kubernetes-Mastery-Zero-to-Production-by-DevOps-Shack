<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# 04 · Hands-On Labs

25 guided labs with real manifests. Each lab tells you the goal, walks you through the steps, breaks something on purpose, and shows you how to verify and clean up.

## Setup once

```bash
# Docker + kubectl + kind + helm installed
kind create cluster --config lab-01-first-cluster/manifests/kind-3node.yaml
```

Most labs reuse that 3-node cluster (`devopsshack-lab`). Lab 23 creates its own disposable cluster.

| # | Lab | Level | Time |
|---|---|---|---|
| 01 | [Your First Cluster](lab-01-first-cluster/README.md) | 🟢 Beginner | 30 minutes |
| 02 | [Pods & Multi-Container Patterns](lab-02-pods-multicontainer/README.md) | 🟢 Beginner | 40 minutes |
| 03 | [Deployments & Rolling Updates](lab-03-deployments-rolling-updates/README.md) | 🟢 Beginner | 40 minutes |
| 04 | [Services & DNS](lab-04-services-dns/README.md) | 🟢 Beginner | 45 minutes |
| 05 | [ConfigMaps & Secrets](lab-05-config-secrets/README.md) | 🟢 Beginner | 35 minutes |
| 06 | [Persistent Storage](lab-06-persistent-storage/README.md) | 🟢 Beginner | 35 minutes |
| 07 | [StatefulSet Database](lab-07-statefulset-database/README.md) | 🔵 Intermediate | 45 minutes |
| 08 | [Jobs, CronJobs & DaemonSets](lab-08-jobs-cronjobs-daemonsets/README.md) | 🟢 Beginner | 35 minutes |
| 09 | [Resources, QoS & OOMKills](lab-09-resources-qos/README.md) | 🔵 Intermediate | 40 minutes |
| 10 | [Probes & Graceful Shutdown](lab-10-probes-graceful-shutdown/README.md) | 🔵 Intermediate | 45 minutes |
| 11 | [Scheduling: Taints, Affinity, Spread, Priority](lab-11-scheduling/README.md) | 🔵 Intermediate | 45 minutes |
| 12 | [HPA Autoscaling](lab-12-hpa-autoscaling/README.md) | 🟢 Beginner | 35 minutes |
| 13 | [Ingress](lab-13-ingress/README.md) | 🔵 Intermediate | 45 minutes |
| 14 | [Gateway API](lab-14-gateway-api/README.md) | 🔵 Intermediate | 45 minutes |
| 15 | [Network Policies](lab-15-network-policies/README.md) | 🔵 Intermediate | 45 minutes |
| 16 | [RBAC](lab-16-rbac/README.md) | 🔵 Intermediate | 40 minutes |
| 17 | [Pod Security & Hardening](lab-17-pod-security/README.md) | 🔵 Intermediate | 40 minutes |
| 18 | [Helm](lab-18-helm/README.md) | 🔵 Intermediate | 50 minutes |
| 19 | [Kustomize](lab-19-kustomize/README.md) | 🔵 Intermediate | 35 minutes |
| 20 | [GitOps with Argo CD](lab-20-argocd-gitops/README.md) | 🔵 Intermediate | 50 minutes |
| 21 | [Prometheus & Grafana](lab-21-prometheus-grafana/README.md) | 🟣 Advanced | 50 minutes |
| 22 | [The Troubleshooting Gauntlet](lab-22-troubleshooting-gauntlet/README.md) | 🟣 Advanced | 90 minutes |
| 23 | [etcd Backup & Restore](lab-23-etcd-backup-restore/README.md) | 🟣 Advanced | 45 minutes |
| 24 | [Velero Backup & Restore](lab-24-velero-backup/README.md) | 🟣 Advanced | 50 minutes |
| 25 | [End-to-End Microservices Platform](lab-25-end-to-end-microservices/README.md) | 🔴 Expert | 2–3 hours |

## Lab rules

- Type commands rather than pasting them when you're learning. Muscle memory matters in the CKA/CKAD.
- When a lab breaks something on purpose, diagnose it **before** reading the explanation.
- Every manifest is safe for a local cluster. Don't apply lab manifests to shared or production clusters.

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
