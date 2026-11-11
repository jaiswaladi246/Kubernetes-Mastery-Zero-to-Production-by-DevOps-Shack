<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A077 · Helm Upgrade & Rollback

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟢 Beginner | Helm | 45–60 min | [Module 19 · Helm](../02-modules/19-helm.md) |

## Scenario

Practise safe upgrades and fast rollbacks with Helm.

## Your tasks

1. Install a release, then perform three upgrades
2. Make one fail and use --atomic
3. Roll back manually to a specific revision
4. Recover from a release stuck in pending-upgrade

## Acceptance criteria

- [ ] History shows all revisions
- [ ] Atomic rollback demonstrated
- [ ] Stuck release recovered

<details>
<summary>Hints (try without them first)</summary>

- Interrupting an upgrade with Ctrl+C can leave pending-upgrade status

</details>

## Stretch goal

Use helm-diff to preview every upgrade.

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
