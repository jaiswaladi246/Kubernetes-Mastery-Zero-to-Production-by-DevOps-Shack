<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A045 · Zone Spreading

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Scheduling | 1–2 hours | [Module 12 · Advanced Scheduling](../02-modules/12-scheduling.md) |

## Scenario

Your region has three zones. The app must survive losing any one of them.

## Your tasks

1. Label nodes with three zones
2. Deploy 6 replicas with zone topology spread (DoNotSchedule)
3. Cordon and drain a zone's nodes and observe placement
4. Explain minDomains and maxSkew

## Acceptance criteria

- [ ] Replicas spread 2/2/2
- [ ] Draining a zone keeps the app serving
- [ ] Notes explain the capacity needed to absorb a lost zone

<details>
<summary>Hints (try without them first)</summary>

- kind node labels can be set in the cluster config

</details>

## Stretch goal

Combine zone and hostname spread constraints and explain the interaction.

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
