<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A056 · Gateway API Canary

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Ingress & Gateway API | 1–2 hours | [Module 14 · Ingress & Gateway API](../02-modules/14-ingress-gateway-api.md) |

## Scenario

Release v2 to 10% of users, then 50%, then 100%, with no annotations.

## Your tasks

1. Install a Gateway API implementation
2. Create Gateway and HTTPRoute with weighted backends
3. Shift weights 90/10 → 50/50 → 0/100
4. Add a header match so testers always hit v2

## Acceptance criteria

- [ ] Weight distribution verified with 100 requests
- [ ] Header routing works
- [ ] Route status conditions read and explained

<details>
<summary>Hints (try without them first)</summary>

- Count responses with `sort
- uniq -c`

</details>

## Stretch goal

Automate weight changes with Argo Rollouts' Gateway API plugin.

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
