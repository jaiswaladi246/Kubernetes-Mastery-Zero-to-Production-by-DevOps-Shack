<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Troubleshooting · Control Plane, Auth & API

Questions 151–200 of the troubleshooting bank. Answer each one out loud before opening the answer.

---

**Q151. kubectl says "The connection to the server localhost:8080 was refused". Why?**

<details>
<summary>Show answer</summary>

No kubeconfig is loaded, so kubectl falls back to localhost:8080. Set KUBECONFIG or create ~/.kube/config.

</details>

**Q152. kubectl returns "Unable to connect to the server: dial tcp ... i/o timeout". What do you check?**

<details>
<summary>Show answer</summary>

Network path to the API endpoint: VPN, private endpoint access, IP allowlists, security groups and the load balancer in front of the API servers.

</details>

**Q153. kubectl returns "You must be logged in to the server (Unauthorized)". Fix?**

<details>
<summary>Show answer</summary>

Credentials are invalid or expired: refresh OIDC login, update cloud credentials (aws eks update-kubeconfig), or renew expired client certificates.

</details>

**Q154. kubectl returns "x509: certificate signed by unknown authority". Fix?**

<details>
<summary>Show answer</summary>

The kubeconfig's CA data doesn't match the API server's CA (wrong cluster, rotated CA, or proxy interception). Update the kubeconfig.

</details>

**Q155. kubectl returns "x509: certificate has expired". What do you do on a kubeadm cluster?**

<details>
<summary>Show answer</summary>

Check `kubeadm certs check-expiration`, renew with `kubeadm certs renew all`, restart control plane static pods and update admin.conf.

</details>

**Q156. Users get 403 Forbidden for an action. How do you debug?**

<details>
<summary>Show answer</summary>

Read the error (user, verb, resource, group, namespace), test with `kubectl auth can-i --as`, then find or create the right Role/RoleBinding, checking subject names and apiGroups.

</details>

**Q157. A ServiceAccount can't list pods despite a RoleBinding. Why?**

<details>
<summary>Show answer</summary>

The binding's subject namespace or name is wrong, the Role is in a different namespace, or the rule's apiGroups/resources/verbs don't match.

</details>

**Q158. An OIDC user's group permissions don't apply. Why?**

<details>
<summary>Show answer</summary>

The groups claim isn't configured or mapped, or group prefixes are applied (oidc:), so the binding name must include the prefix. Inspect `kubectl auth whoami`.

</details>

**Q159. The API server is slow and kubectl commands take 10+ seconds. What do you check?**

<details>
<summary>Show answer</summary>

API server latency metrics, APF rejections, etcd latency, slow admission webhooks and heavy clients in audit logs.

</details>

**Q160. Requests fail with "429 Too Many Requests". Why?**

<details>
<summary>Show answer</summary>

API Priority and Fairness is rejecting requests for a saturated priority level. Find the noisy client and reduce its load, or tune flow schemas.

</details>

**Q161. Requests fail with "etcdserver: request timed out". What next?**

<details>
<summary>Show answer</summary>

Check etcd health and latency (disk fsync, network), leader changes, DB size and quorum.

</details>

**Q162. etcd reports "mvcc: database space exceeded". How do you recover?**

<details>
<summary>Show answer</summary>

Get the current revision, compact, defragment all members, disarm the NOSPACE alarm, and raise the quota or reduce data growth.

</details>

**Q163. etcd has frequent leader elections. Cause?**

<details>
<summary>Show answer</summary>

Slow disks (high fsync latency), network latency or packet loss between members, or CPU starvation on etcd nodes.

</details>

**Q164. One etcd member is unhealthy. How do you replace it?**

<details>
<summary>Show answer</summary>

Remove the member with etcdctl member remove, clean its data directory, add it back with member add and start it with the correct initial-cluster settings.

</details>

**Q165. The API server pod is CrashLooping on a kubeadm control plane. How do you debug?**

<details>
<summary>Show answer</summary>

Use crictl ps and crictl logs on the node, check the static pod manifest for typos or wrong flags, certificate paths and etcd connectivity.

</details>

**Q166. The scheduler isn't scheduling any pods. What do you check?**

<details>
<summary>Show answer</summary>

kube-scheduler pod health and logs, leader election lease, its connectivity to the API server and RBAC.

</details>

**Q167. Controllers aren't creating pods for new ReplicaSets. Why?**

<details>
<summary>Show answer</summary>

