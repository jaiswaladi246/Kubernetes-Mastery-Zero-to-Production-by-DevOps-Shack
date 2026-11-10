<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 16 · RBAC

**Goal:** create a least-privilege developer role, a CI ServiceAccount that can only deploy, test both with `can-i` and impersonation, and find an escalation path.
**Time:** 40 minutes · **Level:** 🔵 Intermediate · **Module:** [16 · RBAC & ServiceAccounts](../../02-modules/16-rbac-service-accounts.md)

## Step 1 · Apply roles

```bash
kubectl apply -f manifests/rbac.yaml
```

## Step 2 · Test the developer (impersonating a user in a group)

```bash
D="--as=priya --as-group=lab16-devs"
kubectl auth can-i list pods -n lab16 $D            # yes
kubectl auth can-i get pods/log -n lab16 $D         # yes
kubectl auth can-i get secrets -n lab16 $D          # no
kubectl auth can-i delete deployments -n lab16 $D   # no
kubectl auth can-i list pods -n default $D          # no (namespace-scoped)
kubectl get pods -n lab16 $D
```

## Step 3 · Test the CI ServiceAccount with a real token

```bash
TOKEN=$(kubectl -n lab16 create token ci-deployer --duration=15m)
APISERVER=$(kubectl config view --minify -o jsonpath='{.clusters[0].cluster.server}')
kubectl --server=$APISERVER --token=$TOKEN --insecure-skip-tls-verify -n lab16 set image deploy/web web=nginx:1.27-alpine   # allowed
kubectl --server=$APISERVER --token=$TOKEN --insecure-skip-tls-verify -n lab16 delete deploy web                       # forbidden
kubectl --server=$APISERVER --token=$TOKEN --insecure-skip-tls-verify -n lab16 get secrets                             # forbidden
```

## Step 4 · Find the escalation

The `ci-deployer` role allows `create` on `pods` "for debugging". Explain how a compromised CI token could read the `db-password` Secret anyway, then prove it:

```bash
kubectl auth can-i create pods -n lab16 --as=system:serviceaccount:lab16:ci-deployer
```

(Answer: create a pod that mounts the Secret as a volume or env var, then read its logs.) Remove the rule and re-test.

## Clean up

```bash
kubectl delete ns lab16
```

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
