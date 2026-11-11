<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A036 · Requests, Limits & QoS

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟢 Beginner | Resource Management | 45–60 min | [Module 10 · Resource Management: Requests, Limits, Quotas](../02-modules/10-resource-management.md) |

## Scenario

Your cluster is half empty but the scheduler says it's full.

## Your tasks

1. Deploy workloads with deliberately high requests
2. Show the gap between requested and used resources per node
3. Create Guaranteed, Burstable and BestEffort pods and record their QoS
4. Right-size requests based on measured usage

## Acceptance criteria

- [ ] Before/after allocation vs usage table
- [ ] QoS classes demonstrated
- [ ] Cluster capacity regained

<details>
<summary>Hints (try without them first)</summary>

- `kubectl describe node
- grep -A8 Allocated` vs `kubectl top nodes`

</details>

## Stretch goal

Install kube-capacity or resource-capacity plugin and include its output.

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
