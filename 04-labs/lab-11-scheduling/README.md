<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 11 · Scheduling: Taints, Affinity, Spread, Priority

**Goal:** control pod placement on a 3-node kind cluster with zone labels (from [Lab 01](../lab-01-first-cluster/README.md)'s cluster config).
**Time:** 45 minutes · **Level:** 🔵 Intermediate · **Module:** [12 · Scheduling](../../02-modules/12-scheduling.md)

```bash
kubectl get nodes -L topology.kubernetes.io/zone
kubectl create ns lab11
```

## Step 1 · Dedicated node with taint + affinity

```bash
kubectl taint node devopsshack-lab-worker2 dedicated=payments:NoSchedule
kubectl label node devopsshack-lab-worker2 dedicated=payments
kubectl apply -f manifests/dedicated.yaml
kubectl -n lab11 get pods -o wide     # payments pods only on worker2, others never on worker2
```

## Step 2 · Topology spread across zones

```bash
kubectl apply -f manifests/spread.yaml
kubectl -n lab11 get pods -l app=spread -o wide
```

Scale to 5 and check the skew stays ≤ 1 between zones.

## Step 3 · Hard anti-affinity leaves pods Pending

```bash
kubectl apply -f manifests/anti-affinity.yaml      # 4 replicas, only 3 nodes allowed
kubectl -n lab11 get pods -l app=quorum
kubectl -n lab11 describe pod -l app=quorum | grep -A3 FailedScheduling | head -5
```

## Step 4 · Priority & preemption

```bash
kubectl apply -f manifests/priority.yaml
kubectl -n lab11 get pods -l tier -o wide -w
```

`filler` pods request most of the cluster at low priority; the `critical` pods preempt them.

## Step 5 · Read the scheduler's mind

```bash
kubectl -n lab11 run impossible --image=busybox:1.36 --overrides='{"spec":{"containers":[{"name":"c","image":"busybox:1.36","command":["sleep","3600"],"resources":{"requests":{"cpu":"64"}}}]}}'
kubectl -n lab11 describe pod impossible | tail -3
```

## Clean up

```bash
kubectl delete ns lab11
kubectl delete priorityclass lab11-critical lab11-low
kubectl taint node devopsshack-lab-worker2 dedicated-
kubectl label node devopsshack-lab-worker2 dedicated-
```

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
