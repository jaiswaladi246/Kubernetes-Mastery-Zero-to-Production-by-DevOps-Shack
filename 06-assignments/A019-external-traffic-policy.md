<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A019 · Client IP Preservation

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Services | 1–2 hours | [Module 05 · Services](../02-modules/05-services.md) |

## Scenario

The security team needs the real client IP in your application logs, but you only see node IPs.

## Your tasks

1. Expose an echo server through a LoadBalancer Service with externalTrafficPolicy Cluster and record the source IP
2. Switch to Local and record it again
3. Show which nodes now fail the LB health check
4. Discuss load imbalance and mitigation

## Acceptance criteria

- [ ] Source IP difference demonstrated
- [ ] healthCheckNodePort explained
- [ ] Mitigations listed (spread, more replicas, proxy protocol, X-Forwarded-For)

<details>
<summary>Hints (try without them first)</summary>

- An echo image like `registry.k8s.io/echoserver` or `ealen/echo-server` prints the client IP

</details>

## Stretch goal

Achieve client IP preservation through an ingress controller using X-Forwarded-For or PROXY protocol.

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
