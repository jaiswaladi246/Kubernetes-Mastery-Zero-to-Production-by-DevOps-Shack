<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A014 · Prove Zero-Downtime Deploys

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Deployments | 1–2 hours | [Module 04 · Deployments & ReplicaSets](../02-modules/04-deployments.md) |

## Scenario

The business has a 99.95% availability SLO and claims "deploys cause errors." Prove whether zero-downtime deploys are possible.

## Your tasks

1. Deploy a web app behind a Service with a load generator measuring every request result
2. Run 5 rollouts and record failures with no preStop and no graceful shutdown
3. Add readiness, preStop sleep, SIGTERM handling and correct grace period
4. Run 5 more rollouts and compare

## Acceptance criteria

- [ ] Before/after failure counts recorded
- [ ] Zero failed requests in the final configuration over 5 rollouts
- [ ] Notes explain the endpoint-removal race

<details>
<summary>Hints (try without them first)</summary>

- hey, k6 or a busybox wget loop can generate load
- `terminationGracePeriodSeconds` must exceed preStop plus drain time

</details>

## Stretch goal

Repeat the test through an ingress controller and explain any extra settings needed.

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
