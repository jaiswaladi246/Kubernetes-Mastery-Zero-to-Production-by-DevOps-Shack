<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A110 · Capstone: Microservices Platform

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔴 Expert | Capstones | 1–2 days | [Module 33 · Production Readiness](../02-modules/33-production-readiness.md) |

## Scenario

Build a production-like platform end to end, as you would in your first month at a new company.

## Your tasks

1. Provision a cluster with IaC (kind config or Terraform on cloud)
2. Bootstrap GitOps with Argo CD
3. Install ingress/gateway, cert-manager, monitoring, logging, policy engine and External Secrets
4. Deploy a 4-service app with a database using Helm or Kustomize
5. Add SLO alerts, network policies, PSA restricted and backups
6. Write an architecture document with diagrams

## Acceptance criteria

- [ ] Everything is declarative and recreatable from Git
- [ ] App reachable over HTTPS
- [ ] Alerts, logs, traces and backups work
- [ ] Architecture document explains every choice

<details>
<summary>Hints (try without them first)</summary>

- Reuse Lab 25 as your app starting point

</details>

## Stretch goal

Record a 10-minute walkthrough video of your platform for your portfolio.

## Submit

Push your manifests, scripts and a short `NOTES.md` (what you did, what broke, what you learned) to your own repository. Share it on LinkedIn and tag **DevOps Shack** if you'd like feedback.

← [All assignments](README.md)

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
