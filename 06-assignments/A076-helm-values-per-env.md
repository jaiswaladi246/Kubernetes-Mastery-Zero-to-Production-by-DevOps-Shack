<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A076 · Values per Environment

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Helm | 1–2 hours | [Module 19 · Helm](../02-modules/19-helm.md) |

## Scenario

The same chart must deploy to dev, staging and prod with different settings.

## Your tasks

1. Create values-dev, values-staging, values-prod
2. Vary replicas, resources, ingress host, autoscaling and log level
3. Render each and diff
4. Document value precedence

## Acceptance criteria

- [ ] Rendered diffs show only intended changes
- [ ] Precedence (defaults < files < --set) explained

<details>
<summary>Hints (try without them first)</summary>

- `diff <(helm template ... -f values-dev.yaml) <(helm template ... -f values-prod.yaml)`

</details>

## Stretch goal

Manage the three environments with a Helmfile or Argo CD ApplicationSet.

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
