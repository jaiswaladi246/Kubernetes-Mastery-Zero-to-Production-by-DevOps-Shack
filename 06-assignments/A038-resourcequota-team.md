<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A038 · ResourceQuota for a Team

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Resource Management | 1–2 hours | [Module 10 · Resource Management: Requests, Limits, Quotas](../02-modules/10-resource-management.md) |

## Scenario

Team A keeps consuming the whole shared cluster. Give them a budget.

## Your tasks

1. Create a ResourceQuota for CPU, memory, pods, Services of type LoadBalancer and storage
2. Hit each limit and capture the error
3. Show quota usage
4. Create a quota scoped to a PriorityClass

## Acceptance criteria

- [ ] Each limit triggers the expected rejection
- [ ] `kubectl describe quota` shows usage
- [ ] Scoped quota demonstrated

<details>
<summary>Hints (try without them first)</summary>

- Quota errors appear on the ReplicaSet events, not the Deployment

</details>

## Stretch goal

Build a small dashboard (PromQL) showing quota usage per namespace.

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
