<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A043 · Taming a Slow-Starting App

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Health & Lifecycle | 1–2 hours | [Module 11 · Health Probes & Lifecycle Hooks](../02-modules/11-health-probes-lifecycle.md) |

## Scenario

A legacy app takes between 30 seconds and 4 minutes to start and keeps getting killed by its liveness probe.

## Your tasks

1. Reproduce the restart loop with initialDelaySeconds only
2. Fix it with a startupProbe
3. Show liveness becomes active only after startup succeeds
4. Calculate the maximum startup window from your settings

## Acceptance criteria

- [ ] No restarts during slow starts
- [ ] Startup window calculation correct
- [ ] Notes compare initialDelaySeconds vs startupProbe

<details>
<summary>Hints (try without them first)</summary>

- max startup time = failureThreshold × periodSeconds

</details>

## Stretch goal

Add a readiness gate driven by an external controller or script.

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
