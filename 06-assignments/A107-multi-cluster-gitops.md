<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A107 · Multi-Cluster GitOps

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔴 Expert | Multi-Cluster | 1–2 days | [Module 31 · Multi-Cluster Kubernetes](../02-modules/31-multi-cluster.md) |

## Scenario

Deploy the same app to three clusters with region-specific settings.

## Your tasks

1. Create three kind clusters
2. Register them with one Argo CD
3. Use an ApplicationSet with a cluster generator and per-cluster values
4. Roll out a change cluster by cluster

## Acceptance criteria

- [ ] All clusters converge from one ApplicationSet
- [ ] Per-cluster config applied
- [ ] Progressive rollout demonstrated

<details>
<summary>Hints (try without them first)</summary>

- Label cluster secrets in Argo CD and select them in the generator

</details>

## Stretch goal

Add a global entry point with weighted DNS (simulate with a local load balancer).

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
