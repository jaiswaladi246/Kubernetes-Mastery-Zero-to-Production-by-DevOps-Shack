<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A088 · SLOs and Burn-Rate Alerts

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Observability | 2–4 hours | [Module 23 · Observability: Metrics, Logs, Traces](../02-modules/23-observability.md) |

## Scenario

Alerts page people for things users never notice. Switch to SLO-based alerting.

## Your tasks

1. Define an availability SLO (99.9%) and a latency SLO for one service
2. Write recording rules for SLIs
3. Write multi-window burn-rate alerts
4. Simulate an error burst and show which alert fires

## Acceptance criteria

- [ ] SLI recording rules correct
- [ ] Fast and slow burn alerts fire appropriately
- [ ] Error budget dashboard built

<details>
<summary>Hints (try without them first)</summary>

- Sloth or Pyrra can generate rules from an SLO spec

</details>

## Stretch goal

Tie deployment freezes to error budget exhaustion in your process doc.

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
