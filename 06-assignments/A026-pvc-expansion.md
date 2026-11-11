<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A026 · Expand a Live Volume

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Storage | 1–2 hours | [Module 07 · Storage: Volumes, PVs & PVCs](../02-modules/07-storage.md) |

## Scenario

A database volume is 90% full at 2 a.m. Expand it without downtime.

## Your tasks

1. Use a CSI driver that supports expansion (a cloud cluster, or a CSI hostpath driver locally)
2. Fill a volume to 90%
3. Expand the PVC and verify the filesystem grew inside the running pod
4. Document what happens if the class has allowVolumeExpansion false

## Acceptance criteria

- [ ] Filesystem size increased without pod restart (or document if your driver needs one)
- [ ] Commands and before/after df output included

<details>
<summary>Hints (try without them first)</summary>

- `kubectl patch pvc data -p '{"spec":{"resources":{"requests":{"storage":"20Gi"}}}}'`
- Check PVC conditions for FileSystemResizePending

</details>

## Stretch goal

Alert at 80% PVC usage using kubelet_volume_stats metrics.

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
