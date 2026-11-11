<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A003 · Imperative to Declarative

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟢 Beginner | Foundations | 45–60 min | [Module 01 · Foundations & Your First Cluster](../02-modules/01-foundations-and-setup.md) |

## Scenario

A teammate built a demo app entirely with imperative commands. It needs to move into Git so it can be reviewed and redeployed anywhere.

## Your tasks

1. Imperatively create a namespace, a Deployment (3 replicas, nginx:1.27), a ClusterIP Service, a ConfigMap and a NodePort Service
2. Export each object to clean YAML without status, managedFields, uid, resourceVersion or creationTimestamp
3. Organise the YAML into a folder structure and apply it to a fresh namespace
4. Prove the result is equivalent with `kubectl diff`

## Acceptance criteria

- [ ] Exported YAML contains no server-populated fields
- [ ] A fresh namespace created only from your files works identically
- [ ] `kubectl diff` shows no differences after apply

<details>
<summary>Hints (try without them first)</summary>

- `kubectl get deploy x -o yaml` then strip fields manually or with `kubectl neat`
- Generating with `--dry-run=client -o yaml` from the start avoids the cleanup

</details>

## Stretch goal

Convert the folder into a Kustomize base with a dev overlay.

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
