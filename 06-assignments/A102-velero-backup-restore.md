<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A102 · Velero Backup & Restore

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Backup & DR | 1–2 hours | [Module 28 · Backup & Disaster Recovery](../02-modules/28-backup-disaster-recovery.md) |

## Scenario

Back up a namespace and restore it elsewhere.

## Your tasks

1. Install Velero with MinIO or cloud storage
2. Back up a namespace including volume data
3. Delete the namespace and restore it
4. Restore into a different namespace with label mappings
5. Schedule nightly backups with TTL

## Acceptance criteria

- [ ] Restores are complete and data intact
- [ ] Scheduled backups exist
- [ ] Restore time measured

<details>
<summary>Hints (try without them first)</summary>

- --default-volumes-to-fs-backup uses the node agent for file-level backup

</details>

## Stretch goal

Restore into a different cluster to simulate regional DR.

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
