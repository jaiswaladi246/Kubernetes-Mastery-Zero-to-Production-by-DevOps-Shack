<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Production-Based · Security & Compliance at Scale

Questions 101–150 of the production-based bank. Answer each one out loud before opening the answer.

---

**Q101. How do you secure a Kubernetes cluster end to end?**

<details>
<summary>Show answer</summary>

Private API endpoint with SSO and least-privilege RBAC, audit logging, etcd encryption with KMS, Pod Security restricted, admission policies, NetworkPolicies default deny, workload identity, secrets from a vault, supply chain security (scan, sign, verify), runtime detection, patched nodes and regular posture scans.

</details>

**Q102. How do you implement least privilege for workloads?**

<details>
<summary>Show answer</summary>

Dedicated ServiceAccounts with minimal RBAC (often none), token automount disabled when unused, workload identity scoped per app, NetworkPolicies limiting traffic, and secrets scoped per app.

</details>

**Q103. How do you approach supply chain security for container images?**

<details>
<summary>Show answer</summary>

Minimal trusted bases, reproducible CI builds, vulnerability scanning with gates, SBOM generation, signing and provenance attestations (SLSA), admission verification, and continuous rescanning of running images.

</details>

**Q104. What's your policy-as-code strategy?**

<details>
<summary>Show answer</summary>

Start with Pod Security Admission, add ValidatingAdmissionPolicy for simple rules and Kyverno or Gatekeeper for richer policies, deploy in audit mode first, measure violations, then enforce with documented exceptions.

</details>

**Q105. How do you handle multi-tenant security in a shared cluster?**

<details>
<summary>Show answer</summary>

Namespace isolation with RBAC, quotas, network policies, Pod Security restricted, separate node pools or sandboxed runtimes for untrusted workloads, and restricted cluster-scoped permissions.

</details>

**Q106. How do you secure secrets in production?**

<details>
<summary>Show answer</summary>

External secret manager as source of truth, External Secrets or CSI driver delivery, encryption at rest with KMS, tight RBAC on secrets, audit logging, rotation, and no secrets in Git, images or logs.

</details>

**Q107. How do you control who can exec into production pods?**

<details>
<summary>Show answer</summary>

Restrict pods/exec via RBAC to on-call groups, require just-in-time access, log exec through audit logs, and alert on exec into sensitive namespaces.

</details>

**Q108. How do you protect against container escapes?**

<details>
<summary>Show answer</summary>

Non-root, no privileged containers, dropped capabilities, seccomp RuntimeDefault, AppArmor/SELinux, user namespaces, patched kernels, and sandboxed runtimes for untrusted code.

</details>

**Q109. How do you ensure compliance (e.g. PCI, SOC 2) on Kubernetes?**

<details>
<summary>Show answer</summary>

Map controls to technical measures (RBAC, encryption, logging, network segmentation, vulnerability management), automate evidence with policy reports and audit logs, isolate in-scope workloads, and run continuous posture scans.

</details>

**Q110. How do you handle security patches for Kubernetes itself?**

<details>
<summary>Show answer</summary>

Track security announcements, keep within supported versions, apply patch releases promptly (managed providers often auto-patch), and upgrade nodes regularly.

</details>

**Q111. How do you audit cluster activity?**

<details>
<summary>Show answer</summary>

An audit policy capturing metadata for most requests and full bodies for sensitive ones, shipped to tamper-resistant storage with alerts for suspicious actions (secret reads, RBAC changes, exec, privileged pods).

</details>

**Q112. What alerts would you set for security?**

<details>
<summary>Show answer</summary>

New cluster-admin bindings, privileged pod creation, exec into production, secret access by unusual identities, policy violations, runtime detections (shells, crypto mining), and image signature failures.

</details>

**Q113. How do you implement network segmentation?**

<details>
<summary>Show answer</summary>

Default-deny NetworkPolicies per namespace, explicit allows per flow, cluster-wide guardrails (AdminNetworkPolicy or CNI global policies), egress control, and segmented node pools for sensitive workloads.

</details>

**Q114. How do you handle vulnerabilities found in running images?**

<details>
<summary>Show answer</summary>

Continuous scanning in-cluster or in the registry, triage by severity and exploitability, rebuild and redeploy patched images, track SLAs for fixes, and document accepted risks.

</details>

**Q115. How do you secure CI/CD pipelines that deploy to Kubernetes?**

<details>
<summary>Show answer</summary>

