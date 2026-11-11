<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A051 · VPA Recommendations

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Autoscaling | 1–2 hours | [Module 13 · Autoscaling](../02-modules/13-autoscaling.md) |

## Scenario

Nobody knows the right requests for 30 services. Use data instead of guesses.

## Your tasks

1. Install VPA
2. Create VPA objects in Off mode for three workloads
3. Run load and collect recommendations
4. Compare recommendations with current requests and estimate savings

## Acceptance criteria

- [ ] Recommendations captured (target, lower, upper bounds)
- [ ] Savings estimate in CPU and memory
- [ ] Notes explain why not to combine VPA Auto with CPU HPA

<details>
<summary>Hints (try without them first)</summary>

- `kubectl describe vpa <name>`

</details>

## Stretch goal

Try VPA in Initial mode and explain when it's safe for production.

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
