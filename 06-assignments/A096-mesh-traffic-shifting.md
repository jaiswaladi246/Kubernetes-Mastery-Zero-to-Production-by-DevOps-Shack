<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A096 · Mesh Traffic Shifting & Resilience

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Service Mesh | 2–4 hours | [Module 25 · Service Mesh](../02-modules/25-service-mesh.md) |

## Scenario

Make a flaky downstream service less harmful.

## Your tasks

1. Inject faults (delays, 503s) with the mesh
2. Add timeouts, retries with budgets and outlier detection
3. Shift 20% traffic to v2
4. Measure the user-facing impact before and after

## Acceptance criteria

- [ ] Resilience settings reduce error rate
- [ ] Traffic split verified
- [ ] Retry storm risk discussed

<details>
<summary>Hints (try without them first)</summary>

- Retries multiply load; always pair them with timeouts and budgets

</details>

## Stretch goal

Use Gateway API (GAMMA) HTTPRoutes for the east-west traffic split.

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
