<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A052 · Event-Driven Scaling with KEDA

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Autoscaling | 2–4 hours | [Module 13 · Autoscaling](../02-modules/13-autoscaling.md) |

## Scenario

An order worker should run zero pods when the queue is empty and up to 50 when it's busy.

## Your tasks

1. Install KEDA and a queue (RabbitMQ or Redis)
2. Create a ScaledObject with minReplicaCount 0
3. Publish 1,000 messages and watch scaling
4. Show scale back to zero

## Acceptance criteria

- [ ] Scales from 0 to N and back to 0
- [ ] Scaling lag measured
- [ ] Notes explain the HPA KEDA creates

<details>
<summary>Hints (try without them first)</summary>

- KEDA's Redis list scaler is the simplest to set up locally

</details>

## Stretch goal

Use a ScaledJob instead and compare semantics.

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
