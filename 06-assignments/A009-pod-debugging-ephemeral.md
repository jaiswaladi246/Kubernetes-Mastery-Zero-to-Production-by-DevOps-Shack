<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A009 · Debugging with Ephemeral Containers

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Pods | 1–2 hours | [Module 02 · Pods](../02-modules/02-pods.md) |

## Scenario

Production uses distroless images with no shell. An engineer needs to inspect a misbehaving pod's filesystem, processes and network without restarting it.

## Your tasks

1. Deploy a distroless app (for example gcr.io/distroless/static or a Go binary image)
2. Attach an ephemeral debug container targeting the app container and list its processes
3. Inspect the app's filesystem through /proc/<pid>/root
4. Capture 20 packets of the app's traffic with tcpdump from the debug container
5. Create a debug copy of the pod with a different image and explain when you'd use it

## Acceptance criteria

- [ ] You never restarted the original pod
- [ ] Process list and filesystem output are in the notes
- [ ] The tcpdump capture is included
- [ ] Notes compare `kubectl debug` targets: ephemeral, copy-to, node

<details>
<summary>Hints (try without them first)</summary>

- `kubectl debug -it pod --image=nicolaka/netshoot --target=<container>`
- Ephemeral containers can't be removed until the pod is deleted

</details>

## Stretch goal

Use `kubectl debug node/<node>` and find the app's container on the node with crictl.

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
