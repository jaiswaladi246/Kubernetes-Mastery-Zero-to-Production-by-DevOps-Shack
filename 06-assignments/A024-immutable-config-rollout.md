<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A024 · Immutable Config Rollouts

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Configuration | 1–2 hours | [Module 06 · ConfigMaps & Secrets](../02-modules/06-configmaps-secrets.md) |

## Scenario

A config typo pushed to a shared ConfigMap broke ten services at once. Design safer config rollouts.

## Your tasks

1. Use versioned, immutable ConfigMaps (app-config-v1, v2)
2. Roll a Deployment from v1 to v2 and back
3. Show that edits to an immutable ConfigMap are rejected
4. Compare with configMapGenerator hashes

## Acceptance criteria

- [ ] Immutable flag demonstrated
- [ ] Rollback to old config works with `kubectl rollout undo`
- [ ] Notes explain API server and kubelet load benefits

<details>
<summary>Hints (try without them first)</summary>

- `immutable: true`
- The pod template must reference the new name for a rollout to happen

</details>

## Stretch goal

Write a CI check that fails if a mutable shared ConfigMap is referenced by more than one Deployment.

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
