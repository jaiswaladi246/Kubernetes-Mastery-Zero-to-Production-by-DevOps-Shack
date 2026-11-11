<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A080 · Kustomize Components

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Kustomize | 2–4 hours | [Module 20 · Kustomize](../02-modules/20-kustomize.md) |

## Scenario

Some environments need monitoring and some need debug tooling. Avoid overlay explosion.

## Your tasks

1. Create Kustomize components for monitoring (ServiceMonitor), debug (extra logging sidecar) and hardening (securityContext patches)
2. Compose them into overlays selectively
3. Render every combination

## Acceptance criteria

- [ ] Components are reusable and independent
- [ ] Overlays stay small
- [ ] Rendered output validated

<details>
<summary>Hints (try without them first)</summary>

- Components use kind: Component and apiVersion kustomize.config.k8s.io/v1alpha1

</details>

## Stretch goal

Write a script that renders all overlays and fails on any validation error.

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
