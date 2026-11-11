<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A049 · HPA on CPU

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟢 Beginner | Autoscaling | 45–60 min | [Module 13 · Autoscaling](../02-modules/13-autoscaling.md) |

## Scenario

Traffic doubles every weekday at 9 a.m. Make the API scale automatically.

## Your tasks

1. Install metrics-server
2. Deploy a CPU-bound app with requests and an HPA targeting 60%
3. Load test and record replica changes over time
4. Tune scale-down behaviour to avoid flapping

## Acceptance criteria

- [ ] HPA scales out under load and in after load
- [ ] A graph or table of replicas over time
- [ ] Behaviour settings justified

<details>
<summary>Hints (try without them first)</summary>

- registry.k8s.io/hpa-example is a CPU-bound demo image

</details>

## Stretch goal

Add a memory metric and explain how multiple metrics combine.

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
