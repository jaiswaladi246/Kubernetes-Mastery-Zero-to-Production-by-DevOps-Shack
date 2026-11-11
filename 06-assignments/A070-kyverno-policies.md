<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A070 · Policy-as-Code with Kyverno

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Security | 2–4 hours | [Module 17 · Pod Security & Cluster Hardening](../02-modules/17-pod-security-hardening.md) |

## Scenario

Your org wants policy-as-code with reporting.

## Your tasks

1. Install Kyverno
2. Write policies to disallow latest tags, require probes, add a default NetworkPolicy to new namespaces (generate) and verify image signatures
3. Run in Audit, review PolicyReports, then Enforce
4. Test policies in CI with the Kyverno CLI

## Acceptance criteria

- [ ] Four policies working
- [ ] PolicyReports reviewed
- [ ] CLI tests pass in CI

<details>
<summary>Hints (try without them first)</summary>

- `kyverno apply policy.yaml --resource deploy.yaml`

</details>

## Stretch goal

Compare the same policies written for OPA Gatekeeper.

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
