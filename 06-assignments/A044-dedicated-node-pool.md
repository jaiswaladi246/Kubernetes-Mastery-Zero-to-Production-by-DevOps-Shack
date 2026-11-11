<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A044 · Dedicated Node Pool

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Scheduling | 1–2 hours | [Module 12 · Advanced Scheduling](../02-modules/12-scheduling.md) |

## Scenario

The payments team needs nodes no one else can use, for compliance.

## Your tasks

1. Create a node pool (label + taint on two kind workers)
2. Make payments pods tolerate and require those nodes
3. Prove other pods never land there
4. Show what happens to existing pods when you add a NoExecute taint

## Acceptance criteria

- [ ] Dedicated nodes run only payments pods
- [ ] Payments pods never land elsewhere
- [ ] NoExecute eviction behaviour documented

<details>
<summary>Hints (try without them first)</summary>

- Taint repels, affinity attracts: you need both

</details>

## Stretch goal

Enforce this with an admission policy so no other namespace can add the toleration.

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
