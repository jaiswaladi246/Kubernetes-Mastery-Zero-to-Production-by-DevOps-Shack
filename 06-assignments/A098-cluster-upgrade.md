<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A098 · Upgrade a Cluster

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Cluster Operations | 2–4 hours | [Module 27 · Cluster Operations & Upgrades](../02-modules/27-cluster-operations-upgrades.md) |

## Scenario

Your kubeadm cluster is one minor version behind. Upgrade it with zero downtime.

## Your tasks

1. Run a workload with a PDB and continuous traffic
2. Upgrade the control plane with kubeadm
3. Upgrade workers one at a time with drain/uncordon
4. Verify versions and that traffic never failed

## Acceptance criteria

- [ ] All components on the new version
- [ ] No request failures
- [ ] Upgrade log documented

<details>
<summary>Hints (try without them first)</summary>

- Follow the official kubeadm upgrade order exactly

</details>

## Stretch goal

Script the worker upgrade so it can run unattended with health checks.

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
