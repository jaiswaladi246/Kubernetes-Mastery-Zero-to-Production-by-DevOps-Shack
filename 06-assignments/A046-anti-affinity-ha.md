<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A046 · Anti-Affinity for HA

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Scheduling | 1–2 hours | [Module 12 · Advanced Scheduling](../02-modules/12-scheduling.md) |

## Scenario

A 3-node Redis needs each replica on a different node, and the app's cache should sit near its API.

## Your tasks

1. Use required podAntiAffinity for Redis
2. Use preferred podAffinity to co-locate API pods with cache pods per zone
3. Scale Redis beyond the node count and show Pending
4. Compare with topology spread

## Acceptance criteria

- [ ] Anti-affinity enforced
- [ ] Pending pods explained from scheduler events
- [ ] Preferred affinity effect shown

<details>
<summary>Hints (try without them first)</summary>

- Required inter-pod rules are expensive at scale; prefer spread constraints for general workloads

</details>

## Stretch goal

Measure scheduling latency with and without required anti-affinity in a 200-pod Deployment.

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
