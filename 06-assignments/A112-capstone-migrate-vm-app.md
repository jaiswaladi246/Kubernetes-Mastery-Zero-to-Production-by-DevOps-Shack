<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A112 · Capstone: Migrate a VM App

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔴 Expert | Capstones | 1–2 days | [Module 33 · Production Readiness](../02-modules/33-production-readiness.md) |

## Scenario

A company runs a monolith on VMs and wants it on Kubernetes without a rewrite.

## Your tasks

1. Pick an open-source app that normally runs on a VM (e.g. a PHP app with MySQL and cron)
2. Containerise it with proper config externalisation
3. Model it with Deployments, StatefulSet, CronJobs, Ingress and Secrets
4. Plan data migration and cutover with rollback
5. Document what you'd refactor later

## Acceptance criteria

- [ ] App runs on Kubernetes with persistent data
- [ ] Cron tasks work as CronJobs
- [ ] Cutover plan is realistic
- [ ] Twelve-factor gaps identified

<details>
<summary>Hints (try without them first)</summary>

- Logs to stdout, config from env, state out of the container filesystem

</details>

## Stretch goal

Split one module out of the monolith into its own service using the strangler pattern behind the ingress.

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
