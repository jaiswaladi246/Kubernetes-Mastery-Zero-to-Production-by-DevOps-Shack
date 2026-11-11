<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A010 · Static Pods

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Pods | 1–2 hours | [Module 02 · Pods](../02-modules/02-pods.md) |

## Scenario

You need a node-local agent that keeps running even if the API server is down, the same way kubeadm runs the control plane.

## Your tasks

1. On a kind node, create a static pod manifest for a small web server
2. Find its mirror pod in the API and try to delete it
3. Edit the manifest to change the image and watch the kubelet restart it
4. Move the manifest out of the directory and observe the result

## Acceptance criteria

- [ ] The mirror pod name includes the node name
- [ ] Deleting the mirror pod doesn't stop the static pod
- [ ] Image changes are picked up from the file
- [ ] Notes explain why kubeadm uses static pods

<details>
<summary>Hints (try without them first)</summary>

- `docker exec -it <kind-node> bash` then write to /etc/kubernetes/manifests
- The kubelet config field is staticPodPath

</details>

## Stretch goal

Break kube-scheduler by introducing a typo into its static manifest, observe the effect on new pods, then fix it.

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
