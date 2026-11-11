<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A006 · Multi-Container Pod

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟢 Beginner | Pods | 45–60 min | [Module 02 · Pods](../02-modules/02-pods.md) |

## Scenario

A legacy app writes logs to a file instead of stdout, and the logging team only collects stdout. You can't change the app.

## Your tasks

1. Run the app container writing to /var/log/app/app.log every second
2. Add a sidecar that streams that file to its own stdout
3. Add an init container that writes a config file the app reads at startup
4. Show that both containers share the network namespace by curling the app from the sidecar on localhost

## Acceptance criteria

- [ ] `kubectl logs <pod> -c <sidecar>` shows the app's log lines
- [ ] The app reads the init-generated config
- [ ] Containers start in the documented order
- [ ] Notes explain which volume type you used and why

<details>
<summary>Hints (try without them first)</summary>

- An emptyDir mounted in both containers
- `tail -F` survives log rotation, `tail -f` doesn't

</details>

## Stretch goal

Convert the sidecar into a native sidecar (init container with restartPolicy Always) and explain what changes on shutdown.

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
