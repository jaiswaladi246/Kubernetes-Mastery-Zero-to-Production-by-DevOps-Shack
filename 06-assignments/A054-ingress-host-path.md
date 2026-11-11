<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A054 · Host and Path Routing

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟢 Beginner | Ingress & Gateway API | 45–60 min | [Module 14 · Ingress & Gateway API](../02-modules/14-ingress-gateway-api.md) |

## Scenario

Expose a frontend and an API on one hostname with clean URLs.

## Your tasks

1. Install an ingress controller
2. Route / to the frontend and /api to the API
3. Add a second host for an admin app
4. Test with curl Host headers
5. Explain pathType Prefix vs Exact with examples

## Acceptance criteria

- [ ] All routes work
- [ ] Unknown hosts return 404
- [ ] pathType behaviour demonstrated

<details>
<summary>Hints (try without them first)</summary>

- `curl -H "Host: shop.local" localhost/api`

</details>

## Stretch goal

Add basic rate limiting using your controller's documented configuration.

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
