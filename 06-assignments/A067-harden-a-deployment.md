<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A067 · Harden a Deployment

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Security | 1–2 hours | [Module 17 · Pod Security & Cluster Hardening](../02-modules/17-pod-security-hardening.md) |

## Scenario

Harden one Deployment as if it were going to a bank's production cluster.

## Your tasks

1. Run as non-root with a fixed UID, read-only root filesystem, drop all capabilities, seccomp RuntimeDefault
2. Disable SA token automount
3. Pin image by digest
4. Add a NetworkPolicy and PDB
5. Scan with kube-linter or Kubescape before and after

## Acceptance criteria

- [ ] Scanner findings reduced to zero or justified
- [ ] App still works
- [ ] Each setting's purpose explained

<details>
<summary>Hints (try without them first)</summary>

- Writable paths need emptyDir mounts

</details>

## Stretch goal

Run it under gVisor with a RuntimeClass and measure overhead.

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
