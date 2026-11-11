<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A007 · Init Containers that Wait

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟢 Beginner | Pods | 45–60 min | [Module 02 · Pods](../02-modules/02-pods.md) |

## Scenario

Your API pods crash on startup whenever the database isn't up yet, filling the logs with noise during every cluster restart.

## Your tasks

1. Deploy a Postgres pod and Service
2. Deploy an API whose init container waits until Postgres accepts connections
3. Add a second init container that runs a fake migration and fails 50% of the time
4. Observe and document init container retry behaviour and pod status transitions

## Acceptance criteria

- [ ] The API container never starts before Postgres is reachable
- [ ] Init failures show `Init:Error` / `Init:CrashLoopBackOff` and retry
- [ ] Notes include the pod status sequence you observed

<details>
<summary>Hints (try without them first)</summary>

- `pg_isready -h postgres` or `nc -z postgres 5432` in a loop
- `kubectl get pod -w` shows Init:0/2 transitions

</details>

## Stretch goal

Argue in your notes whether waiting in an init container is better or worse than the app retrying connections itself, with production reasoning.

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
