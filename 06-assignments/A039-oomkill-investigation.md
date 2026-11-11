<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A039 · OOMKill Investigation

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Resource Management | 1–2 hours | [Module 10 · Resource Management: Requests, Limits, Quotas](../02-modules/10-resource-management.md) |

## Scenario

A Java service is OOMKilled every few hours in production.

## Your tasks

1. Reproduce an OOMKill with a JVM app whose heap is larger than the container limit
2. Show the exit code and events
3. Fix it with container-aware JVM flags
4. Distinguish container OOM from node OOM and eviction

## Acceptance criteria

- [ ] OOMKilled reproduced and fixed
- [ ] Working set graph or `kubectl top` evidence
- [ ] Clear explanation of the three memory failure types

<details>
<summary>Hints (try without them first)</summary>

- `-XX:MaxRAMPercentage=75`
- `container_memory_working_set_bytes` is what the OOM killer and eviction care about

</details>

## Stretch goal

Capture a heap dump on OOM with `-XX:+HeapDumpOnOutOfMemoryError` to a volume and copy it out.

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
