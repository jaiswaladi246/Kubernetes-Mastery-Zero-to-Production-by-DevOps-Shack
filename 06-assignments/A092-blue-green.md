<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A092 · Blue-Green Deployment

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Deployment Strategies | 1–2 hours | [Module 24 · Deployment Strategies](../02-modules/24-deployment-strategies.md) |

## Scenario

The business wants instant rollback for a risky release.

## Your tasks

1. Run blue and green Deployments
2. Expose a preview Service for green
3. Switch the main Service selector to green
4. Roll back by switching back
5. Measure switch time and errors

## Acceptance criteria

- [ ] Switch causes no errors
- [ ] Rollback is instant
- [ ] Resource cost of blue-green discussed

<details>
<summary>Hints (try without them first)</summary>

- Patch only the Service selector

</details>

## Stretch goal

Implement the same with Argo Rollouts' blueGreen strategy and auto-promotion.

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
