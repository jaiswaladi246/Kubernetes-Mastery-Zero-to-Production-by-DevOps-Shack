<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A099 · Node Maintenance

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Cluster Operations | 1–2 hours | [Module 27 · Cluster Operations & Upgrades](../02-modules/27-cluster-operations-upgrades.md) |

## Scenario

A kernel patch requires rebooting every node this week.

## Your tasks

1. Write a node maintenance runbook
2. Cordon, drain and uncordon nodes with PDBs in place
3. Handle a pod without a controller and a pod with emptyDir
4. Show a drain blocked by a PDB and resolve it

## Acceptance criteria

- [ ] Runbook covers each case
- [ ] Blocked drain diagnosed and resolved safely
- [ ] No unexpected outages

<details>
<summary>Hints (try without them first)</summary>

- --ignore-daemonsets and --delete-emptydir-data flags

</details>

## Stretch goal

Install kured (Kubernetes Reboot Daemon) to automate safe reboots.

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
