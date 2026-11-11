<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# CKA · Certified Kubernetes Administrator

## Domains mapped to this repository

| Domain (approximate weight) | Study | Practise |
|---|---|---|
| Cluster Architecture, Installation and Configuration (~25%) | [Architecture 01–07](../01-architecture/README.md), [kubeadm](../02-modules/26-cluster-setup-kubeadm.md), [RBAC](../02-modules/16-rbac-service-accounts.md), [Helm](../02-modules/19-helm.md), [Kustomize](../02-modules/20-kustomize.md), CRDs & operators | Labs 01, 16, 18, 19 · A097, A062–A064 |
| Workloads and Scheduling (~15%) | [Deployments](../02-modules/04-deployments.md), [Config](../02-modules/06-configmaps-secrets.md), [Autoscaling](../02-modules/13-autoscaling.md), [Scheduling](../02-modules/12-scheduling.md), [Resources](../02-modules/10-resource-management.md) | Labs 03, 09, 11, 12 · A044–A049 |
| Services and Networking (~20%) | [Architecture 08–10, 16](../01-architecture/README.md), [Services](../02-modules/05-services.md), [Gateway API & Ingress](../02-modules/14-ingress-gateway-api.md), [NetworkPolicies](../02-modules/15-network-policies.md), CoreDNS | Labs 04, 13, 14, 15 · A016–A020, A056, A058 |
| Storage (~10%) | [Architecture 11](../01-architecture/11-storage-csi.md), [Storage](../02-modules/07-storage.md) | Labs 06, 07 · A025–A029 |
| Troubleshooting (~30%) | [Troubleshooting playbooks](../05-troubleshooting-playbooks/README.md), [cheat sheet](../03-cheatsheets/troubleshooting.md) | Lab 22, Lab 23 · A048, A100, A101 · [Troubleshooting Q&A](../07-interview-questions/04-troubleshooting/README.md) |

Troubleshooting is the biggest domain. Practise broken kubelets, broken static pod manifests, failing CNI, DNS issues and pods that won't schedule.

## Must-know admin commands

```bash
kubeadm token create --print-join-command
kubeadm upgrade plan ; kubeadm upgrade apply v1.xx.y ; kubeadm upgrade node
kubeadm certs check-expiration
ETCDCTL_API=3 etcdctl snapshot save /opt/backup.db --endpoints=https://127.0.0.1:2379 \
  --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key
etcdutl snapshot restore /opt/backup.db --data-dir /var/lib/etcd-restore
k drain node01 --ignore-daemonsets --delete-emptydir-data ; k uncordon node01
systemctl status kubelet ; journalctl -u kubelet -n 50
ls /etc/kubernetes/manifests ; crictl ps -a ; crictl logs <id>
k auth can-i --list --as=system:serviceaccount:ns:sa
```

## Three-week plan

1. Week 1: Architecture section end to end; Labs 01–08; build a kubeadm cluster (A097).
2. Week 2: Networking, storage, scheduling; Labs 09–19; upgrade your cluster (A098) and practise etcd backup/restore (Lab 23).
3. Week 3: Troubleshooting all day: playbooks, Lab 22 repeatedly, break your kubeadm cluster on purpose and fix it; mock exams.

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
