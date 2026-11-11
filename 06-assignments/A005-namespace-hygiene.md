<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A005 · Namespace Hygiene

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟢 Beginner | Foundations | 45–60 min | [Module 01 · Foundations & Your First Cluster](../02-modules/01-foundations-and-setup.md) |

## Scenario

Your company's shared cluster has 40 namespaces with no labels, no quotas and no owners. You've been asked to define and apply a namespace standard.

## Your tasks

1. Write a namespace standard: naming convention, required labels (team, env, cost-center), Pod Security labels, quota and LimitRange defaults
2. Create three team namespaces that follow it
3. Write a script that reports every namespace missing a required label
4. Add a ValidatingAdmissionPolicy that rejects new namespaces without the team label

## Acceptance criteria

- [ ] The standard is documented in NAMESPACES.md
- [ ] The audit script output lists non-compliant namespaces
- [ ] Creating a namespace without `team` is rejected with a clear message
- [ ] System namespaces are excluded from the policy

<details>
<summary>Hints (try without them first)</summary>

- Use `kubectl get ns -o json
- jq` for the audit
- Exclude kube-* namespaces with a matchCondition or namespace name check in CEL

</details>

## Stretch goal

Use Kyverno `generate` rules to automatically create the quota, LimitRange and default-deny NetworkPolicy in every new compliant namespace.

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
