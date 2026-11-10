<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 15 · Network Policies

**Goal:** lock down a 3-tier app with default-deny, allow only the required flows, and prove each rule with tests.
**Time:** 45 minutes · **Level:** 🔵 Intermediate · **Module:** [15 · Network Policies](../../02-modules/15-network-policies.md)

> kind's default CNI (kindnet) enforces NetworkPolicy in recent kind releases (v0.24+). On older kind, create the cluster with `disableDefaultCNI: true` and install Calico.

## Step 1 · Deploy the 3 tiers and a test script

```bash
kubectl apply -f manifests/app.yaml
bash manifests/test.sh        # everything can reach everything
```

## Step 2 · Default deny

```bash
kubectl apply -f manifests/00-default-deny.yaml
bash manifests/test.sh        # everything blocked, including DNS
```

## Step 3 · Allow DNS, then the real flows

```bash
kubectl apply -f manifests/01-allow-dns.yaml
kubectl apply -f manifests/02-allow-flows.yaml
bash manifests/test.sh
```

Expected: `frontend → api` ✅, `api → db` ✅, `frontend → db` ❌, `attacker → api` ❌.

## Step 4 · The AND/OR trap

Read `manifests/03-trap.yaml`. Predict whether `attacker` (in namespace `lab15-other`) can reach `api` after applying it. Apply it and run the test. Then explain why.

## Clean up

```bash
kubectl delete ns lab15 lab15-other
```

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
