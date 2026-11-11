<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A095 · Service Mesh mTLS

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Service Mesh | 2–4 hours | [Module 25 · Service Mesh](../02-modules/25-service-mesh.md) |

## Scenario

Compliance requires encrypted, authenticated service-to-service traffic.

## Your tasks

1. Install Istio (ambient or sidecar) or Linkerd
2. Enable mesh-wide mTLS in strict mode
3. Prove traffic is encrypted
4. Write an authorization policy allowing only web to call api
5. Show a denied request

## Acceptance criteria

- [ ] mTLS enforced
- [ ] Authorization policy works
- [ ] Overhead measured roughly (latency, CPU)

<details>
<summary>Hints (try without them first)</summary>

- istioctl x describe or linkerd viz edges show mTLS status

</details>

## Stretch goal

Rotate the mesh root CA without downtime.

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
