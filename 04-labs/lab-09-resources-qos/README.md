<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 09 · Resources, QoS & OOMKills

**Goal:** see QoS classes, trigger an OOMKill, observe CPU throttling, and enforce LimitRange + ResourceQuota.
**Time:** 40 minutes · **Level:** 🔵 Intermediate · **Module:** [10 · Resource Management](../../02-modules/10-resource-management.md)

Install metrics-server on kind first:

```bash
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
kubectl -n kube-system patch deploy metrics-server --type=json -p='[{"op":"add","path":"/spec/template/spec/containers/0/args/-","value":"--kubelet-insecure-tls"}]'
```

## Step 1 · QoS classes

```bash
kubectl apply -f manifests/qos.yaml
kubectl -n lab09 get pods -o custom-columns=NAME:.metadata.name,QOS:.status.qosClass
```

## Step 2 · OOMKill

```bash
kubectl apply -f manifests/oom.yaml
kubectl -n lab09 get pod hungry -w
kubectl -n lab09 describe pod hungry | grep -A4 "Last State"   # Reason: OOMKilled, Exit Code: 137
```

## Step 3 · CPU throttling

```bash
kubectl apply -f manifests/throttle.yaml
sleep 60; kubectl top pod -n lab09 burner        # pinned at ~200m despite wanting more
kubectl -n lab09 exec burner -- cat /sys/fs/cgroup/cpu.stat    # nr_throttled climbing
```

## Step 4 · LimitRange defaults and ResourceQuota

```bash
kubectl apply -f manifests/guardrails.yaml
kubectl -n lab09-team run nolimits --image=busybox:1.36 -- sleep 3600
kubectl -n lab09-team get pod nolimits -o jsonpath='{.spec.containers[0].resources}'; echo   # defaults injected
kubectl -n lab09-team create deployment big --image=busybox:1.36 --replicas=10 -- sleep 3600
kubectl -n lab09-team get rs; kubectl -n lab09-team describe rs | grep -i exceeded   # quota blocks extra pods
kubectl -n lab09-team describe quota
```

## Clean up

```bash
kubectl delete ns lab09 lab09-team
```

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
