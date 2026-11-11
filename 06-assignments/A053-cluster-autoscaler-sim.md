<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A053 · Node Autoscaling Design

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Autoscaling | 2–4 hours | [Module 13 · Autoscaling](../02-modules/13-autoscaling.md) |

## Scenario

Leadership asks whether to adopt Karpenter or keep Cluster Autoscaler.

## Your tasks

1. Explain both architectures with diagrams
2. Design node pools / NodePools for a mix of web, batch and GPU workloads
3. List scale-down blockers and how you'd handle them
4. Simulate node autoscaling decisions on paper for a given burst of pending pods

## Acceptance criteria

- [ ] Diagrams for both
- [ ] Pool design covers spot, on-demand and GPU
- [ ] Scale-down blockers addressed

<details>
<summary>Hints (try without them first)</summary>

- Consider instance diversity, consolidation and interruption handling

</details>

## Stretch goal

If you have cloud access, implement Karpenter on EKS and record time-to-node for 20 pending pods.

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
