<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A104 · Self-Service Tenant Onboarding

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Multi-Tenancy | 2–4 hours | [Module 29 · Multi-Tenancy](../02-modules/29-multi-tenancy.md) |

## Scenario

Teams wait days for a namespace. Make onboarding self-service and safe.

## Your tasks

1. Define a tenant template: namespace, quota, LimitRange, RBAC, default-deny policies, PSA labels
2. Automate creation from one small YAML (Kyverno generate, Capsule, Helm or ApplicationSet)
3. Onboard two tenants
4. Prove isolation between them

## Acceptance criteria

- [ ] New tenant ready in one step
- [ ] Tenants can't see or reach each other
- [ ] Template versioned in Git

<details>
<summary>Hints (try without them first)</summary>

- Capsule's Tenant CRD or Kyverno generate rules both work

</details>

## Stretch goal

Give each tenant a vCluster and compare isolation and cost.

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
