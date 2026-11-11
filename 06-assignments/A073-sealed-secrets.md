<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A073 · Sealed Secrets in Git

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Secrets Management | 1–2 hours | [Module 18 · Secrets Management in Production](../02-modules/18-secrets-management.md) |

## Scenario

Your GitOps repo must contain secrets, safely.

## Your tasks

1. Install Sealed Secrets
2. Seal a secret and commit it
3. Apply via kubectl or Argo CD
4. Back up and restore the controller key into a new cluster and prove old sealed secrets still decrypt

## Acceptance criteria

- [ ] Sealed secret decrypts in-cluster
- [ ] Key backup/restore works
- [ ] Notes cover key rotation

<details>
<summary>Hints (try without them first)</summary>

- The controller key is a Secret in the controller's namespace with a specific label

</details>

## Stretch goal

Do the same with SOPS + age and Flux, and compare.

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
