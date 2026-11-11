<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A037 · LimitRange Defaults

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Resource Management | 1–2 hours | [Module 10 · Resource Management: Requests, Limits, Quotas](../02-modules/10-resource-management.md) |

## Scenario

Developers forget resources entirely, so pods land as BestEffort and get evicted first.

## Your tasks

1. Create a LimitRange with default requests/limits and min/max
2. Deploy pods with no resources and show injected defaults
3. Show a pod exceeding max being rejected
4. Add a PVC size limit

## Acceptance criteria

- [ ] Defaults injected
- [ ] Max enforced with clear error
- [ ] Notes explain that LimitRange applies at admission only

<details>
<summary>Hints (try without them first)</summary>

- LimitRange doesn't change existing pods

</details>

## Stretch goal

Combine with a Kyverno policy that requires explicit requests in prod namespaces.

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
