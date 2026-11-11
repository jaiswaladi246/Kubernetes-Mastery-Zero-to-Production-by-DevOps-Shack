<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Troubleshooting · Networking, DNS & Ingress

Questions 51–100 of the troubleshooting bank. Answer each one out loud before opening the answer.

---

**Q51. A Service has no endpoints. What's the first thing you check?**

<details>
<summary>Show answer</summary>

Whether the Service selector matches the pod labels exactly (`kubectl get pods -l <selector>`), then whether matching pods are Ready.

</details>

**Q52. Endpoints exist but connections to the Service are refused. Why?**

<details>
<summary>Show answer</summary>

targetPort doesn't match the container port, or the app listens only on localhost. Test the pod IP and port directly.

</details>

**Q53. Calls to a Service time out from one namespace but work from another. Cause?**

<details>
<summary>Show answer</summary>

A NetworkPolicy (ingress on the target or egress on the source) blocks that namespace, or the caller uses the wrong DNS name (missing namespace).

</details>

**Q54. nslookup kubernetes.default fails inside a pod. What next?**

<details>
<summary>Show answer</summary>

Check CoreDNS pods and logs, the kube-dns Service endpoints, the pod's resolv.conf, and egress policies blocking port 53.

</details>

**Q55. Only external DNS names fail; cluster names work. Why?**

<details>
<summary>Show answer</summary>

CoreDNS forwarding is broken: upstream resolvers unreachable, node resolv.conf misconfigured, or egress from CoreDNS blocked.

</details>

**Q56. DNS lookups take 5 seconds intermittently. Fix?**

<details>
<summary>Show answer</summary>

Likely the conntrack race for parallel A/AAAA UDP queries. Deploy NodeLocal DNSCache, use single-request-reopen, or switch to TCP for DNS.

</details>

**Q57. CoreDNS pods are CrashLooping with "Loop ... detected". What does it mean?**

<details>
<summary>Show answer</summary>

CoreDNS forwards to itself because node resolv.conf points to a local stub resolver (like 127.0.0.53). Point forward to real upstream servers or fix the kubelet's resolvConf setting.

</details>

**Q58. A pod can reach other pods on its node but not on other nodes. What do you check?**

<details>
<summary>Show answer</summary>

CNI health on both nodes, overlay or BGP traffic allowed by firewalls/security groups, routes for pod CIDRs, and MTU settings.

</details>

**Q59. Small HTTP requests work but large responses hang. Cause?**

<details>
<summary>Show answer</summary>

MTU mismatch in an overlay network causing dropped packets. Lower the pod MTU or enable MSS clamping.

</details>

**Q60. A LoadBalancer Service's EXTERNAL-IP stays pending. Why?**

<details>
<summary>Show answer</summary>

No load balancer controller: bare metal without MetalLB, cloud controller misconfigured, missing IAM permissions, or invalid annotations. Check events on the Service and controller logs.

</details>

**Q61. The cloud load balancer marks all nodes unhealthy. Why?**

<details>
<summary>Show answer</summary>

With externalTrafficPolicy Local, only nodes with local pods pass health checks; or security groups block the health check port; or the NodePort isn't reachable.

</details>

**Q62. The Ingress returns 404 for every path. What do you check?**

<details>
<summary>Show answer</summary>

The host header matches the rule, ingressClassName is correct and the controller watches that class, pathType and paths are right, and DNS points to the controller.

</details>

**Q63. The Ingress returns 502 Bad Gateway. Common causes?**

<details>
<summary>Show answer</summary>

Backend pods crashing or refusing connections, wrong Service port, HTTP/HTTPS protocol mismatch, or backends closing keep-alive connections early.

</details>

**Q64. The Ingress returns 503 Service Unavailable. Why?**

<details>
<summary>Show answer</summary>

No ready endpoints for the backend Service, a missing Service, or the controller can't find it. Check endpoints and controller logs.

</details>

**Q65. The Ingress returns 504 Gateway Timeout on some requests. Fix?**

<details>
<summary>Show answer</summary>

Backends are slower than the controller or load balancer timeout. Increase timeouts for that route or make the endpoint faster or async.

</details>

**Q66. TLS shows the controller's default fake certificate. Why?**

<details>
<summary>Show answer</summary>

The TLS Secret is missing, in the wrong namespace, invalid, or the host doesn't match the tls hosts list; cert-manager may not have issued it yet.

