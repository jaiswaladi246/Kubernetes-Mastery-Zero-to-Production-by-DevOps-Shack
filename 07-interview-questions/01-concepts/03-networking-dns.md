<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Concept-Based · Networking, Services & DNS

Questions 101–150 of the concept-based bank. Answer each one out loud before opening the answer.

---

**Q101. What are the rules of the Kubernetes network model?**

<details>
<summary>Show answer</summary>

Every pod gets its own IP; pods can reach all other pods on any node without NAT; and node agents can reach all pods on their node. CNI plugins implement these rules.

</details>

**Q102. What is a CNI plugin?**

<details>
<summary>Show answer</summary>

A plugin implementing the Container Network Interface that the runtime calls when a pod sandbox is created or deleted to set up its network interface, IP address (via IPAM) and routes. Examples: Calico, Cilium, Flannel, AWS VPC CNI, Azure CNI.

</details>

**Q103. What is a veth pair?**

<details>
<summary>Show answer</summary>

A virtual Ethernet cable with two ends: one becomes eth0 inside the pod's network namespace, the other stays on the host attached to a bridge or routed directly. Packets entering one end come out the other.

</details>

**Q104. Overlay vs native routing networking?**

<details>
<summary>Show answer</summary>

Overlays encapsulate pod packets in node-to-node packets (VXLAN, Geneve, IPIP) and work on any network but add overhead and require lower MTU. Native routing makes pod IPs routable on the underlying network (BGP, cloud routes, VPC IPs) with no encapsulation.

</details>

**Q105. What is a Service?**

<details>
<summary>Show answer</summary>

An abstraction that gives a set of pods (selected by labels) a stable virtual IP, DNS name and port, and load-balances traffic across ready endpoints.

</details>

**Q106. List the Service types.**

<details>
<summary>Show answer</summary>

ClusterIP (internal virtual IP), NodePort (port on every node), LoadBalancer (cloud or external LB in front of NodePorts or pod IPs), ExternalName (DNS CNAME), plus headless Services with clusterIP None.

</details>

**Q107. Explain port, targetPort and nodePort.**

<details>
<summary>Show answer</summary>

port is what clients use on the Service, targetPort is the container port traffic is sent to (number or name), and nodePort is the port opened on every node for NodePort and LoadBalancer Services (default range 30000-32767).

</details>

**Q108. What is a headless Service?**

<details>
<summary>Show answer</summary>

A Service with clusterIP None. No virtual IP or kube-proxy rules; DNS returns the IPs of ready pods directly, which StatefulSets and client-side load balancers use.

</details>

**Q109. What is an ExternalName Service?**

<details>
<summary>Show answer</summary>

A Service that returns a DNS CNAME to an external hostname. No proxying or ports are involved; it's an in-cluster alias.

</details>

**Q110. What are EndpointSlices?**

<details>
<summary>Show answer</summary>

Objects listing the network endpoints (IPs, ports, readiness, topology) behind a Service, split into slices of up to 100 endpoints for scalability. They replaced the single Endpoints object for large Services.

</details>

**Q111. How does readiness affect Service traffic?**

<details>
<summary>Show answer</summary>

Only endpoints marked ready receive traffic from kube-proxy and most ingress controllers. A failing readiness probe marks the pod's endpoint not ready.

</details>

**Q112. What are kube-proxy's modes?**

<details>
<summary>Show answer</summary>

iptables (default for years), IPVS (kernel load balancer with hash tables), and nftables (the modern replacement). Some CNIs replace kube-proxy entirely with eBPF.

</details>

**Q113. Why does iptables mode struggle at very large scale?**

<details>
<summary>Show answer</summary>

Rules are evaluated as long sequential chains and rewritten in bulk on changes, so latency and CPU for updates grow with the number of Services and endpoints. IPVS, nftables and eBPF use hash-based lookups.

</details>

**Q114. What is externalTrafficPolicy?**

<details>
<summary>Show answer</summary>

For NodePort and LoadBalancer Services: Cluster (default) forwards to any pod on any node, spreading load but SNATing and losing client IP; Local only forwards to pods on the receiving node, preserving client IP and avoiding a hop but possibly unbalancing load.

</details>

**Q115. What is internalTrafficPolicy?**

<details>
<summary>Show answer</summary>

When set to Local, in-cluster traffic to the Service only goes to endpoints on the same node as the client, useful for node-local agents.

</details>

**Q116. What is session affinity in Services?**

<details>
<summary>Show answer</summary>

sessionAffinity ClientIP routes requests from the same client IP to the same endpoint for a configurable timeout. It's basic and IP-based, not cookie-based.

