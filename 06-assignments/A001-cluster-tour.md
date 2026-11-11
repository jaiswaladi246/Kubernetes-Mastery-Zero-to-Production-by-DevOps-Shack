<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A001 · Cluster Tour

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟢 Beginner | Foundations | 45–60 min | [Module 01 · Foundations & Your First Cluster](../02-modules/01-foundations-and-setup.md) |

## Scenario

You've joined a platform team and been handed access to a cluster you've never seen. Before you touch anything, your lead wants a written tour of what's running.

## Your tasks

1. List every node with its roles, Kubernetes version, OS image, container runtime and internal IP using a single `kubectl get` with custom columns
2. Identify every control plane component and say whether it runs as a static pod, a Deployment or a DaemonSet
3. List all namespaces and, for each, the number of pods and the top-level controllers in it
4. Find which CNI, which DNS server and which StorageClass (and whether it is the default) the cluster uses
5. Write CLUSTER-TOUR.md summarising your findings with one Mermaid diagram of the cluster

## Acceptance criteria

- [ ] All information was gathered with kubectl only (commands included in the notes)
- [ ] Static pods vs controller-managed pods are correctly identified
- [ ] The default StorageClass is named
- [ ] The diagram shows control plane, nodes and add-ons

<details>
<summary>Hints (try without them first)</summary>

- `kubectl get nodes -o custom-columns=...` with `.status.nodeInfo` fields
- Static pods carry the node name as a suffix and have an ownerReference of kind Node
- `kubectl get pods -A -o custom-columns=NS:.metadata.namespace,OWNER:.metadata.ownerReferences[0].kind`

</details>

## Stretch goal

Script the whole tour in bash so it can run against any cluster and produce the markdown automatically.

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