kube-controller-manager down or not leader, quota or admission blocking pods (check RS events), or API server issues.

</details>

**Q168. Every pod creation fails with "failed calling webhook". What do you do?**

<details>
<summary>Show answer</summary>

Identify the webhook from the message; check its Service endpoints and pods; if it's down and failurePolicy Fail, restore it or temporarily set failurePolicy Ignore or exclude namespaces.

</details>

**Q169. A webhook fails with "x509: certificate signed by unknown authority". Fix?**

<details>
<summary>Show answer</summary>

The webhook configuration's caBundle doesn't match the serving certificate. Re-inject the CA (cert-manager cainjector) or update caBundle.

</details>

**Q170. Namespace deletion hangs with "DiscoveryFailed". Fix?**

<details>
<summary>Show answer</summary>

An APIService (often metrics.k8s.io) is unavailable. Restore the backing service or delete the stale APIService, then deletion continues.

</details>

**Q171. A namespace is stuck Terminating due to a custom resource with a finalizer. What do you do?**

<details>
<summary>Show answer</summary>

Reinstall or fix the operator that owns the finalizer so it can clean up; as last resort, remove the finalizer after handling external cleanup manually.

</details>

**Q172. kubectl apply fails with "no matches for kind X in version Y". Why?**

<details>
<summary>Show answer</summary>

The API version was removed or the CRD isn't installed. Update the manifest's apiVersion or install the CRD first.

</details>

**Q173. kubectl apply fails with "metadata.annotations: Too long". Why?**

<details>
<summary>Show answer</summary>

Client-side apply stores last-applied-configuration in an annotation with a size limit; large objects (big CRDs, ConfigMaps) exceed it. Use server-side apply or kubectl create/replace.

</details>

**Q174. kubectl apply fails with "field is immutable". Common examples and fix?**

<details>
<summary>Show answer</summary>

Deployment selectors, Job templates, Service clusterIP, PVC storageClassName. Delete and recreate the object (planning for impact) or create a new one.

</details>

**Q175. Server-side apply reports field conflicts. What do you do?**

<details>
<summary>Show answer</summary>

Another manager owns those fields. Coordinate ownership, remove the field from one manager, or use --force-conflicts deliberately to take ownership.

</details>

**Q176. Argo CD shows an app OutOfSync immediately after syncing. Why?**

<details>
<summary>Show answer</summary>

Fields mutated by controllers or webhooks (defaults, injected sidecars, HPA replicas) differ from Git. Configure ignoreDifferences, server-side diff, or set the fields explicitly.

</details>

**Q177. Argo CD sync fails with "the server could not find the requested resource". Why?**

<details>
<summary>Show answer</summary>

The manifest uses a CRD that isn't installed yet or an API removed in this cluster version. Order CRDs with sync waves or update API versions.

</details>

**Q178. Flux Kustomization shows "dependency not ready". Fix?**

<details>
<summary>Show answer</summary>

A dependsOn Kustomization or HelmRelease is failing. Fix that dependency first; check `flux get all` for errors.

</details>

**Q179. Helm install fails with "rendered manifests contain a resource that already exists". Fix?**

<details>
<summary>Show answer</summary>

The resource exists outside this release. Adopt it by adding Helm ownership labels/annotations, delete it, or rename.

</details>

**Q180. Helm reports "UPGRADE FAILED: another operation is in progress". Fix?**

<details>
<summary>Show answer</summary>

The release is stuck in a pending state. Roll back to the last deployed revision; in rare cases, remove the stuck release Secret carefully.

</details>

**Q181. A user can create Deployments but they never produce pods due to "forbidden: exceeded quota". Fix?**

<details>
<summary>Show answer</summary>

Resource requests exceed the namespace quota, or pods lack requests where quota requires them. Adjust requests, add LimitRange defaults, or raise the quota.

</details>

**Q182. Pods are rejected with "must specify limits.memory" in a namespace. Why?**

<details>
<summary>Show answer</summary>

A ResourceQuota on limits.memory requires every container to set a memory limit. Add limits or a LimitRange default.

</details>

**Q183. Audit logs show a ServiceAccount listing all secrets cluster-wide. What do you do?**

<details>
<summary>Show answer</summary>

Treat it as a potential compromise: find which workload uses the SA, revoke or reduce its permissions, rotate exposed secrets, and investigate how it got those rights.

</details>

