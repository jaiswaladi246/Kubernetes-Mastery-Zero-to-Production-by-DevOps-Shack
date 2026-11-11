<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A057 · Migrate Ingress to Gateway API

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Ingress & Gateway API | 2–4 hours | [Module 14 · Ingress & Gateway API](../02-modules/14-ingress-gateway-api.md) |

## Scenario

Your company is moving off an Ingress controller and needs a migration plan.

## Your tasks

1. Inventory 5 sample Ingresses using annotations (rewrites, redirects, timeouts)
2. Convert them to Gateway API resources (try ingress2gateway)
3. Run both side by side
4. Write a cutover and rollback plan

## Acceptance criteria

- [ ] Equivalent behaviour verified for each route
- [ ] Cutover plan includes DNS/TTL and rollback
- [ ] Unsupported annotations identified

<details>
<summary>Hints (try without them first)</summary>

- Some annotations map to HTTPRoute filters, others to implementation-specific policies

</details>

## Stretch goal

Present the migration as a one-page decision record (ADR).

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
