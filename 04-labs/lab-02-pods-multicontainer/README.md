<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 02 · Pods & Multi-Container Patterns

**Goal:** build a pod with an init container, a native sidecar and a shared volume; then debug a distroless container with an ephemeral container.
**Time:** 40 minutes · **Level:** 🟢 Beginner · **Module:** [02 · Pods](../../02-modules/02-pods.md)

## Step 1 · Init container + sidecar + shared volume

```bash
kubectl apply -f manifests/multi.yaml
kubectl -n lab02 get pod web -w        # Init:0/2 → PodInitializing → Running
kubectl -n lab02 describe pod web | sed -n '/Init Containers/,/Containers:/p'
```

The `content` init container writes `index.html` into an `emptyDir`; the `log-tailer` native sidecar starts before nginx and keeps running.

```bash
kubectl -n lab02 port-forward pod/web 8080:80 &
curl -s localhost:8080; curl -s localhost:8080/missing >/dev/null
kubectl -n lab02 logs web -c log-tailer --tail=5
kill %1
```

## Step 2 · Share the network namespace

```bash
kubectl -n lab02 exec web -c log-tailer -- wget -qO- localhost:80 | head -3
```

The sidecar reaches nginx on `localhost`: same network namespace.

## Step 3 · Debug a distroless container

```bash
kubectl apply -f manifests/distroless.yaml
kubectl -n lab02 exec -it tiny -- sh            # fails: no shell in the image
kubectl -n lab02 debug -it tiny --image=busybox:1.36 --target=app -- sh
  ps aux          # you can see the app's process (shared PID namespace via --target)
  ls /proc/1/root # the app container's filesystem
```

## Step 4 · Read container state

```bash
kubectl apply -f manifests/crasher.yaml
kubectl -n lab02 get pod crasher -w             # CrashLoopBackOff
kubectl -n lab02 get pod crasher -o jsonpath='{.status.containerStatuses[0].lastState.terminated}'; echo
kubectl -n lab02 logs crasher --previous
```

## Verify

- [ ] You can explain the start order: init containers → sidecar → app
- [ ] The sidecar shows nginx access logs
- [ ] You debugged a shell-less container

## Clean up

```bash
kubectl delete ns lab02
```

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
