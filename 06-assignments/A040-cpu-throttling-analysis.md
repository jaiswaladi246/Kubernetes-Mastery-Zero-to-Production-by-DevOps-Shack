<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A040 · CPU Throttling Analysis

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Resource Management | 2–4 hours | [Module 10 · Resource Management: Requests, Limits, Quotas](../02-modules/10-resource-management.md) |

## Scenario

An API's p99 latency is terrible but CPU graphs look fine.

## Your tasks

1. Deploy a multi-threaded CPU-heavy service with a 500m CPU limit
2. Load test and record p99 latency and throttling ratio
3. Remove the CPU limit (keep requests) and repeat
4. Write a recommendation for your org's CPU limit policy

## Acceptance criteria

- [ ] Throttling metrics captured from cgroup or Prometheus
- [ ] Latency comparison table
- [ ] Policy recommendation is balanced (fairness vs latency)

<details>
<summary>Hints (try without them first)</summary>

- `cat /sys/fs/cgroup/cpu.stat` inside the container

</details>

## Stretch goal

Test the effect of GOMAXPROCS or JVM ActiveProcessorCount on throttling.

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
