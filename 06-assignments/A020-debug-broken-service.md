<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A020 · Fix Five Broken Services

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Services | 1–2 hours | [Module 05 · Services](../02-modules/05-services.md) |

## Scenario

Five Services in the `broken` namespace don't work. Each has a different bug. Fix them all.

## Your tasks

1. Create the five broken setups yourself from this list (have a friend shuffle them if possible): selector typo, wrong targetPort, app bound to 127.0.0.1, readiness probe failing, NetworkPolicy blocking
2. For each, document the symptom, the commands you used and the fix
3. Time yourself

## Acceptance criteria

- [ ] All five fixed
- [ ] Each diagnosis starts from `endpointslices` and works down
- [ ] Total time under 30 minutes

<details>
<summary>Hints (try without them first)</summary>

- Refused vs timeout is a strong clue: refused usually means port/listen issues, timeout usually means policy or routing

</details>

## Stretch goal

Turn your five scenarios into a script that randomly breaks one Service for team training.

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
