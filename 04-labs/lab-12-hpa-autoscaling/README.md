<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 12 · HPA Autoscaling

**Goal:** scale a Deployment on CPU under generated load, tune scale-down behaviour, and see why missing requests break HPA.
**Time:** 35 minutes · **Level:** 🟢 Beginner · **Module:** [13 · Autoscaling](../../02-modules/13-autoscaling.md)

Requires metrics-server (see [Lab 09](../lab-09-resources-qos/README.md)).

## Step 1 · Deploy app + HPA

```bash
kubectl apply -f manifests/app-hpa.yaml
kubectl -n lab12 get hpa -w
```

## Step 2 · Generate load

```bash
kubectl -n lab12 run load --image=busybox:1.36 --restart=Never -- sh -c 'while true; do wget -qO- http://cpu-app >/dev/null; done'
kubectl -n lab12 get hpa,pods -w      # replicas climb within ~1-2 minutes
```

## Step 3 · Stop load and watch the stabilisation window

```bash
kubectl -n lab12 delete pod load
kubectl -n lab12 get hpa -w           # waits 60s (behavior.scaleDown) before shrinking
kubectl -n lab12 describe hpa cpu-app | tail -10
```

## Step 4 · Break it

```bash
kubectl -n lab12 patch deploy cpu-app --type=json -p='[{"op":"remove","path":"/spec/template/spec/containers/0/resources/requests"}]'
kubectl -n lab12 describe hpa cpu-app | grep -i -A2 "unable\|missing request"
```

Without CPU requests, utilisation can't be computed.

## Clean up

```bash
kubectl delete ns lab12
```

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
