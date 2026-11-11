<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Scenario-Based · Storage, Stateful Apps & Configuration

Questions 151–200 of the scenario-based bank. Answer each one out loud before opening the answer.

---

**Q151. A PVC is Pending. Walk through your debugging.**

<details>
<summary>Show answer</summary>

`kubectl describe pvc` events: check the StorageClass name exists or a default is set, WaitForFirstConsumer waiting for a pod, CSI controller logs for provisioning errors, cloud permissions and quotas, and access mode support.

</details>

**Q152. A database pod moved to another node and now shows Multi-Attach error. Why?**

<details>
<summary>Show answer</summary>

Its RWO disk is still attached to the old node, usually because the old node died and detach hasn't completed. Confirm the node is gone, then use the out-of-service taint or delete the node to allow force detach.

</details>

**Q153. You need to run PostgreSQL in Kubernetes for production. What's your approach?**

<details>
<summary>Show answer</summary>

Prefer a managed database unless you have strong reasons; otherwise use an operator like CloudNativePG for replication, failover, backups with PITR, monitoring and upgrades, on fast replicated storage with anti-affinity and PDBs.

</details>

**Q154. A volume is almost full. How do you expand it without downtime?**

<details>
<summary>Show answer</summary>

If the StorageClass allows expansion, increase the PVC's requested storage; most CSI drivers expand online. Monitor kubelet_volume_stats metrics to alert before it's urgent.

</details>

**Q155. Someone deleted a PVC with reclaimPolicy Delete. Can you recover?**

<details>
<summary>Show answer</summary>

Not from Kubernetes; the disk is deleted. Recover from backups or snapshots (Velero, CSI snapshots, database backups). Use Retain or snapshot policies for critical data.

</details>

**Q156. Multiple pods across nodes need to write shared files. What storage do you choose?**

<details>
<summary>Show answer</summary>

An RWX-capable backend such as EFS, Azure Files, Filestore, CephFS or NFS via CSI, or redesign to use object storage. Block volumes (EBS, PD) are RWO only.

</details>

**Q157. Your app writes temporary files to /tmp and you enabled readOnlyRootFilesystem. It now crashes. Fix it.**

<details>
<summary>Show answer</summary>

Mount an emptyDir at /tmp (and other writable paths), with a sizeLimit, while keeping the root filesystem read-only.

</details>

**Q158. A StatefulSet must be scaled down from 5 to 3 but data on replicas 3 and 4 is needed later. What happens to their PVCs?**

<details>
<summary>Show answer</summary>

By default they're retained, so scaling back up reattaches them. Ensure your app (or operator) handles data rebalancing when members leave and rejoin.

</details>

**Q159. How do you back up a namespace including its volumes?**

<details>
<summary>Show answer</summary>

Use Velero with CSI snapshots (moved to object storage) or file-system backup via the node agent, schedule it with retention, and test restores regularly.

</details>

**Q160. You need to clone production data into staging for testing. How with Kubernetes storage?**

<details>
<summary>Show answer</summary>

Take a VolumeSnapshot or database backup, restore into a new PVC in staging via dataSource (same cluster) or through backups (different cluster), and anonymise sensitive data.

</details>

**Q161. Pod startup takes minutes because of a large volume. Why?**

<details>
<summary>Show answer</summary>

Recursive ownership changes for fsGroup on many files. Set fsGroupChangePolicy OnRootMismatch, or handle permissions in the image.

</details>

**Q162. A pod gets Pending with "volume node affinity conflict". What does it mean?**

<details>
<summary>Show answer</summary>

The PV is bound to a zone (or node) where the pod can't be scheduled, often because the PVC was provisioned with Immediate binding in another zone. Use WaitForFirstConsumer and ensure capacity in that zone.

</details>

**Q163. Secrets are stored in Git in plain YAML. How do you fix this?**

<details>
<summary>Show answer</summary>

Remove them from Git (and history), rotate exposed credentials, and adopt External Secrets Operator, Sealed Secrets or SOPS so only encrypted data or references live in Git.

</details>

**Q164. You need to rotate a database password used by 20 services without downtime. How?**

<details>
<summary>Show answer</summary>

Support dual credentials during rotation, update the secret in the vault, sync it with External Secrets, roll pods (Reloader or rollout restart), verify, then revoke the old credential.

</details>

**Q165. How do you mount a single file from a ConfigMap into an existing directory?**

<details>
<summary>Show answer</summary>

Use a volumeMount with subPath for that key. Note subPath mounts don't receive live updates.

</details>

**Q166. An app needs a config file that differs per environment. How do you manage it?**

