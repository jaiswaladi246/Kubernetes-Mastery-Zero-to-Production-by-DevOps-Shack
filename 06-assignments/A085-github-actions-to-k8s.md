<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A085 · CI/CD Pipeline to Kubernetes

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | CI/CD | 1–2 hours | [Module 22 · CI/CD for Kubernetes](../02-modules/22-cicd-for-kubernetes.md) |

## Scenario

Build the complete pipeline from commit to running pods.

## Your tasks

1. Write a GitHub Actions (or GitLab CI) pipeline: test, build, scan, push with SHA tag
2. Validate manifests
3. Update the GitOps repo
4. Let Argo CD deploy
5. Add a smoke test after sync

## Acceptance criteria

- [ ] A commit results in a deployed, verified version without manual steps
- [ ] Pipeline fails on a failing test or critical CVE

<details>
<summary>Hints (try without them first)</summary>

- Use a deploy key or fine-grained token for the config repo

</details>

## Stretch goal

Sign images with cosign keyless and verify at admission.

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
