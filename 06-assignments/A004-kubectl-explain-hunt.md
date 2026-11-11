<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A004 · The kubectl explain Hunt

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟢 Beginner | Foundations | 45–60 min | [Module 01 · Foundations & Your First Cluster](../02-modules/01-foundations-and-setup.md) |

## Scenario

You'll be taking the CKAD and want to stop depending on Google for field names.

## Your tasks

1. Using only `kubectl explain`, find the exact field paths for: pod-level sysctls, a container's startup probe gRPC port, the Deployment field controlling how many old ReplicaSets are kept, the Job field that cleans up finished Jobs, and the PVC field for cloning from a snapshot
2. For each, write a minimal working YAML snippet using it
3. Apply each snippet and prove it was accepted

## Acceptance criteria

- [ ] Five field paths documented with the `kubectl explain` command used
- [ ] Five snippets apply without errors
- [ ] You can explain the difference between `kubectl explain pod.spec` and `--recursive`

<details>
<summary>Hints (try without them first)</summary>

- `kubectl explain deployment.spec --recursive
- grep -i history`
- `kubectl explain pvc.spec.dataSource`

</details>

## Stretch goal

Time yourself: generate each snippet from scratch in under 90 seconds.

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