GitOps pull model, OIDC federation instead of static credentials, least-privilege tokens, protected branches and reviews, signed artifacts, and isolated runners.

</details>

**Q116. How do you secure the kubelet?**

<details>
<summary>Show answer</summary>

Disable anonymous auth, use webhook authorization, enable certificate rotation, disable the read-only port, NodeRestriction admission, and restrict network access to port 10250.

</details>

**Q117. How do you protect cloud metadata endpoints from pods?**

<details>
<summary>Show answer</summary>

IMDSv2 with hop limit 1 (AWS), metadata concealment or workload identity on other clouds, and egress NetworkPolicies blocking 169.254.169.254.

</details>

**Q118. How do you handle security for operators and third-party controllers?**

<details>
<summary>Show answer</summary>

Review their RBAC (avoid cluster-admin), run them in dedicated namespaces, pin versions, scan images, and monitor their API usage.

</details>

**Q119. How do you approach runtime security monitoring?**

<details>
<summary>Show answer</summary>

Deploy Falco or Tetragon with tuned rules, forward alerts to SIEM, define response playbooks, and periodically test detections.

</details>

**Q120. How do you enforce image provenance across all clusters?**

<details>
<summary>Show answer</summary>

Central signing policy with cosign keyless and Rekor transparency logs, admission verification policies distributed by GitOps to every cluster, and alerts on verification failures.

</details>

**Q121. How do you manage RBAC drift?**

<details>
<summary>Show answer</summary>

RBAC in Git applied by GitOps with self-heal, periodic access reviews, and detection of manually created bindings.

</details>

**Q122. How do you isolate highly sensitive workloads?**

<details>
<summary>Show answer</summary>

Dedicated clusters or dedicated node pools with taints, sandboxed runtimes, strict network policies, separate cloud accounts or projects, and tighter access controls.

</details>

**Q123. How do you handle Kubernetes Secrets in etcd backups?**

<details>
<summary>Show answer</summary>

Backups contain secrets (encrypted only if encryption at rest was on), so encrypt backup files, restrict access tightly, and keep encryption keys separate from backups.

</details>

**Q124. How do you prevent privilege escalation through RBAC?**

<details>
<summary>Show answer</summary>

Avoid granting bind, escalate, impersonate, wildcard verbs, pod creation in sensitive namespaces and webhook management to non-admins; audit with tools that detect escalation paths.

</details>

**Q125. What's your stance on running privileged DaemonSets?**

<details>
<summary>Show answer</summary>

Only for vetted infrastructure (CNI, CSI, security agents) in dedicated namespaces with restricted RBAC, pinned versions and monitoring; never for application workloads.

</details>

**Q126. How do you ensure secure defaults for developers?**

<details>
<summary>Show answer</summary>

Golden path templates (Helm charts, Kustomize bases) with hardened securityContext, probes, resources and policies; admission policies to catch deviations; and docs with examples.

</details>

**Q127. How do you respond to a compromised node?**

<details>
<summary>Show answer</summary>

Cordon and isolate it (security groups), preserve evidence (disk snapshot, logs), drain or delete workloads, rotate credentials accessible from the node (kubelet, workload identities), replace the node and investigate the entry point.

</details>

**Q128. How do you secure ingress endpoints?**

<details>
<summary>Show answer</summary>

TLS everywhere with automated certs, WAF and rate limiting at the edge, authentication for internal tools, security headers, and restricting source IPs for admin endpoints.

</details>

**Q129. What's your approach to identity for humans accessing many clusters?**

<details>
<summary>Show answer</summary>

Central SSO with OIDC, group-based RBAC templates applied by GitOps, short-lived credentials, and tooling to switch clusters safely.

</details>

**Q130. How do you use admission policies without slowing developers down?**

<details>
<summary>Show answer</summary>

Clear error messages with fix guidance, warn mode before enforce, policy checks in CI so issues appear before deploy, and fast exception processes.

</details>

**Q131. How do you protect against malicious or vulnerable Helm charts from the internet?**

<details>
<summary>Show answer</summary>

Mirror and vet charts internally, pin versions and digests, scan rendered manifests, and apply admission policies regardless of source.

</details>

**Q132. How do you approach encryption in transit inside the cluster?**

<details>
<summary>Show answer</summary>

Mesh mTLS or application TLS for sensitive traffic, encrypted CNI options (WireGuard/IPsec in Cilium or Calico), and TLS for etcd and control plane components (default in kubeadm).

</details>

**Q133. What is SPIFFE/SPIRE and why use it?**

