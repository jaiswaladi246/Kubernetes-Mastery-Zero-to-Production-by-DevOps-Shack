<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A058 · Default Deny

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Network Policies | 1–2 hours | [Module 15 · Network Policies](../02-modules/15-network-policies.md) |

## Scenario

Security wants zero-trust networking in the `payments` namespace.

## Your tasks

1. Apply default-deny ingress and egress
2. Allow DNS
3. Allow only required flows for a 3-service app
4. Prove each allowed and denied path with a connectivity matrix

## Acceptance criteria

- [ ] Matrix shows expected results
- [ ] DNS works
- [ ] Unrequired flows blocked

<details>
<summary>Hints (try without them first)</summary>

- Test from pods carrying the right labels with `kubectl run -l`

</details>

## Stretch goal

Automate the matrix test as a CI job against a kind cluster.

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
