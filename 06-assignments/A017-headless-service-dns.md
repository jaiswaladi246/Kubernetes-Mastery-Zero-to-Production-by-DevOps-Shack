<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A017 · Headless Services & DNS

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Services | 1–2 hours | [Module 05 · Services](../02-modules/05-services.md) |

## Scenario

A clustered app needs every member to discover every other member by DNS.

## Your tasks

1. Deploy a 3-replica StatefulSet with a headless Service
2. Show the A records for the Service and SRV records for its named port
3. Show per-pod DNS names
4. Scale to 5 and show DNS updates
5. Explain publishNotReadyAddresses and when you'd need it

## Acceptance criteria

- [ ] dig output for all record types
- [ ] Per-pod names resolve to the right IPs
- [ ] Explanation of publishNotReadyAddresses is correct

<details>
<summary>Hints (try without them first)</summary>

- `dig SRV _peer._tcp.<svc>.<ns>.svc.cluster.local`

</details>

## Stretch goal

Configure a small etcd or Redis cluster that uses those DNS names for peer discovery.

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
