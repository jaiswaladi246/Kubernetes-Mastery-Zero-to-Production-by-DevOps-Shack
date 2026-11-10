<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 06 · Persistent Storage

**Goal:** provision volumes dynamically, prove data survives pod deletion, expand understanding of reclaim policies, and reproduce a stuck PVC.
**Time:** 35 minutes · **Level:** 🟢 Beginner · **Module:** [07 · Storage](../../02-modules/07-storage.md)

kind ships the `standard` StorageClass (rancher local-path provisioner, `WaitForFirstConsumer`).

## Step 1 · Inspect the StorageClass

```bash
kubectl get storageclass
kubectl get sc standard -o yaml | grep -E 'provisioner|volumeBindingMode|reclaimPolicy'
```

## Step 2 · Create a PVC and notice it waits

```bash
kubectl apply -f manifests/pvc.yaml
kubectl -n lab06 get pvc      # Pending: WaitForFirstConsumer, no pod yet
kubectl apply -f manifests/writer.yaml
kubectl -n lab06 get pvc,pv   # Bound once the pod is scheduled
```

## Step 3 · Data survives the pod

```bash
kubectl -n lab06 exec deploy/writer -- sh -c 'tail -3 /data/log.txt'
kubectl -n lab06 delete pod -l app=writer
kubectl -n lab06 rollout status deploy/writer
kubectl -n lab06 exec deploy/writer -- sh -c 'head -1 /data/log.txt; wc -l /data/log.txt'
```

The first line is from the old pod: same volume, reattached.

## Step 4 · Reclaim policy

```bash
PV=$(kubectl -n lab06 get pvc data -o jsonpath='{.spec.volumeName}')
kubectl get pv $PV -o jsonpath='{.spec.persistentVolumeReclaimPolicy}'; echo
kubectl patch pv $PV -p '{"spec":{"persistentVolumeReclaimPolicy":"Retain"}}'
kubectl -n lab06 delete deploy writer && kubectl -n lab06 delete pvc data
kubectl get pv $PV     # Released, data kept on disk
kubectl delete pv $PV  # manual cleanup
```

## Step 5 · Reproduce a stuck PVC

```bash
kubectl apply -f manifests/bad-pvc.yaml
kubectl -n lab06 describe pvc fast-data | tail -5   # storageclass "fast-ssd" not found
```

## Clean up

```bash
kubectl delete ns lab06
```

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
