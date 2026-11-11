<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A068 · Image Scanning Gate

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Security | 1–2 hours | [Module 17 · Pod Security & Cluster Hardening](../02-modules/17-pod-security-hardening.md) |

## Scenario

Stop vulnerable images reaching the cluster.

## Your tasks

1. Build an image with a known vulnerable base
2. Scan it with Trivy in a CI pipeline and fail on CRITICAL
3. Fix by updating the base or switching to distroless
4. Generate an SBOM

## Acceptance criteria

- [ ] Pipeline fails on the vulnerable image and passes after the fix
- [ ] SBOM produced
- [ ] Notes explain ignore-unfixed and its risk

<details>
<summary>Hints (try without them first)</summary>

- `trivy image --severity CRITICAL --exit-code 1 <img>`

</details>

## Stretch goal

Run Trivy Operator in-cluster to continuously scan running workloads.

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
