<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A091 · Golden Signals Dashboard

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Observability | 1–2 hours | [Module 23 · Observability: Metrics, Logs, Traces](../02-modules/23-observability.md) |

## Scenario

Leadership wants one screen showing whether the platform is healthy.

## Your tasks

1. Build a Grafana dashboard with golden signals per service, cluster capacity, pending pods, restarts, node health and HPA state
2. Use variables for namespace and service
3. Export it as JSON into Git

## Acceptance criteria

- [ ] Dashboard works for any namespace via variables
- [ ] JSON committed
- [ ] Each panel's query documented

<details>
<summary>Hints (try without them first)</summary>

- kube-state-metrics provides most object-state signals

</details>

## Stretch goal

Provision dashboards as code with the Grafana operator or sidecar ConfigMaps.

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