<details>
<summary>Show answer</summary>

Keep the file in a ConfigMap generated per environment (Kustomize configMapGenerator or Helm values), with a hash or checksum so changes roll pods.

</details>

**Q167. How do you inject the pod's own name and namespace into its environment?**

<details>
<summary>Show answer</summary>

Use the downward API with fieldRef metadata.name and metadata.namespace in env vars.

</details>

**Q168. An app must read a TLS certificate that renews every 60 days. How do you deliver it?**

<details>
<summary>Show answer</summary>

cert-manager issues it into a Secret; mount the Secret as a volume (not env) so renewals propagate, and have the app reload the file or restart pods on change.

</details>

**Q169. A team stores 5 MB of data in a ConfigMap and it fails. Why?**

<details>
<summary>Show answer</summary>

ConfigMaps are limited to 1 MiB. Store large data in an image, volume or object storage instead.

</details>

**Q170. You want to prevent accidental edits to production config. How?**

<details>
<summary>Show answer</summary>

Use immutable ConfigMaps/Secrets with versioned names, GitOps with self-heal, and RBAC that denies humans write access in production.

</details>

**Q171. Pods need credentials for AWS S3. How do you provide them securely?**

<details>
<summary>Show answer</summary>

Use EKS Pod Identity or IRSA so the pod's ServiceAccount assumes an IAM role, with least-privilege policies. No static keys in Secrets.

</details>

**Q172. How do you share a Secret across namespaces?**

<details>
<summary>Show answer</summary>

Kubernetes doesn't share Secrets across namespaces. Replicate them with External Secrets (ClusterSecretStore), a reflector/replicator controller, or create them per namespace from a common source.

</details>

**Q173. An app logs its configuration at startup, including secrets. What do you do?**

<details>
<summary>Show answer</summary>

Fix the app to redact sensitive values, rotate any exposed secrets, purge logs where possible, and add log scrubbing in the pipeline as defence in depth.

</details>

**Q174. How would you run Redis as a cache in Kubernetes?**

<details>
<summary>Show answer</summary>

A Deployment or StatefulSet (or an operator for replication/sentinel/cluster mode), with memory limits matching maxmemory, an eviction policy, no persistence if purely a cache, and a PDB.

</details>

**Q175. You must move a StatefulSet's data to a faster storage class. How?**

<details>
<summary>Show answer</summary>

Snapshot or back up each PVC, create new PVCs in the new class from snapshots or restore, then recreate the StatefulSet pointing at the new class, often using --cascade=orphan; or use the database's own replication to migrate.

</details>

**Q176. Your CronJob writes backups to a PVC that's RWO, and the backup pod is Pending. Why?**

<details>
<summary>Show answer</summary>

The PVC is attached to a node where another pod uses it, or in another zone. Write backups to object storage instead, or schedule the job onto the same node.

</details>

**Q177. How do you make sure two pods never mount the same RWO volume for writing?**

<details>
<summary>Show answer</summary>

Use ReadWriteOncePod access mode where supported, or StatefulSets with per-pod PVCs, and avoid sharing claims across Deployments.

</details>

**Q178. A Kafka cluster in Kubernetes needs stable broker identities and storage. What do you use?**

<details>
<summary>Show answer</summary>

An operator like Strimzi that manages StatefulSet-like pods with per-broker PVCs, rack awareness across zones, listeners and rolling updates.

</details>

**Q179. How do you migrate a VM-based app with local disk state to Kubernetes?**

<details>
<summary>Show answer</summary>

Externalise state where possible (managed DB, object storage), otherwise move it to a PVC via a migration job or restore, run it as a StatefulSet, and plan cutover with a final sync and rollback.

</details>

**Q180. Your Secret changes aren't reflected in env vars of running pods. What's the right fix?**

<details>
<summary>Show answer</summary>

Env vars are read at start. Trigger a rollout (Reloader, checksum annotation, rollout restart) or switch to mounted files the app re-reads.

</details>

**Q181. You need to give a pod a read-only copy of a large dataset quickly on many nodes. Options?**

<details>
<summary>Show answer</summary>

Bake it into an image (pulled once per node), use a ReadOnlyMany volume or snapshot clones, or fetch from object storage into an emptyDir in an init container.

</details>

**Q182. How do you encrypt PersistentVolumes?**

<details>
<summary>Show answer</summary>

Use StorageClass parameters for provider encryption (e.g. encrypted: "true" with a KMS key on EBS), or encryption features of the storage system. Kubernetes itself doesn't encrypt volumes.

</details>

