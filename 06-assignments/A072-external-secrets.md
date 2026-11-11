<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A072 · External Secrets Operator

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Secrets Management | 1–2 hours | [Module 18 · Secrets Management in Production](../02-modules/18-secrets-management.md) |

## Scenario

Credentials live in AWS Secrets Manager or Vault and must reach pods without humans copying them.

## Your tasks

1. Run Vault in dev mode in-cluster (or use a cloud secret manager)
2. Install External Secrets Operator
3. Sync a secret into a namespace
4. Rotate the value and watch it propagate
5. Restart pods automatically on change

## Acceptance criteria

- [ ] Secret synced and refreshed
- [ ] Rotation reaches pods
- [ ] No secret material in Git

<details>
<summary>Hints (try without them first)</summary>

- ESO supports Vault's Kubernetes auth method

</details>

## Stretch goal

Use a ClusterSecretStore with per-namespace access restrictions.

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
