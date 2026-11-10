<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 18 · Helm

**Goal:** install a public chart, then build, lint, install, upgrade and roll back your own chart.
**Time:** 50 minutes · **Level:** 🔵 Intermediate · **Module:** [19 · Helm](../../02-modules/19-helm.md)

## Step 1 · A public chart

```bash
helm install podinfo oci://ghcr.io/stefanprodan/charts/podinfo -n lab18 --create-namespace --set replicaCount=2
helm list -n lab18; helm get values podinfo -n lab18 --all | head -20
helm uninstall podinfo -n lab18
```

## Step 2 · Your chart

The chart in `chart/devopsshack-web` renders a Deployment, Service, ConfigMap and optional HPA.

```bash
helm lint chart/devopsshack-web
helm template web chart/devopsshack-web | less
helm template web chart/devopsshack-web -f chart/values-prod.yaml | grep -E "replicas|image:|kind:"
helm install web chart/devopsshack-web -n lab18 --wait
kubectl -n lab18 get all
```

## Step 3 · Upgrade, fail, roll back

```bash
helm upgrade web chart/devopsshack-web -n lab18 --set message="v2 rollout" --wait
helm upgrade web chart/devopsshack-web -n lab18 --set image.tag=does-not-exist --atomic --timeout 60s   # fails and auto-rolls back
helm history web -n lab18
helm rollback web 1 -n lab18
```

## Step 4 · Config checksum

Change `message`, upgrade, and notice the pods roll even though only the ConfigMap changed (the `checksum/config` annotation).

## Clean up

```bash
helm uninstall web -n lab18; kubectl delete ns lab18
```

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
