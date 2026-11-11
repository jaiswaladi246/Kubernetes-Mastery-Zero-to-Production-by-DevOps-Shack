<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A079 · Kustomize Overlays

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Kustomize | 1–2 hours | [Module 20 · Kustomize](../02-modules/20-kustomize.md) |

## Scenario

Replace copy-pasted YAML across environments with Kustomize.

## Your tasks

1. Create a base and dev/staging/prod overlays
2. Use images, replicas, patches and configMapGenerator
3. Add namePrefix or namespace per overlay
4. Render and diff overlays

## Acceptance criteria

- [ ] No duplicated YAML across overlays
- [ ] Each overlay renders valid manifests
- [ ] Config changes roll pods via hash suffix

<details>
<summary>Hints (try without them first)</summary>

- `kubectl kustomize overlays/prod
- kubeconform -strict`

</details>

## Stretch goal

Pull a Helm chart into Kustomize with helmCharts and patch its output.

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