**Q184. The cluster's API endpoint is reachable but kube-system pods are failing after a cloud outage. Where do you start?**

<details>
<summary>Show answer</summary>

Check nodes, CNI and CoreDNS first (foundational), then storage drivers and ingress; review events across kube-system ordered by time.

</details>

**Q185. Leader election for a controller keeps flapping. Why?**

<details>
<summary>Show answer</summary>

API server latency, clock skew, network issues or resource starvation causing missed lease renewals.

</details>

**Q186. CoreDNS can't list Services: "forbidden". Why?**

<details>
<summary>Show answer</summary>

Its ClusterRole or binding was removed or modified. Restore the system:coredns RBAC.

</details>

**Q187. Admission is rejecting pods due to a Kyverno policy you didn't expect. How do you find the rule?**

<details>
<summary>Show answer</summary>

The error message names the policy and rule; check `kubectl get policyreports` and the ClusterPolicy definition, and test with kyverno CLI.

</details>

**Q188. The API server rejects requests with "request entity too large". Why?**

<details>
<summary>Show answer</summary>

Object exceeds size limits (ConfigMap/Secret 1 MiB, etcd request limit). Split data or move it elsewhere.

</details>

**Q189. kubectl exec fails with "error dialing backend: dial tcp <node-ip>:10250: i/o timeout". Why?**

<details>
<summary>Show answer</summary>

The API server can't reach the kubelet port on that node: firewall/security group blocks 10250, or the node network is broken.

</details>

**Q190. kubectl logs fails with "x509: certificate is valid for ..., not <node-ip>". Fix?**

<details>
<summary>Show answer</summary>

The kubelet serving certificate doesn't include the node's IP/hostname. Enable serving certificate rotation with approved CSRs or regenerate the certificate.

</details>

**Q191. Cluster DNS was changed and now the API server can't reach webhooks by Service name. Why?**

<details>
<summary>Show answer</summary>

The API server resolves webhook Services through its own path (Service IP routing), so kube-proxy or routing on control plane nodes may be broken. Check connectivity from control plane nodes.

</details>

**Q192. After restoring etcd, some pods exist in the API but not on nodes, or vice versa. What happens?**

<details>
<summary>Show answer</summary>

Controllers reconcile: the kubelet removes containers not in its assigned pods and starts missing ones. Expect churn; verify critical workloads and reconcile GitOps.

</details>

**Q193. Your kubeadm join fails with "couldn't validate the identity of the API Server". Fix?**

<details>
<summary>Show answer</summary>

The discovery-token-ca-cert-hash doesn't match or the endpoint is wrong. Get the correct hash and command with `kubeadm token create --print-join-command`.

</details>

**Q194. The metrics APIService shows "FailedDiscoveryCheck". Impact and fix?**

<details>
<summary>Show answer</summary>

kubectl top, HPA and namespace deletion can break. Fix metrics-server pods, networking from API server to metrics-server, or its TLS flags.

</details>

**Q195. A user impersonation request fails with "cannot impersonate". Why?**

<details>
<summary>Show answer</summary>

The caller lacks the impersonate verb on users/groups/serviceaccounts. Grant it only to trusted admins.

</details>

**Q196. Audit logging stopped after an API server flag change. How do you verify?**

<details>
<summary>Show answer</summary>

Check the API server manifest for audit-policy-file and audit-log-path flags, mounted volumes for the policy and log paths, and API server logs for audit errors.

</details>

**Q197. Pods can't get ServiceAccount tokens: "serviceaccount not found". Fix?**

<details>
<summary>Show answer</summary>

Create the referenced ServiceAccount in the namespace or fix serviceAccountName.

</details>

**Q198. An API request returns 410 Gone in a client's watch. What does it mean?**

<details>
<summary>Show answer</summary>

The requested resourceVersion has been compacted. The client must re-list and start a new watch; informers handle this automatically.

</details>

**Q199. kubectl is slow only for one cluster with many CRDs. Why?**

<details>
<summary>Show answer</summary>

Discovery of many API groups takes time; kubectl caches discovery in ~/.kube/cache. Ensure caching works and the API server isn't overloaded by discovery requests.

</details>

**Q200. After a control plane upgrade, some controllers fail with "the server doesn't have a resource type". Why?**

<details>
<summary>Show answer</summary>

They use API versions removed in the new release. Upgrade those controllers to versions using current APIs.

</details>

---

← [Troubleshooting index](README.md) · [All interview banks](../README.md)

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
