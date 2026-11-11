<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Scenario-Based · Networking & Traffic

Questions 51–100 of the scenario-based bank. Answer each one out loud before opening the answer.

---

**Q51. Pod A can't reach Service B by name, but can reach B's pod IP. What do you check?**

<details>
<summary>Show answer</summary>

DNS: from pod A run nslookup/dig for B's name and FQDN, check namespace (use b.<ns> across namespaces), CoreDNS pods and logs, and any egress NetworkPolicy blocking port 53 to kube-dns.

</details>

**Q52. A Service resolves but connections are refused. What's likely wrong?**

<details>
<summary>Show answer</summary>

targetPort doesn't match the container's listening port, or the app listens on 127.0.0.1 instead of 0.0.0.0. Curl the pod IP and port directly to confirm.

</details>

**Q53. Connections to a Service time out instead of being refused. What does that suggest?**

<details>
<summary>Show answer</summary>

Usually a NetworkPolicy dropping packets, a routing/CNI issue between nodes, or an overloaded app. Refused points to port/listen issues; timeouts point to network paths or policies.

</details>

**Q54. You need to expose an internal admin API only inside the VPC on AWS. How?**

<details>
<summary>Show answer</summary>

Use a LoadBalancer Service or Ingress/Gateway with internal scheme annotations (e.g. an internal NLB via the AWS Load Balancer Controller), plus security groups or loadBalancerSourceRanges. Don't expose it publicly.

</details>

**Q55. The app logs show the node IP instead of the client IP. How do you get real client IPs?**

<details>
<summary>Show answer</summary>

Set externalTrafficPolicy Local on the LoadBalancer Service, or have the ingress pass X-Forwarded-For/PROXY protocol, or use LB modes that target pod IPs directly.

</details>

**Q56. You have 30 HTTP services and each has its own LoadBalancer. Costs are high. What do you do?**

<details>
<summary>Show answer</summary>

Put one ingress controller or Gateway behind a single LoadBalancer and route by host and path to ClusterIP Services.

</details>

**Q57. An external partner needs a stable source IP from your cluster for allowlisting. How?**

<details>
<summary>Show answer</summary>

Route egress through a NAT gateway with elastic IPs, or use an egress gateway (Cilium, Calico, Istio) for the specific pods.

</details>

**Q58. Users get 404 from the ingress for a new host. What do you check?**

<details>
<summary>Show answer</summary>

That the Ingress has the right host and path rules, the correct ingressClassName, the DNS record points to the controller's load balancer, and the controller has picked up the resource (its logs and status).

</details>

**Q59. The ingress returns 502 for one backend. What are the likely causes?**

<details>
<summary>Show answer</summary>

Wrong Service port, pods crashing or not listening, protocol mismatch (HTTPS or gRPC backend served as HTTP), or keep-alive issues with backends closing connections. Check controller logs and endpoints.

</details>

**Q60. You need HTTPS for a dozen hostnames with automatic renewal. How?**

<details>
<summary>Show answer</summary>

