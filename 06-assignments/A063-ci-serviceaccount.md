<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A063 · CI ServiceAccount

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | RBAC | 1–2 hours | [Module 16 · RBAC & ServiceAccounts](../02-modules/16-rbac-service-accounts.md) |

## Scenario

CI currently deploys with a cluster-admin kubeconfig. Fix it.

## Your tasks

1. Create a ServiceAccount with a Role limited to updating Deployments and reading pods in one namespace
2. Generate a short-lived token
3. Use it from a CI-like script to deploy
4. Prove it can't read Secrets or touch other namespaces

## Acceptance criteria

- [ ] Deploy works with least privilege
- [ ] Forbidden actions verified
- [ ] Token is short-lived

<details>
<summary>Hints (try without them first)</summary>

- `kubectl create token ci --duration=30m`

</details>

## Stretch goal

Replace tokens with OIDC federation from GitHub Actions to a cloud cluster.

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
