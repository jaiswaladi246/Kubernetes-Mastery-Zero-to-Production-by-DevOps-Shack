<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A047 · Priority & Preemption

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Scheduling | 2–4 hours | [Module 12 · Advanced Scheduling](../02-modules/12-scheduling.md) |

## Scenario

Batch jobs keep starving customer-facing pods during peak hours.

## Your tasks

1. Create high and low PriorityClasses (low with preemptionPolicy Never in one variant)
2. Fill the cluster with low-priority pods
3. Deploy high-priority pods and watch preemption
4. Document the impact on the batch pods and PDB interaction

## Acceptance criteria

- [ ] Preemption observed with nominatedNodeName
- [ ] preemptionPolicy Never demonstrated
- [ ] Notes explain why system-critical classes exist

<details>
<summary>Hints (try without them first)</summary>

- Events on preempted pods mention preemption

</details>

## Stretch goal

Use a ResourceQuota scoped by priority class to cap high-priority usage per team.

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
