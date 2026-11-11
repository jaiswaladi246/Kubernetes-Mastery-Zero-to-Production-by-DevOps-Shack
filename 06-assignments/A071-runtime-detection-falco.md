<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A071 · Runtime Detection with Falco

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Security | 2–4 hours | [Module 17 · Pod Security & Cluster Hardening](../02-modules/17-pod-security-hardening.md) |

## Scenario

You need to know when someone opens a shell in a production container.

## Your tasks

1. Install Falco
2. Trigger the "Terminal shell in container" rule
3. Write a custom rule for writes under /etc in your app namespace
4. Send alerts to a webhook or Slack via Falcosidekick

## Acceptance criteria

- [ ] Default and custom rules fire
- [ ] Alert delivered
- [ ] False-positive tuning documented

<details>
<summary>Hints (try without them first)</summary>

- Falco's default ruleset includes shell and sensitive file rules

</details>

## Stretch goal

Use Tetragon to enforce (kill) instead of just detect.

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
