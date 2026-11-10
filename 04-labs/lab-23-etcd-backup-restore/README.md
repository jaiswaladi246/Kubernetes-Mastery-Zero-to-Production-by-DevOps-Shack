<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 23 · etcd Backup & Restore

**Goal:** snapshot etcd on a kind control plane node, destroy data, and restore the cluster state.
**Time:** 45 minutes · **Level:** 🟣 Advanced · **Architecture:** [03 · etcd](../../01-architecture/03-etcd.md) · **Module:** [27](../../02-modules/27-cluster-operations-upgrades.md)

Use a disposable single-node cluster for this lab:

```bash
kind create cluster --name etcd-lab
docker exec -it etcd-lab-control-plane bash
```

Everything below runs **inside** the node container.

## Step 1 · Create something worth saving

```bash
export KUBECONFIG=/etc/kubernetes/admin.conf
kubectl create ns precious && kubectl -n precious create deploy keep-me --image=nginx:1.27 --replicas=2
kubectl -n precious create configmap note --from-literal=msg="restore me"
```

## Step 2 · Snapshot

```bash
ETCDCTL="crictl exec $(crictl ps --name etcd -q) etcdctl --endpoints=https://127.0.0.1:2379 \
  --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key"
$ETCDCTL endpoint status -w table
$ETCDCTL snapshot save /var/lib/etcd/snap.db
ls -lh /var/lib/etcd/snap.db
```

## Step 3 · Disaster

```bash
kubectl delete ns precious
kubectl get ns precious      # gone
```

## Step 4 · Restore

```bash
crictl exec $(crictl ps --name etcd -q) etcdutl snapshot restore /var/lib/etcd/snap.db --data-dir /var/lib/etcd/restored
# point etcd at the restored data dir
sed -i 's#path: /var/lib/etcd$#path: /var/lib/etcd/restored#' /etc/kubernetes/manifests/etcd.yaml
grep -n "/var/lib/etcd" /etc/kubernetes/manifests/etcd.yaml
# the kubelet restarts etcd (static pod); give the API server a minute
sleep 60
kubectl get ns precious && kubectl -n precious get deploy,cm
```

The namespace, Deployment and ConfigMap are back.

## What to remember for production

- Snapshot regularly, store off-cluster and encrypted, and practise restores.
- In a multi-member etcd cluster, restore every member from the same snapshot with new data dirs and the right `--initial-cluster` flags.
- Managed Kubernetes doesn't expose etcd: use Velero for resource-level backups.

## Clean up

```bash
exit; kind delete cluster --name etcd-lab
```

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
