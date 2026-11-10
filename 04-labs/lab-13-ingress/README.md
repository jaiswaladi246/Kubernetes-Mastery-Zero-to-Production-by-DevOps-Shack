<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 13 · Ingress

**Goal:** install an ingress controller on kind, route two apps by host and path, and add TLS with a self-signed cert-manager issuer.
**Time:** 45 minutes · **Level:** 🔵 Intermediate · **Module:** [14 · Ingress & Gateway API](../../02-modules/14-ingress-gateway-api.md)

The cluster from Lab 01 maps host ports 80/443 to the control plane node labelled `ingress-ready=true`.

## Step 1 · Install Traefik bound to host ports

```bash
helm repo add traefik https://traefik.github.io/charts && helm repo update
helm install traefik traefik/traefik -n traefik --create-namespace -f manifests/traefik-values.yaml
kubectl -n traefik get pods -o wide
```

## Step 2 · Apps and Ingress

```bash
kubectl apply -f manifests/apps.yaml
kubectl apply -f manifests/ingress.yaml
curl -s -H "Host: shop.local" localhost/        # web
curl -s -H "Host: shop.local" localhost/api     # api
curl -s -o /dev/null -w "%{http_code}\n" -H "Host: other.local" localhost/   # 404
```

## Step 3 · TLS with cert-manager

```bash
helm repo add jetstack https://charts.jetstack.io && helm repo update
helm install cert-manager jetstack/cert-manager -n cert-manager --create-namespace --set crds.enabled=true
kubectl apply -f manifests/tls.yaml
kubectl -n lab13 get certificate -w          # READY True
curl -sk --resolve shop.local:443:127.0.0.1 https://shop.local/ | head -3
kubectl -n lab13 get secret shop-tls -o jsonpath='{.data.tls\.crt}' | base64 -d | openssl x509 -noout -subject -enddate
```

## Step 4 · Break and diagnose

Change the api backend's service port in `ingress.yaml` to `8080`, re-apply, curl `/api`, and read the controller logs:

```bash
kubectl -n traefik logs deploy/traefik --tail=20
```

## Clean up

```bash
kubectl delete ns lab13
helm uninstall traefik -n traefik; helm uninstall cert-manager -n cert-manager
```

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
