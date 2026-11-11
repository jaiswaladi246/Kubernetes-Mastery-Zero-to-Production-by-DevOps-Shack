<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A011 · Rolling Update Tuning

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟢 Beginner | Deployments | 45–60 min | [Module 04 · Deployments & ReplicaSets](../02-modules/04-deployments.md) |

## Scenario

Releases of your checkout service take 25 minutes because of default rollout settings, but the team is scared to speed them up.

## Your tasks

1. Deploy a 10-replica Deployment with readiness probes and minReadySeconds 15
2. Measure rollout time with the defaults
3. Measure with maxSurge 100%/maxUnavailable 0 and with maxSurge 0/maxUnavailable 2
4. Record time, peak pod count and minimum ready pods for each

## Acceptance criteria

- [ ] A results table with three configurations
- [ ] You never dropped below the desired ready count in the configuration you recommend
- [ ] Recommendation is justified by capacity and risk

<details>
<summary>Hints (try without them first)</summary>

- Use `kubectl rollout status` with `time`
- `kubectl get deploy -w` shows available counts during the rollout

</details>

## Stretch goal

Add a progressDeadlineSeconds and make a bad rollout fail fast in a CI script that runs `kubectl rollout status --timeout`.

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
