<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A008 · Native Sidecar Log Shipper

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Pods | 1–2 hours | [Module 02 · Pods](../02-modules/02-pods.md) |

## Scenario

Your Jobs never complete because the logging sidecar keeps running after the main container exits.

## Your tasks

1. Reproduce the problem with a Job whose main container exits after 10 seconds and a regular sidecar container that tails a file forever
2. Fix it using a native sidecar
3. Verify the sidecar starts before the main container and is terminated after it
4. Check the Job reaches Complete

## Acceptance criteria

- [ ] The original Job hangs in Running
- [ ] The fixed Job completes
- [ ] Notes show start/stop timestamps proving ordering

<details>
<summary>Hints (try without them first)</summary>

- Native sidecars are declared under initContainers with `restartPolicy: Always`
- Use `kubectl get pod -o jsonpath` on `.status.initContainerStatuses` and `.status.containerStatuses`

</details>

## Stretch goal

Add a preStop hook to the sidecar that flushes a final line and prove it runs.

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
