<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A062 · Least-Privilege Developer Role

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟢 Beginner | RBAC | 45–60 min | [Module 16 · RBAC & ServiceAccounts](../02-modules/16-rbac-service-accounts.md) |

## Scenario

Developers need to debug their apps in production without being able to change them.

## Your tasks

1. Create a role allowing read access, logs, exec and port-forward in one namespace but no Secrets and no writes
2. Bind it to a group
3. Test with impersonation
4. Document why exec is still powerful

## Acceptance criteria

- [ ] All allowed and denied actions verified with `kubectl auth can-i`
- [ ] Secrets unreadable
- [ ] Exec risk explained

<details>
<summary>Hints (try without them first)</summary>

- pods/exec and pods/portforward are subresources needing the create verb

</details>

## Stretch goal

Make exec access time-bound using a temporary RoleBinding created by a script with an expiry annotation and cleanup CronJob.

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
