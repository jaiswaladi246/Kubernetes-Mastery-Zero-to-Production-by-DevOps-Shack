<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A066 · Enforce Restricted Pod Security

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Security | 1–2 hours | [Module 17 · Pod Security & Cluster Hardening](../02-modules/17-pod-security-hardening.md) |

## Scenario

Move a namespace of real-world charts to the restricted Pod Security Standard without breaking anything.

## Your tasks

1. Install three popular charts (e.g. Redis, a web app, an ingress controller) into a namespace
2. Run a server-side dry-run of enforce=restricted and capture violations
3. Fix each workload's securityContext
4. Enforce restricted and confirm everything runs

## Acceptance criteria

- [ ] Violations listed before
- [ ] All workloads compliant after
- [ ] Any justified exceptions documented in a separate namespace

<details>
<summary>Hints (try without them first)</summary>

- `kubectl label --dry-run=server --overwrite ns x pod-security.kubernetes.io/enforce=restricted`

</details>

## Stretch goal

Add audit and warn labels at the cluster level via AdmissionConfiguration defaults.

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
