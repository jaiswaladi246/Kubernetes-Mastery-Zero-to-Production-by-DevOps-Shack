<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A016 · Service Types Tour

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟢 Beginner | Services | 45–60 min | [Module 05 · Services](../02-modules/05-services.md) |

## Scenario

You need to explain Service types to a new team using a live demo, not slides.

## Your tasks

1. Deploy one app and expose it as ClusterIP, NodePort, LoadBalancer (install MetalLB or cloud-provider-kind on kind), headless and ExternalName
2. Show how to reach it for each type
3. Show the iptables/nftables rules or IPVS entries created for the ClusterIP
4. Draw a diagram of each traffic path

## Acceptance criteria

- [ ] Each Service type is reachable as expected
- [ ] The LoadBalancer gets an external IP
- [ ] Rules on a node are captured
- [ ] Diagram included

<details>
<summary>Hints (try without them first)</summary>

- `sudo iptables-save
- grep <svc>` on a kind node
- cloud-provider-kind gives LoadBalancer IPs on kind

</details>

## Stretch goal

Switch kube-proxy to IPVS or nftables mode and compare the rules.

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
