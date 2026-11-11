<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A033 · Parallel Indexed Jobs

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | DaemonSets & Jobs | 1–2 hours | [Module 09 · DaemonSets, Jobs & CronJobs](../02-modules/09-daemonsets-jobs-cronjobs.md) |

## Scenario

You must process 100 image shards with at most 10 in parallel and know which shard failed.

## Your tasks

1. Create an Indexed Job with completions 100 and parallelism 10
2. Make shard 37 fail
3. Use backoffLimitPerIndex so one bad shard doesn't fail the rest
4. Report failed indexes

## Acceptance criteria

- [ ] 99 indexes succeed
- [ ] Job status lists the failed index
- [ ] ttlSecondsAfterFinished cleans up

<details>
<summary>Hints (try without them first)</summary>

- `.status.failedIndexes` and `backoffLimitPerIndex` are Job fields

</details>

## Stretch goal

Implement the work-queue pattern with Redis instead of indexes.

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
