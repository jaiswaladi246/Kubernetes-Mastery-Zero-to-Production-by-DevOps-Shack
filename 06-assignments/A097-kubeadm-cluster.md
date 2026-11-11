<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A097 · Build a Cluster with kubeadm

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Cluster Operations | 2–4 hours | [Module 27 · Cluster Operations & Upgrades](../02-modules/27-cluster-operations-upgrades.md) |

## Scenario

Build a real cluster by hand to understand every piece.

## Your tasks

1. Provision 3 VMs (cloud, Multipass or Vagrant)
2. Install containerd, kubeadm, kubelet and kubectl
3. Initialise the control plane and install a CNI
4. Join two workers
5. Deploy a test app with a NodePort

## Acceptance criteria

- [ ] All nodes Ready
- [ ] Test app reachable
- [ ] Notes include every command and the files kubeadm created

<details>
<summary>Hints (try without them first)</summary>

- Swap off, br_netfilter loaded, ip_forward enabled, SystemdCgroup true

</details>

## Stretch goal

Make the control plane HA with three nodes behind a load balancer.

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
