<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A025 · Dynamic Provisioning

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟢 Beginner | Storage | 45–60 min | [Module 07 · Storage: Volumes, PVs & PVCs](../02-modules/07-storage.md) |

## Scenario

Developers keep opening tickets for disks. Make storage self-service.

## Your tasks

1. Create two StorageClasses (standard and a "retain" class) on your cluster
2. Provision PVCs dynamically from each
3. Show WaitForFirstConsumer behaviour
4. Delete PVCs and show reclaim behaviour for each class

## Acceptance criteria

- [ ] PVCs bind only after a consumer pod exists
- [ ] Retain class leaves the PV Released
- [ ] Notes explain when to use each class

<details>
<summary>Hints (try without them first)</summary>

- On kind, the local-path provisioner supports both reclaim policies via separate classes

</details>

## Stretch goal

Add a ResourceQuota limiting storage per namespace and per class (`<class>.storageclass.storage.k8s.io/requests.storage`).

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
