<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 19 · Kustomize

**Goal:** one base, dev and prod overlays, a config generator that rolls pods, and an optional component.
**Time:** 35 minutes · **Level:** 🔵 Intermediate · **Module:** [20 · Kustomize](../../02-modules/20-kustomize.md)

```bash
kubectl kustomize app/overlays/dev
kubectl kustomize app/overlays/prod
diff <(kubectl kustomize app/overlays/dev) <(kubectl kustomize app/overlays/prod)
kubectl apply -k app/overlays/dev
kubectl apply -k app/overlays/prod
kubectl get deploy -A -l app.kubernetes.io/part-of=lab19
```

Change a literal in `overlays/prod/kustomization.yaml` (`GREETING`), re-apply, and notice the generated ConfigMap gets a new hash suffix and the prod pods roll automatically.

Clean up: `kubectl delete -k app/overlays/dev; kubectl delete -k app/overlays/prod`

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
