<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A034 · Scheduled Backup CronJob

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | DaemonSets & Jobs | 1–2 hours | [Module 09 · DaemonSets, Jobs & CronJobs](../02-modules/09-daemonsets-jobs-cronjobs.md) |

## Scenario

The database needs a nightly backup that never overlaps and alerts when it fails.

## Your tasks

1. Create a CronJob in your timezone with concurrencyPolicy Forbid and startingDeadlineSeconds
2. Store backups on a PVC or object storage
3. Make a run fail and show history retention
4. Trigger a manual run from the CronJob

## Acceptance criteria

- [ ] Schedule uses timeZone
- [ ] Overlap is prevented
- [ ] Failed jobs retained per limits
- [ ] Manual run works

<details>
<summary>Hints (try without them first)</summary>

- `kubectl create job --from=cronjob/<name> manual-1`

</details>

## Stretch goal

Alert when a CronJob hasn't succeeded in 26 hours using kube-state-metrics.

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