</details>

**Q117. What is topology-aware routing?**

<details>
<summary>Show answer</summary>

A feature (topology-mode annotation or trafficDistribution PreferClose) that prefers endpoints in the same zone as the client when enough exist, reducing latency and cross-zone traffic costs.

</details>

**Q118. How does service discovery work in Kubernetes?**

<details>
<summary>Show answer</summary>

Mainly through DNS served by CoreDNS (svc.namespace.svc.cluster.local). Environment variables for Services existing at pod start also exist but are rarely relied upon.

</details>

**Q119. What is CoreDNS?**

<details>
<summary>Show answer</summary>

The cluster DNS server, running as a Deployment behind the kube-dns Service. Its kubernetes plugin watches Services and EndpointSlices to answer cluster names and forwards other queries upstream.

</details>

**Q120. What DNS records does Kubernetes create?**

<details>
<summary>Show answer</summary>

A/AAAA records for Service ClusterIPs, A records for each ready pod of headless Services, per-pod records for StatefulSet pods via headless Services, SRV records for named ports, and CNAMEs for ExternalName Services.

</details>

**Q121. What is ndots and why does it matter?**

<details>
<summary>Show answer</summary>

A resolv.conf option (5 in pods by default): names with fewer dots are tried with every search domain first. External lookups like api.example.com generate several failing queries, adding latency and DNS load.

</details>

**Q122. What is NodeLocal DNSCache?**

<details>
<summary>Show answer</summary>

A DaemonSet that runs a DNS cache on every node at a link-local IP. It reduces latency, offloads CoreDNS, and avoids UDP conntrack race issues that cause intermittent 5-second timeouts.

</details>

**Q123. What are dnsPolicy options?**

<details>
<summary>Show answer</summary>

