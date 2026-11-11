<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A106 · Running on Spot Capacity

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Cost Optimization | 2–4 hours | [Module 30 · Cost Optimization (FinOps for Kubernetes)](../02-modules/30-cost-optimization.md) |

## Scenario

Cut compute cost by running suitable workloads on spot capacity.

## Your tasks

1. Classify workloads as spot-safe or not
2. Configure a spot node pool (Karpenter NodePool or managed spot group)
3. Add PDBs, spread and graceful shutdown
4. Simulate an interruption and show recovery

## Acceptance criteria

- [ ] Spot-safe workloads run on spot
- [ ] Interruption causes no user-visible errors
- [ ] Classification criteria documented

<details>
<summary>Hints (try without them first)</summary>

- Diversify instance types; respect the 2-minute warning

</details>

## Stretch goal

Measure actual savings over a week.

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
