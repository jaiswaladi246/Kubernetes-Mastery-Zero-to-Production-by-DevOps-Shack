<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A013 · Recreate vs RollingUpdate

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟢 Beginner | Deployments | 45–60 min | [Module 04 · Deployments & ReplicaSets](../02-modules/04-deployments.md) |

## Scenario

Your app has a database migration that can't run with two versions live at once. Decide between Recreate and RollingUpdate.

## Your tasks

1. Deploy the app with RollingUpdate and show both versions serving at the same time
2. Switch to Recreate and show the downtime window
3. Measure downtime precisely with a request loop
4. Document when each strategy is appropriate

## Acceptance criteria

- [ ] Evidence of mixed versions during rolling update
- [ ] Measured Recreate downtime in seconds
- [ ] Clear guidance on choosing strategies

<details>
<summary>Hints (try without them first)</summary>

- Make each version return its version string so the request loop shows which one answered

</details>

## Stretch goal

Achieve the migration safely with RollingUpdate using an expand-and-contract schema change plan.

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
