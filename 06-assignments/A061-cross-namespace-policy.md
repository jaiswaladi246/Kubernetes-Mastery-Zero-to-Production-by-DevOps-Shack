<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A061 · Cross-Namespace Access

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Network Policies | 1–2 hours | [Module 15 · Network Policies](../02-modules/15-network-policies.md) |

## Scenario

Several namespaces need to call a shared `auth` service, but nothing else should.

## Your tasks

1. Label consumer namespaces
2. Write an ingress policy on auth allowing only those namespaces and specific pod labels
3. Test from allowed and disallowed namespaces
4. Show the AND vs OR mistake and its consequence

## Acceptance criteria

- [ ] Only intended callers reach auth
- [ ] AND/OR difference demonstrated

<details>
<summary>Hints (try without them first)</summary>

- One `from` item with both selectors = AND

</details>

## Stretch goal

Implement the same intent with an AdminNetworkPolicy or a Calico GlobalNetworkPolicy.

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