</details>

**Q67. cert-manager's Certificate is stuck not ready. How do you debug?**

<details>
<summary>Show answer</summary>

Inspect CertificateRequest, Order and Challenge resources; check HTTP-01 reachability (ingress class, firewall) or DNS-01 credentials and records; watch for Let's Encrypt rate limits.

</details>

**Q68. An HTTPRoute shows Accepted=False. What does it mean?**

<details>
<summary>Show answer</summary>

The Gateway rejected it: the namespace isn't allowed by allowedRoutes, the hostname doesn't match listeners, or the parentRef is wrong.

</details>

**Q69. An HTTPRoute shows ResolvedRefs=False. Fix?**

<details>
<summary>Show answer</summary>

A backend reference is invalid: wrong Service name or port, or a cross-namespace reference without a ReferenceGrant.

</details>

**Q70. After applying default-deny, everything breaks including DNS. What's missing?**

<details>
<summary>Show answer</summary>

An egress policy allowing UDP and TCP 53 to kube-dns pods in kube-system.

</details>

**Q71. A NetworkPolicy allowing traffic from namespace monitoring doesn't work. Why?**

<details>
<summary>Show answer</summary>

The namespaceSelector uses a label the namespace doesn't have. Use kubernetes.io/metadata.name or add the label to the namespace.

</details>

**Q72. A NetworkPolicy you applied has no effect. Why?**

<details>
<summary>Show answer</summary>

The CNI doesn't enforce NetworkPolicy (e.g. plain Flannel), the podSelector matches nothing, or the policy is in the wrong namespace.

</details>

**Q73. Too much traffic is allowed after adding a policy with namespaceSelector and podSelector. Why?**

<details>
<summary>Show answer</summary>

They're in separate list items, which means OR. Put them in the same item for AND semantics.

</details>

**Q74. Pods can't reach the Kubernetes API after egress lockdown. Fix?**

<details>
<summary>Show answer</summary>

Allow egress to the API server endpoints (IPs of the kubernetes Service endpoints) on 443/6443 for pods that need it.

</details>

**Q75. Clients see the same backend pod for every request despite 5 replicas. Why?**

<details>
<summary>Show answer</summary>

Long-lived connections (HTTP keep-alive, gRPC) pin to one pod, or sessionAffinity is enabled. Use L7 load balancing or client-side balancing.

</details>

**Q76. A headless Service's DNS returns no records. Why?**

<details>
<summary>Show answer</summary>

No ready pods match the selector, or pods aren't ready yet. publishNotReadyAddresses can expose not-ready pods if needed for bootstrapping.

</details>

**Q77. Pods in a StatefulSet can't resolve each other's names. What do you check?**

<details>
<summary>Show answer</summary>

That serviceName matches an existing headless Service, the Service selects the pods, and you use pod-N.service.namespace.svc.cluster.local.

</details>

**Q78. kube-proxy logs show errors syncing iptables rules. Impact and fix?**

<details>
<summary>Show answer</summary>

Services may route to stale endpoints. Check kube-proxy version compatibility, kernel modules, conflicting iptables managers, and restart or upgrade kube-proxy.

</details>

**Q79. A NodePort is unreachable from outside. Why?**

<details>
<summary>Show answer</summary>

Firewall or security groups block the port, nodes have no public IPs, or externalTrafficPolicy Local on a node without local pods.

</details>

**Q80. Ingress controller pods restart frequently under load. Fix?**

<details>
<summary>Show answer</summary>

Raise resources, scale replicas with HPA, check for config reload storms from frequent changes, and tune worker settings.

</details>

**Q81. After a pod restarts with a new IP, some clients keep connecting to the old IP. Why?**

<details>
<summary>Show answer</summary>

Clients cache DNS (headless) or connections; JVM DNS caching is a common culprit. Use Services' stable IPs, lower DNS TTL caching in clients, and reconnect logic.

</details>

**Q82. Requests from pods to an external API fail with TLS errors only in Kubernetes. Why?**

<details>
<summary>Show answer</summary>

Missing CA certificates in a minimal image, a corporate proxy intercepting TLS, or SNI issues through egress gateways.

</details>

**Q83. Pods can't reach the internet in a private cluster. What do you check?**

<details>
<summary>Show answer</summary>

