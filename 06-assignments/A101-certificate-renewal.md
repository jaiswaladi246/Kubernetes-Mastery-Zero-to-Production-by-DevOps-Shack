<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A101 · Certificate Expiry Drill

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Cluster Operations | 2–4 hours | [Module 27 · Cluster Operations & Upgrades](../02-modules/27-cluster-operations-upgrades.md) |

## Scenario

A cluster's certificates expire tomorrow.

## Your tasks

1. Check certificate expiration with kubeadm
2. Renew all certificates
3. Restart control plane components safely
4. Update admin kubeconfig
5. Verify kubelet client cert rotation

## Acceptance criteria

- [ ] New expiry dates confirmed
- [ ] Cluster healthy after renewal
- [ ] Procedure documented

<details>
<summary>Hints (try without them first)</summary>

- Static pods restart when their manifests are moved out and back in

</details>

## Stretch goal

Create an alert that fires 30 days before any cluster certificate expires.

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
