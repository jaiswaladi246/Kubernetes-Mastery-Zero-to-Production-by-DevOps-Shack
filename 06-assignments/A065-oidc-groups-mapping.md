<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A065 · SSO Groups to RBAC

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | RBAC | 2–4 hours | [Module 16 · RBAC & ServiceAccounts](../02-modules/16-rbac-service-accounts.md) |

## Scenario

Your company uses SSO groups. Map them to cluster access.

## Your tasks

1. Run an OIDC provider locally (Dex or Keycloak)
2. Configure the API server (kind config patches) to trust it
3. Log in with kubelogin
4. Bind IdP groups to view/edit roles

## Acceptance criteria

- [ ] Login via browser works
- [ ] Group-based permissions verified
- [ ] Notes explain claim mapping and prefixes

<details>
<summary>Hints (try without them first)</summary>

- kind supports kubeadmConfigPatches for apiServer extraArgs or structured authentication config

</details>

## Stretch goal

Add a break-glass admin path that's audited.

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
