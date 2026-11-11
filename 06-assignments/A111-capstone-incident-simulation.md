<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A111 · Capstone: Incident Simulation

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔴 Expert | Capstones | 1–2 days | [Module 33 · Production Readiness](../02-modules/33-production-readiness.md) |

## Scenario

Practise incident response under pressure.

## Your tasks

1. Ask a friend (or write a chaos script) to inject five random failures into your capstone platform: bad deploy, DNS breakage, node failure, expired cert, NetworkPolicy mistake
2. Respond as on-call: detect, mitigate, fix
3. Keep a timeline
4. Write a postmortem for the worst one

## Acceptance criteria

- [ ] All incidents resolved
- [ ] Time to detect and time to mitigate recorded
- [ ] Postmortem includes root cause and prevention

<details>
<summary>Hints (try without them first)</summary>

- Chaos Mesh or LitmusChaos can automate fault injection

</details>

## Stretch goal

Run the same exercise with a teammate as incident commander and you as responder.

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
