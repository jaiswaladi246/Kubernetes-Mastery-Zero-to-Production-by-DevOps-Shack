<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A069 · CEL Admission Policies

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Security | 2–4 hours | [Module 17 · Pod Security & Cluster Hardening](../02-modules/17-pod-security-hardening.md) |

## Scenario

You want guardrails without running a webhook.

## Your tasks

1. Write ValidatingAdmissionPolicies that require a team label, forbid hostPath, cap replicas at 50 in non-prod, and require resource requests
2. Use parameters (paramKind) for per-namespace limits
3. Test with passing and failing manifests
4. Use Warn and Audit actions before Deny

## Acceptance criteria

- [ ] Each policy blocks the bad case and allows the good case
- [ ] Parameterised policy works
- [ ] Rollout plan from Audit to Deny documented

<details>
<summary>Hints (try without them first)</summary>

- CEL: `object.spec.template.spec.containers.all(c, has(c.resources.requests))`

</details>

## Stretch goal

Write a MutatingAdmissionPolicy (if available in your version) to add default labels.

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
