<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# CKS · Certified Kubernetes Security Specialist

Requires an active CKA. The exam is hands-on and security-focused.

## Domains mapped to this repository

| Domain (approximate weight) | Study | Practise |
|---|---|---|
| Cluster Setup (~15%) | [NetworkPolicies](../02-modules/15-network-policies.md), CIS benchmarks with kube-bench, ingress TLS, protecting node metadata | Labs 13, 15 · A058–A060 |
| Cluster Hardening (~15%) | [RBAC](../02-modules/16-rbac-service-accounts.md), ServiceAccount hygiene, [API access](../01-architecture/14-authn-authz-admission.md), upgrades | Lab 16 · A062–A065, A098 |
| System Hardening (~10%) | Minimal OS footprint, IAM least privilege, kernel hardening (seccomp, AppArmor) | [Module 17](../02-modules/17-pod-security-hardening.md) · A067 |
| Minimize Microservice Vulnerabilities (~20%) | [Pod Security Admission](../02-modules/17-pod-security-hardening.md), [secrets management](../02-modules/18-secrets-management.md), RuntimeClass sandboxes, mTLS | Lab 17 · A066, A072–A074, A095 |
| Supply Chain Security (~20%) | Image minimisation, SBOMs, scanning (Trivy), signing and admission verification, static analysis of manifests | A068, A069, A070 |
| Monitoring, Logging and Runtime Security (~20%) | Audit logging, Falco rules, immutable containers, behavioural detection | A071 · [Production Q&A: security](../07-interview-questions/03-production-based/03-security-compliance.md) |

## Must-know security tasks

```bash
# Pod Security
k label ns app pod-security.kubernetes.io/enforce=restricted
# Audit policy: add to kube-apiserver manifest
#   --audit-policy-file=/etc/kubernetes/audit-policy.yaml --audit-log-path=/var/log/kubernetes/audit.log
# Encryption at rest: --encryption-provider-config=/etc/kubernetes/enc.yaml
# AppArmor / seccomp in pod spec
#   securityContext: { seccompProfile: { type: RuntimeDefault }, appArmorProfile: { type: RuntimeDefault } }
trivy image --severity HIGH,CRITICAL nginx:1.27
kube-bench run --targets master
falco -r /etc/falco/falco_rules.local.yaml
```

## Plan

1. Re-read Architecture 14 and Modules 15–18; do Labs 15–17.
2. Work through A066–A074 and A095.
3. Practise editing API server flags in static pod manifests without breaking the control plane (keep a backup copy first).
4. Mock exams, focusing on speed with audit policy, NetworkPolicy and Falco tasks.

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
