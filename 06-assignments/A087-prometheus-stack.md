<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A087 · Prometheus Monitoring Stack

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Observability | 1–2 hours | [Module 23 · Observability: Metrics, Logs, Traces](../02-modules/23-observability.md) |

## Scenario

You need cluster and app monitoring from day one.

## Your tasks

1. Install kube-prometheus-stack
2. Add a ServiceMonitor for your app
3. Build a dashboard with RED metrics and pod resources
4. Configure Alertmanager to send to a webhook

## Acceptance criteria

- [ ] App target is UP
- [ ] Dashboard shows rate, errors, duration, CPU and memory
- [ ] A test alert is delivered

<details>
<summary>Hints (try without them first)</summary>

- The release label must match the Prometheus serviceMonitorSelector unless you disable that

</details>

## Stretch goal

Add long-term storage with Thanos or Mimir.

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
