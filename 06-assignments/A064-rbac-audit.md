<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A064 · RBAC Audit

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | RBAC | 2–4 hours | [Module 16 · RBAC & ServiceAccounts](../02-modules/16-rbac-service-accounts.md) |

## Scenario

Nobody knows who can do what in your cluster anymore.

## Your tasks

1. List every ClusterRoleBinding to cluster-admin
2. Find subjects with wildcard permissions
3. Find who can read Secrets cluster-wide
4. Find who can create pods in kube-system
5. Write remediation recommendations

## Acceptance criteria

- [ ] Each question answered with commands and output
- [ ] Recommendations prioritised by risk

<details>
<summary>Hints (try without them first)</summary>

- kubectl who-can, rbac-tool, rakkess

</details>

## Stretch goal

Schedule the audit as a CronJob that reports changes week over week.

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
