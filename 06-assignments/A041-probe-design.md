<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A041 · Design Probes for Three Apps

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Health & Lifecycle | 1–2 hours | [Module 11 · Health Probes & Lifecycle Hooks](../02-modules/11-health-probes-lifecycle.md) |

## Scenario

Three apps need probes: a Spring Boot API that takes 90 s to start, a Node.js worker with no HTTP server, and nginx serving static files.

## Your tasks

1. Design startup, readiness and liveness probes for each
2. Justify every threshold
3. Deploy and test each probe's failure behaviour
4. Document what each probe must never check

## Acceptance criteria

- [ ] Slow app never gets killed during startup
- [ ] Worker uses an exec or file-based probe
- [ ] Probe failures behave as designed
- [ ] Anti-patterns listed

<details>
<summary>Hints (try without them first)</summary>

- Spring Boot Actuator exposes liveness and readiness groups
- A worker can touch a heartbeat file the probe checks for freshness

</details>

## Stretch goal

Add gRPC probes to a gRPC service using the built-in grpc probe type.

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
