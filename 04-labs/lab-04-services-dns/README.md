<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 04 · Services & DNS

**Goal:** use every Service type, inspect EndpointSlices, resolve names across namespaces, and debug a broken Service.
**Time:** 45 minutes · **Level:** 🟢 Beginner · **Modules:** [05 · Services](../../02-modules/05-services.md), [Architecture 10 · DNS](../../01-architecture/10-dns-coredns.md)

## Step 1 · Deploy backends and Services

```bash
kubectl apply -f manifests/services.yaml
kubectl -n lab04 get svc,endpointslices
```

## Step 2 · Test from a client pod

```bash
kubectl -n lab04 run client --rm -it --image=nicolaka/netshoot -- bash
  cat /etc/resolv.conf
  curl -s api                                   # ClusterIP by short name
  curl -s api.lab04.svc.cluster.local           # FQDN
  dig +short api.lab04.svc.cluster.local        # one virtual IP
  dig +short api-headless.lab04.svc.cluster.local   # several pod IPs
  dig +short db.lab04.svc.cluster.local         # CNAME from ExternalName
  curl -s other.lab04-other                     # cross-namespace
  exit
```

## Step 3 · Watch endpoints follow readiness

```bash
kubectl -n lab04 get endpointslices -l kubernetes.io/service-name=api -o wide -w &
kubectl -n lab04 exec deploy/api -- rm /usr/share/nginx/html/ready   # one pod fails readiness
sleep 10; kill %1
```

One address flips to not-ready and stops receiving traffic. Restore it:

```bash
kubectl -n lab04 rollout restart deploy/api
```

## Step 4 · Debug a broken Service

```bash
kubectl apply -f manifests/broken.yaml
kubectl -n lab04 run t --rm -it --image=busybox:1.36 -- wget -qO- -T 2 shop    # fails
```

Find **both** bugs using only `get`, `describe` and `endpointslices`. (Hint: compare selector vs labels, then `targetPort` vs `containerPort`.) Fix them in `broken.yaml` and re-apply.

## Verify

- [ ] You resolved ClusterIP, headless, ExternalName and cross-namespace names
- [ ] You saw an endpoint go not-ready
- [ ] You fixed both bugs in the broken Service

## Clean up

```bash
kubectl delete ns lab04 lab04-other
```

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
