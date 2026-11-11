<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A075 · Helm Chart from Scratch

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Helm | 1–2 hours | [Module 19 · Helm](../02-modules/19-helm.md) |

## Scenario

Package your team's microservice as a reusable Helm chart.

## Your tasks

1. Create a chart with Deployment, Service, Ingress, HPA, PDB, ServiceAccount and ConfigMap
2. Make every important setting configurable with sane defaults
3. Add values.schema.json
4. Add NOTES.txt and a helm test

## Acceptance criteria

- [ ] `helm lint --strict` passes
- [ ] Schema rejects invalid values
- [ ] Install works with defaults
- [ ] Test passes

<details>
<summary>Hints (try without them first)</summary>

- Start from `helm create` and delete what you don't need

</details>

## Stretch goal

Publish the chart to an OCI registry (GHCR) with a version tag.

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