Install cert-manager with an ACME ClusterIssuer (Let's Encrypt), annotate Ingresses or Gateways, or use a wildcard certificate via DNS-01 for many subdomains.

</details>

**Q61. How do you route traffic for /api to one service and / to another on the same host?**

<details>
<summary>Show answer</summary>

An Ingress rule with two paths using pathType Prefix (more specific first), or an HTTPRoute with PathPrefix matches to different backendRefs.

</details>

**Q62. You want internal testers to reach v2 of a service while everyone else gets v1. How?**

<details>
<summary>Show answer</summary>

Use header-based routing in an HTTPRoute or mesh VirtualService: requests with a header like x-beta: true go to the v2 Service; others go to v1.

</details>

**Q63. A microservice calls an external API by hostname and lookups are slow. How do you speed it up?**

<details>
<summary>Show answer</summary>

Use a fully qualified name with a trailing dot, lower ndots in dnsConfig, deploy NodeLocal DNSCache, and make the client reuse connections.

</details>

**Q64. You must lock down a namespace so only specific flows are allowed. Where do you start?**

<details>
<summary>Show answer</summary>

Apply default-deny ingress and egress, allow DNS, then add explicit policies for each required flow (frontend → api, api → db, monitoring → metrics), testing each with a connectivity matrix.

</details>

**Q65. After applying a default-deny egress policy, an app can't reach the Kubernetes API. How do you fix it?**

<details>
<summary>Show answer</summary>

Allow egress to the API server endpoints (the kubernetes Service's endpoint IPs or control plane CIDR) on 443/6443 for that app's pods only.

</details>

**Q66. You need to block pods from reaching the cloud metadata endpoint. How?**

<details>
<summary>Show answer</summary>

An egress NetworkPolicy ipBlock rule allowing 0.0.0.0/0 except 169.254.169.254/32, plus cloud-level protections like IMDSv2 with hop limit 1 and workload identity.

</details>

**Q67. Pods in namespace monitoring must scrape every namespace. How do you write the policy?**

<details>
<summary>Show answer</summary>

In each namespace, an ingress policy allowing from namespaceSelector matching kubernetes.io/metadata.name: monitoring (optionally AND a podSelector for Prometheus) on the metrics port. Automate it with a policy generator.

</details>

**Q68. A gRPC service behind a Kubernetes Service gets uneven load. Why?**

<details>
<summary>Show answer</summary>

gRPC uses long-lived HTTP/2 connections; kube-proxy balances per connection, so clients pin to a few pods. Use client-side load balancing with a headless Service, a mesh, or an L7 proxy that balances per request.

</details>

**Q69. You need a stable DNS name for an external database that might move to another provider. How?**

<details>
<summary>Show answer</summary>

Create an ExternalName Service (e.g. orders-db) pointing to the provider hostname, or a selector-less Service with manual EndpointSlices for IPs. Apps use the in-cluster name.

</details>

**Q70. Traffic between zones is costing a lot. What can you do?**

<details>
<summary>Show answer</summary>

Enable topology-aware routing or trafficDistribution PreferClose on Services, co-locate chatty services with zone affinity, and spread replicas evenly so each zone has local endpoints.

</details>

**Q71. You must expose a TCP service (not HTTP) to the internet. What do you use?**

<details>
<summary>Show answer</summary>

A LoadBalancer Service, or a Gateway with a TCPRoute if your implementation supports it. Ingress only handles HTTP(S).

</details>

**Q72. A pod needs to talk to another pod directly and consistently, not through load balancing. How?**

<details>
<summary>Show answer</summary>

Use a StatefulSet with a headless Service so each pod has a stable DNS name like db-0.db.ns.svc.cluster.local.

</details>

**Q73. Your NodePort works from inside nodes but not from your laptop. What could block it?**

<details>
<summary>Show answer</summary>

Cloud security groups or firewalls not allowing the NodePort range, nodes without public IPs, or externalTrafficPolicy Local on a node without local pods.

</details>

**Q74. You want zero-trust communication between services with identity, not IPs. What do you use?**

<details>
<summary>Show answer</summary>

A service mesh with mTLS and identity-based authorization policies (SPIFFE identities from ServiceAccounts), or Cilium identity-aware policies.

</details>

**Q75. Requests through the ingress time out after 60 seconds for a long report endpoint. How do you fix it?**

<details>
<summary>Show answer</summary>

Increase the controller's backend/read timeouts for that route (HTTPRoute timeouts or controller-specific settings) and also the cloud LB idle timeout, or make the endpoint asynchronous.

</details>

**Q76. You need to migrate from one ingress controller to another with no downtime. How?**

<details>
<summary>Show answer</summary>

Install the new controller with its own load balancer and IngressClass, duplicate routes for the new class, test via the new LB address, then shift DNS gradually (weighted records), and remove the old controller after traffic drains.

</details>

**Q77. Two teams want the same hostname on a shared gateway. How do you prevent conflicts?**

<details>
<summary>Show answer</summary>

Use Gateway API listeners with hostname restrictions and allowedRoutes by namespace label, so each team can only attach routes for its own hostnames.

</details>

**Q78. A Service of type LoadBalancer stays pending on a bare-metal cluster. Why and how do you fix it?**

<details>
<summary>Show answer</summary>

No cloud controller provisions load balancers there. Install MetalLB, kube-vip or Cilium LB IPAM with BGP/L2 announcements.

</details>

**Q79. Your app works with kubectl port-forward but not through the Service. Why?**

<details>
<summary>Show answer</summary>

port-forward goes straight to a pod, bypassing Service selectors and kube-proxy. Check the Service selector, targetPort, endpoints and NetworkPolicies.

</details>

**Q80. Some requests fail with DNS timeouts of exactly 5 seconds. What do you suspect?**

<details>
<summary>Show answer</summary>

The UDP conntrack race for parallel A/AAAA lookups. Mitigate with NodeLocal DNSCache, single-request-reopen options, or TCP DNS.

</details>

**Q81. You want to see all network flows denied by policies. How?**

<details>
<summary>Show answer</summary>

Use CNI observability: Cilium Hubble (`hubble observe --verdict DROPPED`) or Calico flow logs. The core API has no logging.

</details>

**Q82. How do you let pods in namespace A call only a specific service in namespace B?**

<details>
<summary>Show answer</summary>

In namespace B, an ingress policy on the target pods allowing from namespaceSelector (A) AND podSelector (the caller labels) on the needed port. In A, an egress policy allowing to B's pods if egress is restricted.

</details>

**Q83. An app needs to reach a legacy VM by a Kubernetes service name. How?**

<details>
<summary>Show answer</summary>

Create a selector-less Service and an EndpointSlice with the VM's IP and port, labelled kubernetes.io/service-name.

</details>

**Q84. You want to mirror production traffic to a new version without affecting users. How?**

<details>
<summary>Show answer</summary>

Use request mirroring in Gateway API (RequestMirror filter) or a service mesh; mirrored responses are discarded.

</details>

**Q85. The cluster DNS is overloaded during traffic peaks. What do you do?**

<details>
<summary>Show answer</summary>

Scale CoreDNS (autoscaler), add NodeLocal DNSCache, reduce ndots-driven queries, tune cache, and spread CoreDNS across nodes with a PDB.

</details>

**Q86. Your service mesh sidecars add latency. How do you evaluate alternatives?**

<details>
<summary>Show answer</summary>

Measure p50/p99 with and without the mesh, consider sidecarless modes (Istio ambient, Cilium), limit L7 processing to services that need it, and review whether mTLS-only needs can be met by a lighter tool.

</details>

**Q87. How do you expose a service on a custom domain in a kind or minikube lab?**

<details>
<summary>Show answer</summary>

Install an ingress controller mapped to host ports, use a hosts-file entry or nip.io/sslip.io wildcard DNS, and route by Host header.

</details>

**Q88. Pods can reach each other on the same node but not across nodes. What do you check?**

<details>
<summary>Show answer</summary>

CNI health on both nodes, overlay ports (VXLAN UDP 4789, BGP 179, IPIP) in firewalls/security groups, pod CIDR routing, and MTU.

</details>

**Q89. You need to rate limit an API exposed through the cluster. Where do you implement it?**

<details>
<summary>Show answer</summary>

At the edge: ingress controller or Gateway rate-limit policies, an API gateway, or mesh rate limiting. Back it with app-level protection for expensive endpoints.

</details>

**Q90. How do you test that NetworkPolicies behave as intended before production?**

<details>
<summary>Show answer</summary>

Run a connectivity matrix test in CI against a kind cluster with the same CNI (tools like netassert or custom curl jobs), and review policies with visualisation tools.

</details>

**Q91. A Service with sessionAffinity ClientIP still spreads one user's requests. Why?**

<details>
<summary>Show answer</summary>

Clients behind a NAT or proxy may appear with different IPs, or the ingress controller connects from its own pods, so affinity at the Service sees the ingress pod IP. Use cookie-based affinity at the ingress or mesh.

</details>

**Q92. You need private connectivity from the cluster to a managed database without the internet. How?**

<details>
<summary>Show answer</summary>

Use VPC-private endpoints/private link or peering, place nodes in private subnets, and allow egress to the database CIDR in NetworkPolicies.

</details>

**Q93. An external client needs to reach individual Kafka brokers running in Kubernetes. How?**

<details>
<summary>Show answer</summary>

Give each broker its own external listener: one LoadBalancer or NodePort per broker (or an ingress with SNI routing), advertised addresses per broker, via the Kafka operator's external listener configuration.

</details>

**Q94. How do you handle IPv6 requirements in Kubernetes?**

<details>
<summary>Show answer</summary>

Run a dual-stack cluster with a CNI supporting IPv6, configure pod and service CIDRs for both families, and set ipFamilyPolicy on Services.

</details>

**Q95. How do you restrict which namespaces can create LoadBalancer Services?**

<details>
<summary>Show answer</summary>

Use ResourceQuota services.loadbalancers: 0 in namespaces that shouldn't, or an admission policy denying type LoadBalancer outside approved namespaces.

</details>

**Q96. How do you debug network issues inside a pod that has no tools?**

<details>
<summary>Show answer</summary>

Use `kubectl debug` with a netshoot image targeting the container, or run tcpdump on the node in the pod's network namespace.

</details>

**Q97. You need to give a pod a fixed IP. Is that possible?**

<details>
<summary>Show answer</summary>

Not natively, and it's generally an anti-pattern. Use a Service or DNS for stable addressing. Some CNIs support static IP annotations (Calico IP reservations) for special cases.

</details>

**Q98. Your ingress must support WebSockets. What do you check?**

<details>
<summary>Show answer</summary>

Most controllers support WebSockets but need adequate idle/read timeouts and HTTP/1.1 upgrade handling; also check the cloud LB idle timeout.

</details>

**Q99. How would you restrict ingress so only traffic from your CDN reaches the cluster?**

<details>
<summary>Show answer</summary>

Use loadBalancerSourceRanges or security groups limited to CDN IP ranges, and validate a secret header or mTLS from the CDN at the gateway.

</details>

**Q100. A team asks for a public hostname for their dev environment. How do you provide it safely?**

<details>
<summary>Show answer</summary>

Route through the shared gateway with a dev subdomain, add authentication (OIDC proxy or basic auth), restrict source IPs, and set quotas on the namespace.

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
