<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A022 · Config Hot Reload

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Configuration | 1–2 hours | [Module 06 · ConfigMaps & Secrets](../02-modules/06-configmaps-secrets.md) |

## Scenario

Restarting pods for every feature flag change is too slow. Make config reload live.

## Your tasks

1. Build or pick an app that reloads config when its file changes (nginx with a reload sidecar works)
2. Update the ConfigMap and measure propagation delay
3. Explain the kubelet sync period and cache TTL
4. Compare with a reloader controller that triggers rolling restarts

## Acceptance criteria

- [ ] Live reload demonstrated without pod restarts
- [ ] Propagation delay measured
- [ ] Pros and cons of both approaches documented

<details>
<summary>Hints (try without them first)</summary>

- A sidecar using inotifywait can send SIGHUP to nginx in a shared process namespace (`shareProcessNamespace: true`)

</details>

## Stretch goal

Install Stakater Reloader and configure it with annotations.

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
