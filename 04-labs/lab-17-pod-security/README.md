<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 17 · Pod Security & Hardening

**Goal:** enforce the `restricted` Pod Security Standard, fix a non-compliant workload, and add a CEL admission policy.
**Time:** 40 minutes · **Level:** 🔵 Intermediate · **Module:** [17 · Pod Security & Hardening](../../02-modules/17-pod-security-hardening.md)

## Step 1 · Preview, then enforce

```bash
kubectl create ns lab17
kubectl label --dry-run=server --overwrite ns lab17 pod-security.kubernetes.io/enforce=restricted
kubectl label ns lab17 pod-security.kubernetes.io/enforce=restricted pod-security.kubernetes.io/warn=restricted
```

## Step 2 · Watch a typical app get rejected

```bash
kubectl apply -f manifests/insecure.yaml
kubectl -n lab17 get deploy insecure; kubectl -n lab17 describe rs -l app=insecure | grep -A6 Events
```

Read the violation list: privilege escalation, capabilities, runAsNonRoot, seccomp.

## Step 3 · Fix it

```bash
kubectl apply -f manifests/hardened.yaml
kubectl -n lab17 rollout status deploy/hardened
kubectl -n lab17 exec deploy/hardened -- id                       # uid=101
kubectl -n lab17 exec deploy/hardened -- touch /etc/hacked        # read-only filesystem
```

## Step 4 · CEL admission policy: block ':latest'

```bash
kubectl apply -f manifests/vap.yaml
kubectl -n lab17 run bad --image=nginx:latest     # denied with a clear message
kubectl -n lab17 run bad --image=nginx            # also denied (implicit latest)
```

## Clean up

```bash
kubectl delete ns lab17
kubectl delete validatingadmissionpolicy no-latest-tag
kubectl delete validatingadmissionpolicybinding no-latest-tag
```

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
