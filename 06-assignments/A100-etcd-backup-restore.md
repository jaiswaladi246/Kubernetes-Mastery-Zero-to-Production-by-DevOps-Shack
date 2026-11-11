<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A100 · etcd Backup and Restore

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Cluster Operations | 2–4 hours | [Module 27 · Cluster Operations & Upgrades](../02-modules/27-cluster-operations-upgrades.md) |

## Scenario

Prove you can recover the cluster if etcd is lost.

## Your tasks

1. Take an etcd snapshot
2. Create resources after the snapshot
3. Restore etcd from the snapshot
4. Explain what happened to the resources created after the snapshot and to running pods

## Acceptance criteria

- [ ] Restore succeeds
- [ ] Post-snapshot resources are gone as expected
- [ ] Notes explain the consistency implications

<details>
<summary>Hints (try without them first)</summary>

- Lab 23 walks through a single-node restore

</details>

## Stretch goal

Restore a 3-member etcd cluster.

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
