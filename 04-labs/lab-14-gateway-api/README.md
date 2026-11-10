<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 14 · Gateway API

**Goal:** install the Gateway API CRDs and Envoy Gateway, route with HTTPRoutes, run a weighted canary and header-based routing.
**Time:** 45 minutes · **Level:** 🔵 Intermediate · **Module:** [14 · Ingress & Gateway API](../../02-modules/14-ingress-gateway-api.md)

## Step 1 · Install

```bash
helm install eg oci://docker.io/envoyproxy/gateway-helm -n envoy-gateway-system --create-namespace
kubectl -n envoy-gateway-system wait --for=condition=Available deploy/envoy-gateway --timeout=180s
kubectl get crd | grep gateway.networking.k8s.io
```

The Envoy Gateway chart installs the Gateway API CRDs too.

## Step 2 · GatewayClass, Gateway and two app versions

```bash
kubectl apply -f manifests/gateway.yaml
kubectl apply -f manifests/apps.yaml
kubectl -n lab14 get gateway public -w        # PROGRAMMED True
SVC=$(kubectl -n envoy-gateway-system get svc -l gateway.envoyproxy.io/owning-gateway-name=public -o name)
kubectl -n envoy-gateway-system port-forward $SVC 8888:80 &
```

## Step 3 · 90/10 canary

```bash
kubectl apply -f manifests/route-canary.yaml
for i in $(seq 1 50); do curl -s -H "Host: shop.local" localhost:8888; done | sort | uniq -c
```

Change the weights to 50/50, re-apply and count again.

## Step 4 · Header routing for beta users

```bash
kubectl apply -f manifests/route-header.yaml
curl -s -H "Host: shop.local" localhost:8888
curl -s -H "Host: shop.local" -H "x-beta: true" localhost:8888
kubectl -n lab14 describe httproute shop | sed -n '/Status/,$p'
```

## Clean up

```bash
kill %1; kubectl delete ns lab14; kubectl delete gatewayclass eg
helm uninstall eg -n envoy-gateway-system
```

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
