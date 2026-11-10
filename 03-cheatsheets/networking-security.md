<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Cheat Sheet · Networking & Security

## Service quick reference

| Type | Access | Key fields |
|---|---|---|
| ClusterIP | In-cluster | `port`, `targetPort`, `selector` |
| NodePort | `nodeIP:30000-32767` | `nodePort` |
| LoadBalancer | External LB | `externalTrafficPolicy`, `loadBalancerSourceRanges`, provider annotations |
| Headless | DNS → pod IPs | `clusterIP: None` |
| ExternalName | DNS CNAME | `externalName` |

## DNS names

| Target | Name |
|---|---|
| Service | `svc.ns.svc.cluster.local` |
| StatefulSet pod | `pod-N.headless-svc.ns.svc.cluster.local` |
| SRV for named port | `_port._tcp.svc.ns.svc.cluster.local` |
| Pod by IP (if enabled) | `10-244-1-5.ns.pod.cluster.local` |

## Ports to know

| Port | Component |
|---|---|
| 6443 | kube-apiserver |
| 2379-2380 | etcd client / peer |
| 10250 | kubelet API |
| 10257 / 10259 | controller-manager / scheduler (secure) |
| 30000-32767 | NodePort range |
| 53 UDP/TCP | CoreDNS |
| 4789 UDP | VXLAN |
| 179 TCP | BGP (Calico) |

## NetworkPolicy patterns

| Need | Pattern |
|---|---|
| Lock a namespace | `podSelector: {}` + `policyTypes: [Ingress, Egress]`, no rules |
| Allow DNS | egress to kube-system `k8s-app: kube-dns` UDP+TCP 53 |
| Allow from namespace | `namespaceSelector: { matchLabels: { kubernetes.io/metadata.name: X } }` |
| Pod in namespace (AND) | namespaceSelector **and** podSelector in the **same** `from` item |
| Either (OR) | separate `from` items |
| Block metadata API | egress `ipBlock` `0.0.0.0/0` `except: [169.254.169.254/32]` |

## securityContext reference

| Field | Level | Recommended |
|---|---|---|
| `runAsNonRoot` | pod/container | `true` |
| `runAsUser` / `runAsGroup` | pod/container | non-zero UID/GID |
| `fsGroup` | pod | group owning volumes |
| `fsGroupChangePolicy` | pod | `OnRootMismatch` for big volumes |
| `seccompProfile.type` | pod/container | `RuntimeDefault` |
| `allowPrivilegeEscalation` | container | `false` |
| `readOnlyRootFilesystem` | container | `true` |
| `capabilities.drop` | container | `["ALL"]` |
| `privileged` | container | `false` |
| `hostNetwork/hostPID/hostIPC` | pod | `false` |
| `hostUsers` | pod | `false` (user namespaces) |

## Pod Security levels

| Label | Values |
|---|---|
| `pod-security.kubernetes.io/enforce` | privileged / baseline / restricted |
| `pod-security.kubernetes.io/warn` | same |
| `pod-security.kubernetes.io/audit` | same |
| `pod-security.kubernetes.io/enforce-version` | `latest` or `v1.xx` |

## RBAC verbs

`get` `list` `watch` `create` `update` `patch` `delete` `deletecollection` · special: `bind` `escalate` `impersonate` `use` (PSP-era), `approve` (CSRs) · subresources: `pods/log` `pods/exec` `pods/portforward` `deployments/scale` `*/status`

## Security tools

| Purpose | Tools |
|---|---|
| Image scanning | Trivy, Grype, Docker Scout |
| SBOM | Syft, Trivy |
| Signing / verification | cosign, Kyverno verifyImages, Sigstore policy-controller |
| Manifest linting | kube-linter, Checkov, kubesec, Polaris |
| Cluster posture | kube-bench (CIS), Kubescape, Trivy Operator |
| Policy | Pod Security Admission, ValidatingAdmissionPolicy, Kyverno, Gatekeeper |
| Runtime | Falco, Tetragon, KubeArmor |
| Secrets | External Secrets, Sealed Secrets, SOPS, Vault, Secrets Store CSI |
| RBAC analysis | rbac-tool, who-can, rakkess, KubiScan |

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