**Q183. A pod on a dead node holds a ReadWriteOnce volume and the StatefulSet can't recover. What is the safe procedure?**

<details>
<summary>Show answer</summary>

Verify the node is really down (fencing), then apply the node.kubernetes.io/out-of-service taint or delete the node so Kubernetes force-detaches the volume and recreates the pod elsewhere. Never do this if the node might still be writing.

</details>

**Q184. How do you limit storage consumption per team?**

<details>
<summary>Show answer</summary>

ResourceQuota on requests.storage, persistentvolumeclaims count, and per-StorageClass quotas like <class>.storageclass.storage.k8s.io/requests.storage.

</details>

**Q185. Developers want to reset their dev database daily. How?**

<details>
<summary>Show answer</summary>

A CronJob that restores from a known snapshot or seed dump, or recreate the namespace from GitOps with a fresh PVC each day.

</details>

**Q186. An app needs secrets at build time and runtime. How do you keep them out of images?**

<details>
<summary>Show answer</summary>

Use BuildKit secret mounts for build-time secrets (never ARG/ENV), and runtime injection via Secrets or a vault. Scan images for leaked secrets.

</details>

**Q187. How do you audit who read a Secret?**

<details>
<summary>Show answer</summary>

Enable API server audit logging at Metadata or Request level for secrets, ship logs centrally and alert on unusual access.

</details>

**Q188. A Helm chart puts passwords in values.yaml. What do you do?**

<details>
<summary>Show answer</summary>

Pass them from an existing Secret (most charts support existingSecret), or inject via External Secrets/SOPS; never commit plaintext values.

</details>

**Q189. You need a stable hostname per Elasticsearch node. How?**

<details>
<summary>Show answer</summary>

Run it with an operator (ECK) or StatefulSet and headless Service so each node has a stable DNS name and its own PVC.

</details>

**Q190. A StatefulSet update is stuck because one pod won't become ready. What do you do?**

<details>
<summary>Show answer</summary>

With OrderedReady, the update waits on that pod. Fix the pod's issue or roll back the template; in some cases you may need to delete the stuck pod after reverting so it's recreated with the old spec.

</details>

**Q191. How do you handle schema migrations for an app with 10 replicas?**

<details>
<summary>Show answer</summary>

Run migrations once in a Job or hook before the rollout, keep them backward compatible, and use a lock so concurrent replicas don't run them simultaneously.

</details>

**Q192. How do you test disaster recovery for persistent data?**

<details>
<summary>Show answer</summary>

Restore backups regularly into an isolated namespace or cluster, run integrity checks and application smoke tests, and measure actual RPO and RTO.

</details>

**Q193. A local PV node failed. What happens to the data?**

<details>
<summary>Show answer</summary>

It's lost with the node unless the application replicated it elsewhere. Local PVs require application-level replication and quick rebuild procedures.

</details>

**Q194. How do you pass a large JSON config to a pod?**

<details>
<summary>Show answer</summary>

A ConfigMap mounted as a file (up to 1 MiB), or fetch from object storage or a config service at startup for larger data.

</details>

**Q195. You want config to be validated before it reaches pods. How?**

<details>
<summary>Show answer</summary>

Validate in CI (JSON schema, app's own config check), use admission policies for structural rules, and fail fast on startup with clear errors.

</details>

**Q196. Two apps need the same ConfigMap but different subsets. How do you avoid coupling?**

<details>
<summary>Show answer</summary>

Give each app its own ConfigMap (generated from shared sources if needed) so changes to one don't restart or break the other.

</details>

**Q197. How do you inject environment-specific feature flags?**

<details>
<summary>Show answer</summary>

Per-environment ConfigMaps via overlays or values files, or a feature flag service (e.g. OpenFeature-compatible) for runtime changes without redeploys.

</details>

**Q198. Your vault is down. What happens to pods using External Secrets?**

<details>
<summary>Show answer</summary>

Existing Kubernetes Secrets keep working; refreshes fail and new syncs stall. New pods still start if the synced Secret exists. Monitor ExternalSecret status and keep vault HA.

</details>

**Q199. How do you handle per-pod unique configuration in a StatefulSet?**

<details>
<summary>Show answer</summary>

Derive it from the pod's ordinal (hostname) in an init container or entrypoint script, or use the downward API with the pod name.

</details>

**Q200. How do you safely delete a namespace that contains PVCs with important data?**

<details>
<summary>Show answer</summary>

Back up first, switch PVs to Retain, verify backups restore, then delete. Retained PVs can be rebound to new PVCs later.

</details>

---

← [Scenario-Based index](README.md) · [All interview banks](../README.md)

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
