<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A094 · Automated Canary Analysis

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Deployment Strategies | 2–4 hours | [Module 24 · Deployment Strategies](../02-modules/24-deployment-strategies.md) |

## Scenario

Humans shouldn't have to watch graphs during every canary.

## Your tasks

1. Add an AnalysisTemplate querying Prometheus for success rate
2. Make the canary promote automatically when healthy
3. Inject errors into the canary and show automatic abort
4. Document analysis thresholds

## Acceptance criteria

- [ ] Healthy canary promotes without humans
- [ ] Faulty canary aborts automatically
- [ ] Thresholds justified

<details>
<summary>Hints (try without them first)</summary>

- Use a version label in metrics to separate canary from stable

</details>

## Stretch goal

Add a latency analysis and require both to pass.

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
