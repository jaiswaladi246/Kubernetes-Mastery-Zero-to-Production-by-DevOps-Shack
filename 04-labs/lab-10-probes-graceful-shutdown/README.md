<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 10 · Probes & Graceful Shutdown

**Goal:** see each probe's effect, reproduce the "liveness checks a dependency" outage, and achieve a zero-error rolling update.
**Time:** 45 minutes · **Level:** 🔵 Intermediate · **Module:** [11 · Health Probes & Lifecycle](../../02-modules/11-health-probes-lifecycle.md)

## Step 1 · Readiness removes, liveness restarts

```bash
kubectl apply -f manifests/probes.yaml
kubectl -n lab10 get pods -w &
POD=$(kubectl -n lab10 get pod -l app=probe-demo -o name | head -1)
kubectl -n lab10 exec $POD -- rm /usr/share/nginx/html/ready     # readiness fails → 0/1, NOT restarted
sleep 15
kubectl -n lab10 exec $POD -- rm /usr/share/nginx/html/healthz   # liveness fails → restart count +1
sleep 30; kill %1
kubectl -n lab10 describe $POD | grep -E "Unhealthy|Killing" | tail -4
```

## Step 2 · The cascading-restart anti-pattern

`manifests/bad-liveness.yaml` has a liveness probe that checks a "database" Service. Scale the database to zero and watch every app pod restart:

```bash
kubectl apply -f manifests/bad-liveness.yaml
kubectl -n lab10 rollout status deploy/fragile
kubectl -n lab10 scale deploy/fake-db --replicas=0
kubectl -n lab10 get pods -l app=fragile -w     # restarts climb on ALL replicas
kubectl -n lab10 scale deploy/fake-db --replicas=1
```

Fix: move the dependency check to the readiness probe and make liveness local.

## Step 3 · Zero-downtime rollout

Start load (counts failures):

```bash
kubectl -n lab10 run load --image=busybox:1.36 --restart=Never -- sh -c \
  'ok=0; fail=0; while true; do if wget -qO- -T 1 http://graceful >/dev/null 2>&1; then ok=$((ok+1)); else fail=$((fail+1)); fi; echo "ok=$ok fail=$fail"; sleep 0.1; done'
```

Roll the Deployment **without** preStop (the manifest has it commented out):

```bash
kubectl apply -f manifests/graceful.yaml
kubectl -n lab10 rollout restart deploy/graceful && kubectl -n lab10 rollout status deploy/graceful
kubectl -n lab10 logs load --tail=1
```

Now uncomment the `preStop` block, apply, restart again, and compare the failure counts.

## Clean up

```bash
kubectl delete ns lab10
```

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
