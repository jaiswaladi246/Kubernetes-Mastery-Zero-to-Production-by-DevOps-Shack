<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A048 · The Pending Pod Puzzle

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Scheduling | 1–2 hours | [Module 12 · Advanced Scheduling](../02-modules/12-scheduling.md) |

## Scenario

Five pods are Pending and the on-call engineer is stuck.

## Your tasks

1. Create five Pending pods, each for a different reason: insufficient CPU, untolerated taint, node selector mismatch, unbound PVC, hard anti-affinity
2. For each, read the FailedScheduling event and explain it
3. Fix each with the smallest change

## Acceptance criteria

- [ ] Each reason identified from events alone
- [ ] Each fix is minimal and documented

<details>
<summary>Hints (try without them first)</summary>

- The event message tallies how many nodes failed each filter

</details>

## Stretch goal

Write a kubectl plugin that summarises why every Pending pod in a namespace can't schedule.

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
