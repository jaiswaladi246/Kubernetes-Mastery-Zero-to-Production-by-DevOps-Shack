<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 05 · ConfigMaps & Secrets

**Goal:** inject config as env vars and files, prove which ones update live, and roll pods automatically on config change.
**Time:** 35 minutes · **Level:** 🟢 Beginner · **Module:** [06 · ConfigMaps & Secrets](../../02-modules/06-configmaps-secrets.md)

## Step 1 · Deploy

```bash
kubectl apply -f manifests/config.yaml
kubectl -n lab05 rollout status deploy/app
POD=$(kubectl -n lab05 get pod -l app=app -o name | head -1)
kubectl -n lab05 exec $POD -- sh -c 'echo "env LOG_LEVEL=$LOG_LEVEL"; cat /etc/app/app.properties; ls -l /etc/creds'
```

## Step 2 · Change config: what updates?

```bash
kubectl -n lab05 patch configmap app-config --type merge -p '{"data":{"LOG_LEVEL":"debug","app.properties":"cache.ttl=60\n"}}'
sleep 70
kubectl -n lab05 exec $POD -- sh -c 'echo "env LOG_LEVEL=$LOG_LEVEL"; cat /etc/app/app.properties'
```

The **file** changed; the **env var** didn't. Env vars are read once at container start.

## Step 3 · Roll pods on change

```bash
kubectl -n lab05 rollout restart deploy/app
kubectl -n lab05 rollout status deploy/app
POD=$(kubectl -n lab05 get pod -l app=app -o name | head -1)
kubectl -n lab05 exec $POD -- sh -c 'echo "env LOG_LEVEL=$LOG_LEVEL"'
```

## Step 4 · Missing key = CreateContainerConfigError

```bash
kubectl apply -f manifests/missing-key.yaml
kubectl -n lab05 get pod bad-config
kubectl -n lab05 describe pod bad-config | tail -5
```

## Step 5 · See how "secret" a Secret is

```bash
kubectl -n lab05 get secret db-creds -o jsonpath='{.data.password}' | base64 -d; echo
```

Anyone with `get secrets` in this namespace can do that. That's why RBAC and external secret managers matter.

## Clean up

```bash
kubectl delete ns lab05
```

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
