<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A060 · Egress Lockdown

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Network Policies | 2–4 hours | [Module 15 · Network Policies](../02-modules/15-network-policies.md) |

## Scenario

Compliance requires pods to reach only approved external endpoints.

## Your tasks

1. Apply egress default-deny
2. Allow egress to specific CIDRs on 443
3. Explain why FQDN rules need a CNI extension
4. Implement FQDN rules with Cilium (if available) or document the design

## Acceptance criteria

- [ ] Unapproved destinations blocked
- [ ] Approved ones work
- [ ] FQDN limitation explained

<details>
<summary>Hints (try without them first)</summary>

- CiliumNetworkPolicy supports toFQDNs with DNS visibility

</details>

## Stretch goal

Route all egress through an egress gateway with a stable IP and explain why partners want that.

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
