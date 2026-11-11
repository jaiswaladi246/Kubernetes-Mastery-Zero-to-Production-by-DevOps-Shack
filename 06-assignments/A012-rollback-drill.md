<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A012 · Rollback Drill

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟢 Beginner | Deployments | 45–60 min | [Module 04 · Deployments & ReplicaSets](../02-modules/04-deployments.md) |

## Scenario

A bad release just went out. Practise the rollback drill until it's muscle memory.

## Your tasks

1. Create five revisions of a Deployment with meaningful change-cause annotations
2. Introduce a broken revision (bad image)
3. Roll back to the previous revision, then to a specific older revision
4. Show the revision history before and after

## Acceptance criteria

- [ ] `kubectl rollout history` shows change causes
- [ ] Rollback restores service in under 60 seconds
- [ ] Notes explain why revision numbers keep increasing after a rollback

<details>
<summary>Hints (try without them first)</summary>

- `kubectl annotate deploy x kubernetes.io/change-cause="..."`
- `kubectl rollout undo --to-revision=N`

</details>

## Stretch goal

Implement the same rollback through Git with Argo CD and compare the two approaches.

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
