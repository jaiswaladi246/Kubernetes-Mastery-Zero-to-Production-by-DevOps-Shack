<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A089 · Centralized Logging

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Observability | 1–2 hours | [Module 23 · Observability: Metrics, Logs, Traces](../02-modules/23-observability.md) |

## Scenario

Pods vanish and their logs go with them.

## Your tasks

1. Deploy Loki (or OpenSearch) and Fluent Bit (or Vector)
2. Ship logs with Kubernetes metadata
3. Query logs by namespace, pod and label
4. Parse JSON logs into fields

## Acceptance criteria

- [ ] Logs from deleted pods remain queryable
- [ ] Queries by labels work
- [ ] JSON fields extracted

<details>
<summary>Hints (try without them first)</summary>

- Grafana Explore works with Loki for LogQL

</details>

## Stretch goal

Add log-based alerts for error spikes.

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