ClusterFirst (default; cluster DNS with upstream forwarding), ClusterFirstWithHostNet (for hostNetwork pods), Default (inherit the node's resolver), and None (use dnsConfig only).

</details>

**Q124. What is an Ingress?**

<details>
<summary>Show answer</summary>

An API object defining HTTP(S) routing rules (hosts, paths, TLS) to Services. An ingress controller implements it, typically behind one LoadBalancer.

</details>

**Q125. What is an IngressClass?**

<details>
<summary>Show answer</summary>

A cluster resource naming the controller that should implement Ingresses referencing it via ingressClassName, so several controllers can coexist.

</details>

**Q126. What pathTypes exist in Ingress?**

<details>
<summary>Show answer</summary>

Exact (exact match), Prefix (matches by path elements, so /api matches /api and /api/x but not /apix), and ImplementationSpecific (controller-defined).

</details>

**Q127. What is the Gateway API?**

<details>
<summary>Show answer</summary>

The successor to Ingress: role-oriented resources (GatewayClass, Gateway, HTTPRoute, GRPCRoute, TLSRoute and more) with built-in support for traffic splitting, header matching, redirects, rewrites, cross-namespace routing and multiple protocols.

</details>

**Q128. What are the Gateway API roles?**

<details>
<summary>Show answer</summary>

Infrastructure providers define GatewayClasses, cluster operators manage Gateways (listeners, TLS, which namespaces can attach), and application developers write Routes that attach to Gateways.

</details>

**Q129. What is a ReferenceGrant?**

<details>
<summary>Show answer</summary>

A Gateway API object in a target namespace that allows resources from another namespace (like an HTTPRoute) to reference objects there (like a Service or Secret), making cross-namespace references explicit.

</details>

**Q130. Why prefer Gateway API over Ingress for new work?**

<details>
<summary>Show answer</summary>

It standardises features that Ingress relied on non-portable annotations for, supports more protocols and roles, provides detailed status, and is where the ecosystem is investing. Ingress is stable but feature-frozen.

</details>

**Q131. What is a NetworkPolicy?**

<details>
<summary>Show answer</summary>

A namespaced resource that restricts pod ingress and/or egress traffic by pod labels, namespace labels, IP blocks and ports. Enforcement requires a CNI that supports it.

</details>

**Q132. Are pods isolated by default?**

<details>
<summary>Show answer</summary>

No. Without NetworkPolicies, all pods can communicate with all pods across namespaces. A pod becomes isolated for a direction only once a policy with that policyType selects it.

</details>

**Q133. How do multiple NetworkPolicies combine?**

<details>
<summary>Show answer</summary>

Additively: allowed traffic is the union of all policies that select the pod. The core API has no deny rules or priorities.

</details>

**Q134. Explain the AND vs OR rule in NetworkPolicy from clauses.**

<details>
<summary>Show answer</summary>

namespaceSelector and podSelector in the same list item mean both must match (pods with those labels in matching namespaces). As separate list items they're OR'd (any pod in matching namespaces, or matching pods in the policy's namespace).

</details>

**Q135. Why must egress policies allow DNS?**

<details>
<summary>Show answer</summary>

Once egress is restricted, DNS queries to CoreDNS are blocked unless explicitly allowed, breaking name resolution. Allow UDP and TCP 53 to the kube-dns pods.

</details>

**Q136. What are limitations of core NetworkPolicy?**

<details>
<summary>Show answer</summary>

No explicit deny, no priorities, no FQDN or L7 rules, no cluster-wide policies, no logging. CNI extensions (Cilium, Calico) and AdminNetworkPolicy address some of these.

</details>

**Q137. What is the cluster CIDR and service CIDR?**

<details>
<summary>Show answer</summary>

The pod CIDR is the address range for pod IPs (often split per node); the service CIDR is the range for ClusterIPs. They must not overlap each other or the node network.

</details>

**Q138. Why can a cluster run out of pod IPs on AWS?**

<details>
<summary>Show answer</summary>

The VPC CNI assigns real VPC subnet IPs to pods, limited by subnet size and per-instance ENI/IP limits. Prefix delegation, larger or secondary CIDRs, or custom networking mitigate it.

</details>

**Q139. What is hostNetwork?**

<details>
<summary>Show answer</summary>

A pod setting that runs the pod in the node's network namespace, using the node's IP and ports. Used by some system agents; avoided for apps due to port conflicts and security risk.

</details>

**Q140. What is hostPort?**

<details>
<summary>Show answer</summary>

A container port mapped to the same port on the node's IP. It constrains scheduling (only one pod per node can use it) and is rarely needed outside ingress controllers on bare metal.

</details>

**Q141. How does a LoadBalancer Service get its external IP?**

<details>
<summary>Show answer</summary>

The cloud-controller-manager (or a load balancer controller like the AWS Load Balancer Controller, MetalLB on bare metal) provisions a load balancer and writes its address to status.loadBalancer.ingress.

</details>

**Q142. What is MetalLB?**

<details>
<summary>Show answer</summary>

A load balancer implementation for bare-metal clusters that assigns IPs to LoadBalancer Services and announces them via ARP (layer 2) or BGP.

</details>

**Q143. What is a service mesh?**

<details>
<summary>Show answer</summary>

An infrastructure layer (Istio, Linkerd, Cilium mesh) that handles service-to-service traffic: mTLS, retries, timeouts, traffic splitting and telemetry, via sidecar proxies or node-level proxies, without app code changes.

</details>

**Q144. What is mTLS and why do meshes provide it?**

<details>
<summary>Show answer</summary>

Mutual TLS: both client and server present certificates, giving encryption and strong workload identity. Meshes automate certificate issuance and rotation so every hop is authenticated and encrypted.

</details>

**Q145. What is the difference between east-west and north-south traffic?**

<details>
<summary>Show answer</summary>

North-south is traffic entering or leaving the cluster (users to services). East-west is traffic between services inside the cluster.

</details>

**Q146. What is dual-stack networking?**

<details>
<summary>Show answer</summary>

Clusters where pods and Services can have both IPv4 and IPv6 addresses, configured via ipFamilies and ipFamilyPolicy on Services.

</details>

**Q147. How do pods reach the Kubernetes API from inside the cluster?**

<details>
<summary>Show answer</summary>

Via the kubernetes Service in the default namespace (kubernetes.default.svc), using the mounted ServiceAccount token and CA certificate for authentication.

</details>

**Q148. What is the MTU problem in overlay networks?**

<details>
<summary>Show answer</summary>

Encapsulation adds headers; if pod MTU isn't reduced accordingly, large packets get fragmented or dropped, causing hangs on large responses while small requests work.

</details>

**Q149. What is Cilium's kube-proxy replacement?**

<details>
<summary>Show answer</summary>

Cilium implements Service load balancing with eBPF programs at the socket and traffic control layers instead of iptables rules, giving better performance at scale and richer observability (Hubble).

</details>

**Q150. What is an egress gateway?**

<details>
<summary>Show answer</summary>

A designated node or proxy through which selected pod traffic leaves the cluster with a stable source IP, useful for partner allowlists and auditing. Implemented by Cilium, Calico, Istio and cloud NAT setups.

</details>

---

← [Concept-Based index](README.md) · [All interview banks](../README.md)

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
