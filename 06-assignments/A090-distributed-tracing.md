<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A090 · Distributed Tracing

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Observability | 2–4 hours | [Module 23 · Observability: Metrics, Logs, Traces](../02-modules/23-observability.md) |

## Scenario

A checkout request is slow and nobody knows which of eight services causes it.

## Your tasks

1. Deploy a small multi-service demo (e.g. OpenTelemetry Demo)
2. Install the OpenTelemetry Collector and Tempo or Jaeger
3. View traces end to end
4. Find the slowest span and correlate with logs

## Acceptance criteria

- [ ] Traces span multiple services
- [ ] Slow span identified
- [ ] Trace-to-log correlation shown

<details>
<summary>Hints (try without them first)</summary>

- The OpenTelemetry Demo includes instrumentation out of the box

</details>

## Stretch goal

Use the OTel Operator for auto-instrumentation of a service you wrote.

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
