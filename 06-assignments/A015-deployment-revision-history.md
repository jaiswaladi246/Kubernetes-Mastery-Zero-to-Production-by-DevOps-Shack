<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A015 · Revision History & Change Causes

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟢 Beginner | Deployments | 45–60 min | [Module 04 · Deployments & ReplicaSets](../02-modules/04-deployments.md) |

## Scenario

Auditors want to know what changed in production and why, for every deployment in the last month.

## Your tasks

1. Make every change carry `kubernetes.io/change-cause`
2. Set revisionHistoryLimit to 10 and explain etcd implications
3. Write a script that prints revision, image, change cause and timestamp for every revision of a Deployment
4. Explain why this isn't a substitute for Git history

## Acceptance criteria

- [ ] Script output is accurate for 5+ revisions
- [ ] Notes discuss ReplicaSet retention vs GitOps audit trail

<details>
<summary>Hints (try without them first)</summary>

- Each ReplicaSet carries the `deployment.kubernetes.io/revision` annotation

</details>

## Stretch goal

Ship Kubernetes audit logs to a file and find the user who made each change.

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
