<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Cheat Sheet · Helm & Kustomize

## Helm: repositories and search

| Task | Command |
|---|---|
| Add repo | `helm repo add bitnami https://charts.bitnami.com/bitnami` |
| Update index | `helm repo update` |
| Search repos | `helm search repo nginx` |
| Search Artifact Hub | `helm search hub cert-manager` |
| Show default values | `helm show values bitnami/redis` |
| Pull chart locally | `helm pull bitnami/redis --untar --version 20.1.0` |
| OCI login | `helm registry login ghcr.io` |

## Helm: releases

| Task | Command |
|---|---|
| Install | `helm install NAME CHART -n NS --create-namespace -f values.yaml --version X` |
| Install or upgrade | `helm upgrade --install NAME CHART -n NS -f values.yaml --atomic --wait --timeout 10m` |
| Set a value | `--set image.tag=2.1.0` · `--set-string` · `--set-file` |
| List | `helm list -A` · `helm list -n NS --all` (includes failed) |
| Status / values / manifest | `helm status NAME` · `helm get values NAME --all` · `helm get manifest NAME` |
| History / rollback | `helm history NAME` · `helm rollback NAME REV` |
| Uninstall | `helm uninstall NAME -n NS [--keep-history]` |
| Render only | `helm template NAME CHART -f values.yaml > out.yaml` |
| Server dry run | `helm install NAME CHART --dry-run=server --debug` |

## Helm: authoring

| Task | Command |
|---|---|
| Scaffold | `helm create mychart` |
| Lint | `helm lint mychart --strict -f values-prod.yaml` |
| Dependencies | `helm dependency update mychart` |
| Package | `helm package mychart` |
| Push to OCI | `helm push mychart-1.0.0.tgz oci://ghcr.io/devopsshack/charts` |
| Test | `helm test NAME` |
| Diff (plugin) | `helm diff upgrade NAME CHART -f values.yaml` |

## Template functions you'll use daily

```gotemplate
{{ .Values.image.tag | default .Chart.AppVersion | quote }}
{{ required "image.repository is required" .Values.image.repository }}
{{- include "chart.labels" . | nindent 4 }}
{{- toYaml .Values.resources | nindent 12 }}
{{- with .Values.nodeSelector }}nodeSelector: {{- toYaml . | nindent 2 }}{{- end }}
{{- range $k, $v := .Values.env }}- name: {{ $k }}  value: {{ $v | quote }}{{- end }}
{{ include (print $.Template.BasePath "/configmap.yaml") . | sha256sum }}
{{ if .Capabilities.APIVersions.Has "monitoring.coreos.com/v1" }}...{{ end }}
```

## Stuck release fixes

```bash
helm history NAME -n NS                     # find pending-upgrade / failed
helm rollback NAME <last-good> -n NS
# "another operation is in progress": an interrupted upgrade left status pending-*
kubectl get secret -n NS -l owner=helm,name=NAME     # release records
```

## Kustomize

| Task | Command |
|---|---|
| Render | `kubectl kustomize overlays/prod` · `kustomize build overlays/prod` |
| Apply | `kubectl apply -k overlays/prod` |
| Diff | `kubectl diff -k overlays/prod` |
| Set image | `kustomize edit set image app=registry/app:2.1.0` |
| Add resource | `kustomize edit add resource pdb.yaml` |
| Set namespace | `kustomize edit set namespace shop-prod` |
| Render Helm inside | `kustomize build --enable-helm` (with `helmCharts:`) |

```yaml
# kustomization.yaml quick reference
resources: [../../base, extra.yaml]
namespace: shop-prod
namePrefix: prod-
labels: [{ pairs: { env: prod } }]
images: [{ name: app, newName: ghcr.io/x/app, newTag: "2.1.0" }]
replicas: [{ name: api, count: 5 }]
configMapGenerator: [{ name: cfg, literals: [A=1], behavior: merge }]
secretGenerator: [{ name: s, envs: [secret.env] }]
patches:
  - path: patch.yaml
  - target: { kind: Deployment, name: api }
    patch: |-
      - op: add
        path: /spec/template/spec/priorityClassName
        value: critical-api
components: [../../components/monitoring]
```

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