<details>
<summary>Show answer</summary>

A standard and implementation for workload identity that issues short-lived cryptographic identities (SVIDs) to workloads across platforms, enabling mTLS and authorization without static secrets.

</details>

**Q134. How do you secure access to etcd in a managed service?**

<details>
<summary>Show answer</summary>

You don't access it directly; providers manage it. Focus on API access controls, secrets encryption with customer-managed keys, and audit logging.

</details>

**Q135. How do you prevent data exfiltration from pods?**

<details>
<summary>Show answer</summary>

Egress restrictions with allowlists, egress gateways with logging, DLP at proxies, least-privilege cloud permissions, and monitoring unusual egress volumes.

</details>

**Q136. How do you manage security for GPU or AI workloads?**

<details>
<summary>Show answer</summary>

Isolate GPU pools, restrict model and data access with workload identity, scan model-serving images, protect endpoints with authentication and rate limits, and monitor for abuse.

</details>

**Q137. How do you keep track of which images run in production?**

<details>
<summary>Show answer</summary>

Inventory from the API (images in running pods) correlated with SBOMs and scan results in dashboards, plus admission logs.

</details>

**Q138. How do you secure Argo CD itself?**

<details>
<summary>Show answer</summary>

SSO with RBAC per project, restrict cluster credentials, disable admin user, limit repositories and destinations per AppProject, enable audit, and keep it patched.

</details>

**Q139. What's the risk of long-lived ServiceAccount token Secrets and how do you avoid them?**

<details>
<summary>Show answer</summary>

They never expire and leak easily. Use projected short-lived tokens (default for pods), TokenRequest for external use with short durations, or OIDC federation.

</details>

**Q140. How do you ensure workloads can't reach other tenants' databases?**

<details>
<summary>Show answer</summary>

Network policies and cloud security groups per tenant, separate credentials per tenant from a vault, workload identity bound to tenant ServiceAccounts, and private endpoints.

</details>

**Q141. How do you detect misconfigurations continuously?**

<details>
<summary>Show answer</summary>

Posture scanners (Kubescape, Trivy Operator, Polaris) on schedules, policy reports, and dashboards tracking violations over time.

</details>

**Q142. How do you approach a security incident in a cluster?**

<details>
<summary>Show answer</summary>

Contain (isolate workloads, revoke credentials), preserve evidence (audit logs, pod and node snapshots), eradicate (patch, rebuild), recover via GitOps, then review and harden.

</details>

**Q143. How do you control access to sensitive logs?**

<details>
<summary>Show answer</summary>

Separate log indices or tenants per namespace or team, RBAC in the logging backend, redaction of secrets and PII at ingestion.

</details>

**Q144. How do you secure webhook endpoints called by the API server?**

<details>
<summary>Show answer</summary>

TLS with a CA bundle (cert-manager CA injection), restrict network access to the webhook pods, authenticate the API server if needed, and keep webhooks minimal and fast.

</details>

**Q145. How do you prevent configuration of host namespaces?**

<details>
<summary>Show answer</summary>

Pod Security baseline or restricted blocks hostNetwork, hostPID and hostIPC; grant exceptions only in system namespaces.

</details>

**Q146. How do you handle user namespaces in production?**

<details>
<summary>Show answer</summary>

Use hostUsers false where supported to map container root to an unprivileged host UID, test workload compatibility (file ownership, volumes), and roll out gradually.

</details>

**Q147. How do you ensure the platform meets data residency rules?**

<details>
<summary>Show answer</summary>

Region-specific clusters, storage classes bound to regions, policies preventing workloads with restricted data from running elsewhere, and backups stored in-region.

</details>

**Q148. How do you review security of a new workload before production?**

<details>
<summary>Show answer</summary>

Threat model, review manifests against policies, image scan and SBOM, RBAC and network requirements, secrets handling, and a production readiness review including security sign-off.

</details>

**Q149. What's your approach to securing the Kubernetes dashboard or internal tools?**

<details>
<summary>Show answer</summary>

Avoid exposure; put behind SSO proxies with MFA, per-user RBAC, network restrictions and audit logs.

</details>

**Q150. How do you secure DNS in the cluster?**

<details>
<summary>Show answer</summary>

Protect CoreDNS config changes with RBAC, restrict egress so pods use cluster DNS, monitor for unusual query patterns (exfiltration via DNS), and consider DNS policies in CNIs.

</details>

---

← [Production-Based index](README.md) · [All interview banks](../README.md)

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
