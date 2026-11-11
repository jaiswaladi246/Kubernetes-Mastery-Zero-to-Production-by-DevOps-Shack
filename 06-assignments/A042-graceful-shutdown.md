<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A042 · Graceful Shutdown

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Health & Lifecycle | 2–4 hours | [Module 11 · Health Probes & Lifecycle Hooks](../02-modules/11-health-probes-lifecycle.md) |

## Scenario

A payment service drops in-flight requests on every scale-down.

## Your tasks

1. Write (or use) a small HTTP server that handles SIGTERM by draining in-flight requests
2. Show the broken behaviour without signal handling
3. Add preStop, terminationGracePeriodSeconds and proper PID 1 handling
4. Prove zero dropped requests during scale-down from 5 to 1

## Acceptance criteria

- [ ] Dropped request count goes to zero
- [ ] Notes explain shell-form vs exec-form entrypoints
- [ ] Long requests (10 s) complete during shutdown

<details>
<summary>Hints (try without them first)</summary>

- tini or dumb-init as PID 1
- `exec` your process in shell entrypoints

</details>

## Stretch goal

Handle long-lived WebSocket connections gracefully.

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
