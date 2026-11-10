<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 21 · Prometheus & Grafana

**Goal:** install kube-prometheus-stack, scrape an app with a ServiceMonitor, write the key PromQL queries, and fire an alert.
**Time:** 50 minutes · **Level:** 🟣 Advanced · **Module:** [23 · Observability](../../02-modules/23-observability.md)

## Step 1 · Install

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts && helm repo update
helm install kps prometheus-community/kube-prometheus-stack -n monitoring --create-namespace \
  --set grafana.adminPassword=devopsshack --set prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues=false
kubectl -n monitoring get pods
```

## Step 2 · App with metrics + ServiceMonitor + alert

```bash
kubectl apply -f manifests/app-monitoring.yaml
kubectl -n monitoring port-forward svc/kps-kube-prometheus-stack-prometheus 9090 &
kubectl -n monitoring port-forward svc/kps-grafana 3000:80 &
```

Open Prometheus (localhost:9090) → Status → Targets: `lab21/podinfo` should be UP.

## Step 3 · Queries to run

```promql
sum by (pod) (rate(container_cpu_usage_seconds_total{namespace="lab21",container!=""}[5m]))
sum by (pod) (container_memory_working_set_bytes{namespace="lab21",container!=""})
sum(rate(http_requests_total{namespace="lab21"}[1m])) by (status)
kube_deployment_status_replicas_available{namespace="lab21"}
increase(kube_pod_container_status_restarts_total{namespace="lab21"}[15m])
```

## Step 4 · Fire the alert

```bash
kubectl -n lab21 scale deploy podinfo --replicas=0
# Prometheus → Alerts: PodinfoDown goes Pending, then Firing after 1m
kubectl -n lab21 scale deploy podinfo --replicas=2
```

## Step 5 · Grafana

Log in at localhost:3000 (admin / devopsshack). Explore the built-in "Kubernetes / Compute Resources / Namespace (Pods)" dashboard for `lab21`.

## Clean up

```bash
kill %1 %2; kubectl delete ns lab21; helm uninstall kps -n monitoring; kubectl delete ns monitoring
```

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
