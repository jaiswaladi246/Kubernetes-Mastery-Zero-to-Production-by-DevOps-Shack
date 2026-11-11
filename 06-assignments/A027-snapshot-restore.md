<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A027 · Snapshot and Restore a Volume

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Storage | 1–2 hours | [Module 07 · Storage: Volumes, PVs & PVCs](../02-modules/07-storage.md) |

## Scenario

Before a risky migration you must snapshot a volume and prove you can restore it.

## Your tasks

1. Install the snapshot CRDs and controller plus a CSI driver with snapshot support
2. Write data, take a VolumeSnapshot
3. Corrupt the data
4. Restore to a new PVC from the snapshot and verify contents

## Acceptance criteria

- [ ] Snapshot ReadyToUse is true
- [ ] Restored PVC contains the pre-corruption data
- [ ] Notes explain why snapshots alone aren't a backup strategy

<details>
<summary>Hints (try without them first)</summary>

- The CSI hostpath driver repo includes a snapshot-capable demo deployment

</details>

## Stretch goal

Automate a nightly snapshot with a CronJob and retention of 7 snapshots.

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
