<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A032 · Node Agent DaemonSet

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟢 Beginner | DaemonSets & Jobs | 45–60 min | [Module 09 · DaemonSets, Jobs & CronJobs](../02-modules/09-daemonsets-jobs-cronjobs.md) |

## Scenario

Every node needs a metrics agent, including tainted GPU and control plane nodes.

## Your tasks

1. Deploy node-exporter as a DaemonSet with hostNetwork, hostPID and a read-only host root mount
2. Make it tolerate all taints
3. Use a rolling update with maxUnavailable 1
4. Restrict it to Linux nodes

## Acceptance criteria

- [ ] One pod per node including tainted ones
- [ ] `curl <node-ip>:9100/metrics` works
- [ ] Update rolls one node at a time

<details>
<summary>Hints (try without them first)</summary>

- A toleration with only `operator: Exists` tolerates every taint

</details>

## Stretch goal

Scrape it with Prometheus and graph per-node CPU.

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
