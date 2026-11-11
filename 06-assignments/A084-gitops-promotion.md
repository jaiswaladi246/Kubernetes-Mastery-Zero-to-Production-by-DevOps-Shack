<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A084 · Environment Promotion

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | GitOps | 2–4 hours | [Module 21 · GitOps with Argo CD & Flux](../02-modules/21-gitops.md) |

## Scenario

Design how changes move from dev to staging to prod with GitOps.

## Your tasks

1. Structure a config repo with per-environment overlays
2. Implement promotion as PRs that bump an image tag
3. Add automated checks on promotion PRs (render, validate, policy)
4. Document rollback

## Acceptance criteria

- [ ] A change flows dev → staging → prod via PRs
- [ ] Checks block an invalid promotion
- [ ] Rollback is a revert

<details>
<summary>Hints (try without them first)</summary>

- Keep environments as directories, not long-lived branches

</details>

## Stretch goal

Try Kargo for promotion pipelines and compare.

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
