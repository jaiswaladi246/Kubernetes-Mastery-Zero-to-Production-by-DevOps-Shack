<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A093 · Canary with Argo Rollouts

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Deployment Strategies | 2–4 hours | [Module 24 · Deployment Strategies](../02-modules/24-deployment-strategies.md) |

## Scenario

Release with real traffic gradually and abort automatically on errors.

## Your tasks

1. Install Argo Rollouts
2. Convert a Deployment to a Rollout with canary steps
3. Route traffic with replica counts or a traffic router
4. Abort a bad release manually and observe rollback

## Acceptance criteria

- [ ] Canary steps progress as configured
- [ ] Abort returns all traffic to stable
- [ ] Dashboard or CLI output captured

<details>
<summary>Hints (try without them first)</summary>

- `kubectl argo rollouts get rollout <name> --watch`

</details>

## Stretch goal

Use Gateway API traffic routing with the Argo Rollouts plugin.

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
