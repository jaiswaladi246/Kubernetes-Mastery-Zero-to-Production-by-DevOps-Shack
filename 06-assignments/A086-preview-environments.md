<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A086 · Preview Environments per PR

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | CI/CD | 2–4 hours | [Module 22 · CI/CD for Kubernetes](../02-modules/22-cicd-for-kubernetes.md) |

## Scenario

Reviewers want to click a link and see each pull request running.

## Your tasks

1. Create a namespace per PR
2. Deploy the PR's image there
3. Post the URL back to the PR
4. Delete the environment when the PR closes

## Acceptance criteria

- [ ] Opening a PR creates an environment
- [ ] Closing removes it
- [ ] Resource quotas cap each preview

<details>
<summary>Hints (try without them first)</summary>

- Argo CD ApplicationSet pull request generator automates this

</details>

## Stretch goal

Seed each preview with anonymised test data.

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
