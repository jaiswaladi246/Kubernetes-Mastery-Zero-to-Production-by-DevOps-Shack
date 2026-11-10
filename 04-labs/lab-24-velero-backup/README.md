<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 24 · Velero Backup & Restore

**Goal:** back up a namespace (objects + volume data) to S3-compatible storage (MinIO) and restore it, including into a different namespace.
**Time:** 50 minutes · **Level:** 🟣 Advanced · **Module:** [28 · Backup & DR](../../02-modules/28-backup-disaster-recovery.md)

## Step 1 · MinIO as the backup target

```bash
kubectl apply -f manifests/minio.yaml
kubectl -n velero-minio rollout status deploy/minio
```

## Step 2 · Install Velero (CLI from github.com/vmware-tanzu/velero/releases)

```bash
cat > /tmp/creds <<EOF
[default]
aws_access_key_id = devopsshack
aws_secret_access_key = devopsshack123
EOF
velero install --provider aws --plugins velero/velero-plugin-for-aws:v1.10.0 \
  --bucket velero --secret-file /tmp/creds --use-volume-snapshots=false --use-node-agent \
  --backup-location-config region=minio,s3ForcePathStyle=true,s3Url=http://minio.velero-minio.svc:9000
kubectl -n velero get pods
```

## Step 3 · Workload with data, then back up

```bash
kubectl apply -f manifests/app.yaml
sleep 20; kubectl -n lab24 exec deploy/notes -- wc -l /data/notes.txt
velero backup create lab24-1 --include-namespaces lab24 --default-volumes-to-fs-backup --wait
velero backup describe lab24-1 --details
```

## Step 4 · Disaster and restore

```bash
kubectl delete ns lab24
velero restore create --from-backup lab24-1 --wait
kubectl -n lab24 exec deploy/notes -- head -2 /data/notes.txt    # old lines are back
velero restore create --from-backup lab24-1 --namespace-mappings lab24:lab24-copy --wait
kubectl get all -n lab24-copy
```

## Clean up

```bash
kubectl delete ns lab24 lab24-copy velero-minio; velero uninstall --force
```

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