NAT gateway or egress routing, VPC route tables, egress NetworkPolicies, and proxy settings.

</details>

**Q84. Two Services with the same name in different namespaces get mixed up. Why?**

<details>
<summary>Show answer</summary>

Clients use short names that resolve within their own namespace. Use fully qualified names across namespaces.

</details>

**Q85. An ExternalName Service causes HTTPS certificate errors. Why?**

<details>
<summary>Show answer</summary>

The client connects using the in-cluster name, which doesn't match the external server's certificate. Use the external hostname for TLS SNI/Host or terminate TLS differently.

</details>

**Q86. Calls to a Service work via ClusterIP but not via the DNS name. Why?**

<details>
<summary>Show answer</summary>

DNS issue: wrong name, search path or namespace, or DNS blocked by policy. Test with dig and the FQDN.

</details>

**Q87. A mesh-enabled pod can't reach a non-mesh Service. Why?**

<details>
<summary>Show answer</summary>

Strict mTLS requires both sides in the mesh; configure permissive mode or exclusions for non-mesh destinations.

</details>

**Q88. Istio sidecar injection isn't happening. Why?**

<details>
<summary>Show answer</summary>

The namespace lacks the injection label, the webhook isn't reachable, or the pod has injection disabled by annotation.

</details>

**Q89. Ingress works for HTTP but HTTPS redirects loop. Why?**

<details>
<summary>Show answer</summary>

The backend redirects to HTTPS while the LB terminates TLS and forwards HTTP; configure X-Forwarded-Proto handling or disable redirects at one layer.

</details>

**Q90. Services stop working after a CNI upgrade. What do you check?**

<details>
<summary>Show answer</summary>

CNI and kube-proxy compatibility, eBPF maps and iptables rules state, CNI pod logs, and whether nodes need restarts to apply new datapath settings.

</details>

**Q91. Conntrack table full messages appear in node logs. Fix?**

<details>
<summary>Show answer</summary>

Increase nf_conntrack_max, reduce connection churn (keep-alive), adjust timeouts, and consider eBPF dataplanes.

</details>

**Q92. The client IP seen by pods is always an internal address. Why?**

<details>
<summary>Show answer</summary>

SNAT by kube-proxy with externalTrafficPolicy Cluster or by the ingress. Use Local policy, proxy protocol or X-Forwarded-For.

</details>

**Q93. Traffic isn't shifting to the canary despite weights in HTTPRoute. Why?**

<details>
<summary>Show answer</summary>

The route isn't attached (check status), the implementation doesn't support weights for that path, or clients reuse connections pinned to stable.

</details>

**Q94. A gRPC service behind Ingress fails with protocol errors. Fix?**

<details>
<summary>Show answer</summary>

Configure the controller for gRPC/HTTP2 backends (appProtocol or backend protocol annotation, GRPCRoute), and ensure TLS settings match.

</details>

**Q95. A pod's egress to a specific IP is blocked although a policy allows the CIDR. Why?**

<details>
<summary>Show answer</summary>

Another policy or CNI global policy denies it, the destination is being SNATed differently, or the policy port/protocol doesn't match.

</details>

**Q96. Topology-aware routing doesn't keep traffic in-zone. Why?**

<details>
<summary>Show answer</summary>

Too few endpoints per zone, uneven distribution, or hints disabled because of imbalance safeguards. Spread replicas evenly.

</details>

**Q97. Hubble shows packets dropped with "Policy denied". How do you find the policy?**

<details>
<summary>Show answer</summary>

Inspect the flow details (identities, ports), list policies selecting the source and destination, and use cilium policy trace tools.

</details>

**Q98. DNS works in most pods but not in hostNetwork pods. Fix?**

<details>
<summary>Show answer</summary>

Set dnsPolicy ClusterFirstWithHostNet for hostNetwork pods so they use cluster DNS.

</details>

**Q99. Ingress host routing works by IP but not by domain name. Why?**

<details>
<summary>Show answer</summary>

DNS for the domain doesn't point to the load balancer or still has old cached records. Check DNS records and TTLs.

</details>

**Q100. An app can't connect to a database in another VPC from pods, but works from nodes. Why?**

<details>
<summary>Show answer</summary>

Pod IPs aren't allowed by the database security group or routing (overlay pod IPs not routable, or SNAT disabled). Allow pod CIDRs or enable SNAT for that destination.

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
