<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 08 · Jobs, CronJobs & DaemonSets

**Goal:** run an indexed parallel Job, a CronJob with concurrency control, and a DaemonSet on every node.
**Time:** 35 minutes · **Level:** 🟢 Beginner · **Module:** [09 · DaemonSets, Jobs & CronJobs](../../02-modules/09-daemonsets-jobs-cronjobs.md)

## Step 1 · Indexed Job

```bash
kubectl apply -f manifests/job.yaml
kubectl -n lab08 get pods -l job-name=shards -w      # 3 at a time, 9 total
kubectl -n lab08 logs -l job-name=shards --prefix | sort
kubectl -n lab08 get job shards
```

## Step 2 · Retries and failure policy

```bash
kubectl apply -f manifests/flaky-job.yaml
kubectl -n lab08 get pods -l job-name=flaky -w
kubectl -n lab08 describe job flaky | tail -8
```

Exit code 42 is configured as "don't retry, fail the Job".

## Step 3 · CronJob

```bash
kubectl apply -f manifests/cronjob.yaml
kubectl -n lab08 create job tick-manual --from=cronjob/tick
kubectl -n lab08 get cronjob,jobs -w        # runs every minute; long runs are skipped (Forbid)
kubectl -n lab08 patch cronjob tick -p '{"spec":{"suspend":true}}'
```

## Step 4 · DaemonSet everywhere, including the control plane

```bash
kubectl apply -f manifests/daemonset.yaml
kubectl -n lab08 get pods -l app=node-agent -o wide     # one per node, control plane included (toleration)
```

Remove the toleration from the manifest, re-apply, and see the control plane pod disappear.

## Clean up

```bash
kubectl delete ns lab08
```

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
