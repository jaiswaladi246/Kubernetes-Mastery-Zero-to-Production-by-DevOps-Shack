<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A083 · Flux Image Automation

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | GitOps | 2–4 hours | [Module 21 · GitOps with Argo CD & Flux](../02-modules/21-gitops.md) |

## Scenario

Every new image in the registry should be deployed to dev automatically, with a Git commit as the record.

## Your tasks

1. Install Flux
2. Configure GitRepository and Kustomization
3. Configure ImageRepository, ImagePolicy (semver) and ImageUpdateAutomation
4. Push a new image tag and watch Flux commit the change and deploy it

## Acceptance criteria

- [ ] Flux commits the new tag to Git
- [ ] Cluster runs the new image
- [ ] Notes explain marker comments

<details>
<summary>Hints (try without them first)</summary>

- Flux image automation uses `# {"$imagepolicy": "flux-system:app"}` markers

</details>

## Stretch goal

Restrict automation to dev; promote to prod via pull request only.

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
