<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A078 · Lint and Test a Chart

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Helm | 2–4 hours | [Module 19 · Helm](../02-modules/19-helm.md) |

## Scenario

Chart changes keep breaking production. Add quality gates.

## Your tasks

1. Add chart-testing (ct) lint and install in a CI pipeline using kind
2. Validate rendered manifests with kubeconform
3. Add unit tests with helm-unittest
4. Fail the pipeline on deprecated APIs

## Acceptance criteria

- [ ] Pipeline catches a deliberately broken template
- [ ] Unit tests cover key templates
- [ ] Deprecated API detection works

<details>
<summary>Hints (try without them first)</summary>

- helm/chart-testing-action and helm/kind-action exist for GitHub Actions

</details>

## Stretch goal

Add a policy check (Kyverno CLI or conftest) on rendered output.

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
