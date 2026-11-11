<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A028 · Shared RWX Storage

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Storage | 1–2 hours | [Module 07 · Storage: Volumes, PVs & PVCs](../02-modules/07-storage.md) |

## Scenario

Ten web pods must share uploaded files.

## Your tasks

1. Set up RWX storage (NFS server in-cluster with the NFS CSI driver, or a cloud file service)
2. Mount it in a 3-replica Deployment across nodes
3. Prove concurrent writes are visible to all pods
4. Document performance and locking caveats

## Acceptance criteria

- [ ] All replicas on different nodes read each other's files
- [ ] Caveats documented

<details>
<summary>Hints (try without them first)</summary>

- The csi-driver-nfs project provides a StorageClass for an existing NFS server

</details>

## Stretch goal

Compare with object storage (S3/MinIO) as the design alternative and argue which you'd choose.

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
