<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 07 · StatefulSet Database

**Goal:** run PostgreSQL as a StatefulSet, observe stable identity and per-replica storage, and stage an update with a partition.
**Time:** 45 minutes · **Level:** 🔵 Intermediate · **Module:** [08 · StatefulSets](../../02-modules/08-statefulsets.md)

## Step 1 · Deploy

```bash
kubectl apply -f manifests/postgres.yaml
kubectl -n lab07 get pods -w     # pg-0 Ready before pg-1 starts, then pg-2
kubectl -n lab07 get pvc         # data-pg-0, data-pg-1, data-pg-2
```

## Step 2 · Stable DNS

```bash
kubectl -n lab07 run c --rm -it --image=postgres:17 --env=PGPASSWORD=lab07pass -- bash
  for i in 0 1 2; do getent hosts pg-$i.pg.lab07.svc.cluster.local; done
  psql -h pg-0.pg -U postgres -c "create table notes(t text); insert into notes values ('written to pg-0');"
  exit
```

> Each replica here is an **independent** PostgreSQL instance. A StatefulSet gives identity and storage, not replication. That's what operators like CloudNativePG add.

## Step 3 · Identity survives deletion

```bash
kubectl -n lab07 delete pod pg-0
kubectl -n lab07 get pods -w     # pg-0 comes back with the same name
kubectl -n lab07 run c --rm -it --image=postgres:17 --env=PGPASSWORD=lab07pass -- psql -h pg-0.pg -U postgres -c "select * from notes;"
```

Same name, same PVC, same data.

## Step 4 · Partitioned rollout

```bash
kubectl -n lab07 patch sts pg -p '{"spec":{"updateStrategy":{"rollingUpdate":{"partition":2}}}}'
kubectl -n lab07 patch sts pg --type=json -p='[{"op":"add","path":"/spec/template/metadata/annotations","value":{"lab07/rev":"2"}}]'
kubectl -n lab07 get pods -L controller-revision-hash   # only pg-2 has the new revision
kubectl -n lab07 patch sts pg -p '{"spec":{"updateStrategy":{"rollingUpdate":{"partition":0}}}}'
kubectl -n lab07 rollout status sts/pg
```

## Step 5 · Scale down and notice PVCs stay

```bash
kubectl -n lab07 scale sts pg --replicas=1
kubectl -n lab07 get pods,pvc
```

## Clean up

```bash
kubectl delete ns lab07     # deletes the PVCs with the namespace
```

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
