<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A031 · Partitioned StatefulSet Rollouts

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | StatefulSets | 2–4 hours | [Module 08 · StatefulSets](../02-modules/08-statefulsets.md) |

## Scenario

A database upgrade must be tested on one replica before the rest.

## Your tasks

1. Use a 3-replica StatefulSet
2. Set partition 2, update the image, and verify only ordinal 2 updated
3. Roll forward to all
4. Practise OnDelete strategy for manual control

## Acceptance criteria

- [ ] Revisions per pod shown with controller-revision-hash
- [ ] Rollback of the canary replica demonstrated

<details>
<summary>Hints (try without them first)</summary>

- `kubectl get pods -L controller-revision-hash`

</details>

## Stretch goal

Write a script that advances the partition one step at a time, waiting for readiness and a health query between steps.

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
