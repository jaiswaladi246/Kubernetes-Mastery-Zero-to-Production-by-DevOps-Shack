<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A050 · HPA on Custom Metrics

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Autoscaling | 2–4 hours | [Module 13 · Autoscaling](../02-modules/13-autoscaling.md) |

## Scenario

CPU doesn't reflect load for an I/O-bound API. Scale on requests per second instead.

## Your tasks

1. Expose an http_requests_total metric from an app
2. Install Prometheus and Prometheus Adapter
3. Configure the adapter to expose a per-pod RPS metric
4. Create an HPA on that metric and load test

## Acceptance criteria

- [ ] `kubectl get --raw /apis/custom.metrics.k8s.io/v1beta1` lists your metric
- [ ] HPA scales on RPS

<details>
<summary>Hints (try without them first)</summary>

- The adapter rules convert counters to rates with metricsQuery

</details>

## Stretch goal

Do the same with KEDA's Prometheus scaler and compare the setup effort.

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
