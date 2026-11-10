<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 03 · Deployments & Rolling Updates

**Goal:** observe a rolling update, break a rollout with a bad image, roll back, and tune surge/unavailable settings.
**Time:** 40 minutes · **Level:** 🟢 Beginner · **Module:** [04 · Deployments](../../02-modules/04-deployments.md)

## Step 1 · Deploy v1

```bash
kubectl apply -f manifests/app-v1.yaml
kubectl -n lab03 rollout status deploy/web
kubectl -n lab03 get rs -o wide
```

## Step 2 · Generate traffic and roll to v2

Terminal A (continuous traffic from inside the cluster):

```bash
kubectl -n lab03 run load --image=busybox:1.36 --restart=Never -- \
  sh -c 'while true; do wget -qO- -T 1 http://web | head -1 || echo FAIL; sleep 0.2; done'
kubectl -n lab03 logs -f load
```

Terminal B:

```bash
kubectl -n lab03 set image deploy/web web=nginxdemos/hello:0.4-plain-text
kubectl -n lab03 annotate deploy/web kubernetes.io/change-cause="v2: new hello image" --overwrite
kubectl -n lab03 get rs -w
```

Watch two ReplicaSets trade replicas. Count `FAIL` lines in terminal A (there should be none or very few: see [Lab 10](../lab-10-probes-graceful-shutdown/README.md) for making it zero).

## Step 3 · Break it

```bash
kubectl -n lab03 set image deploy/web web=nginxdemos/hello:does-not-exist
kubectl -n lab03 rollout status deploy/web --timeout=60s    # times out
kubectl -n lab03 get pods                                     # ImagePullBackOff, old pods still serving
```

Because `maxUnavailable: 0`, the old version keeps serving. The bad rollout is stuck, not an outage.

## Step 4 · Roll back

```bash
kubectl -n lab03 rollout history deploy/web
kubectl -n lab03 rollout undo deploy/web
kubectl -n lab03 rollout status deploy/web
```

## Step 5 · Experiment

Edit `manifests/app-v1.yaml` and try `maxSurge: 0, maxUnavailable: 1`, then `type: Recreate`. Re-run step 2 each time and compare the FAIL count and rollout time.

## Verify

- [ ] You saw both ReplicaSets during a rollout
- [ ] A bad image did not take the app down
- [ ] You rolled back to a known revision

## Clean up

```bash
kubectl delete ns lab03
```

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
