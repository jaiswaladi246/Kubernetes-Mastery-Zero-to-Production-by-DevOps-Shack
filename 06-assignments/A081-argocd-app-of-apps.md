<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A081 · Argo CD App of Apps

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | GitOps | 1–2 hours | [Module 21 · GitOps with Argo CD & Flux](../02-modules/21-gitops.md) |

## Scenario

A cluster needs ten platform add-ons and four apps managed declaratively.

## Your tasks

1. Install Argo CD
2. Create a root Application pointing at a folder of child Applications (app of apps)
3. Include cert-manager, ingress, monitoring and two apps
4. Bootstrap a fresh cluster from the root app only

## Acceptance criteria

- [ ] One `kubectl apply` of the root app recreates everything
- [ ] Sync status healthy
- [ ] Repo structure documented

<details>
<summary>Hints (try without them first)</summary>

- Child Applications live in the argocd namespace

</details>

## Stretch goal

Replace app of apps with an ApplicationSet using a Git directory generator.

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
