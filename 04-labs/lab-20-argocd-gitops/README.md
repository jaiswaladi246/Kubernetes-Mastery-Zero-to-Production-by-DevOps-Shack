<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 20 · GitOps with Argo CD

**Goal:** install Argo CD, deploy from Git, see drift self-heal, and roll back with a Git revert.
**Time:** 50 minutes · **Level:** 🔵 Intermediate · **Module:** [21 · GitOps](../../02-modules/21-gitops.md)

You need your own Git repository for this lab (fork this repository or create a small repo containing the `gitops-repo/` folder from this lab).

## Step 1 · Install Argo CD

```bash
kubectl create namespace argocd
kubectl apply -n argocd --server-side -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl -n argocd rollout status deploy/argocd-server
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d; echo
kubectl -n argocd port-forward svc/argocd-server 8443:443 &
# UI at https://localhost:8443  (user: admin)
```

## Step 2 · Point an Application at your repo

Edit `manifests/application.yaml`: set `repoURL` to your repository and `path` to the folder holding `gitops-repo/guestbook`.

```bash
kubectl apply -f manifests/application.yaml
kubectl -n argocd get applications -w      # Synced / Healthy
kubectl -n lab20 get all
```

## Step 3 · Drift and self-heal

```bash
kubectl -n lab20 scale deploy guestbook --replicas=5
kubectl -n lab20 get deploy guestbook -w     # back to 2 within seconds (selfHeal)
kubectl -n lab20 delete svc guestbook        # recreated
```

## Step 4 · Deploy and roll back through Git

1. In your repo, change `replicas: 2` to `3` and the message text in `deployment.yaml`; commit and push.
2. Watch Argo CD sync (or click Refresh).
3. `git revert HEAD && git push`. Watch it roll back. That's your audit trail and rollback mechanism in one.

## Step 5 · Prune

Delete `service.yaml` from Git and push. With `prune: true`, Argo CD deletes the Service from the cluster.

## Clean up

```bash
kubectl delete -f manifests/application.yaml
kubectl delete ns argocd lab20
```

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
