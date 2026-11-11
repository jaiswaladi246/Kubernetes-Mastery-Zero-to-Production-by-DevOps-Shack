<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A035 · Job Failure Policies

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | DaemonSets & Jobs | 2–4 hours | [Module 09 · DaemonSets, Jobs & CronJobs](../02-modules/09-daemonsets-jobs-cronjobs.md) |

## Scenario

A data pipeline retries forever on bad input, wasting compute. Make retries smart.

## Your tasks

1. Configure podFailurePolicy to fail the Job immediately on exit code 42
2. Ignore failures caused by node disruption
3. Count other failures against backoffLimit
4. Demonstrate all three paths

## Acceptance criteria

- [ ] Each failure type behaves as configured
- [ ] Notes explain DisruptionTarget condition

<details>
<summary>Hints (try without them first)</summary>

- Use `kubectl drain` to simulate a disruption

</details>

## Stretch goal

Add activeDeadlineSeconds and explain how it interacts with backoffLimit.

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
