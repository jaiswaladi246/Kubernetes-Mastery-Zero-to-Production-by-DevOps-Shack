<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A082 · Sync Waves and Hooks

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | GitOps | 2–4 hours | [Module 21 · GitOps with Argo CD & Flux](../02-modules/21-gitops.md) |

## Scenario

CRDs must exist before custom resources; database migrations must run before the app.

## Your tasks

1. Use sync waves to order namespaces, CRDs, operators and apps
2. Add a PreSync hook Job for migrations
3. Add a SyncFail hook that sends a notification
4. Show the ordering in the UI or CLI

## Acceptance criteria

- [ ] Resources apply in the intended order
- [ ] Migration runs before app pods
- [ ] Failure hook fires on a forced failure

<details>
<summary>Hints (try without them first)</summary>

- argocd.argoproj.io/sync-wave annotations with negative numbers run first

</details>

## Stretch goal

Add Argo CD Notifications to Slack for sync failures.

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
