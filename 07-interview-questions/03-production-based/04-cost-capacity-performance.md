<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Production-Based · Cost, Capacity & Performance

Questions 151–200 of the production-based bank. Answer each one out loud before opening the answer.

---

**Q151. How do you reduce Kubernetes costs without hurting reliability?**

<details>
<summary>Show answer</summary>

Rightsize requests from real usage, bin-pack with Karpenter consolidation, autoscale pods and nodes, use spot for tolerant workloads, commitments for baseline, scale non-prod down off-hours, and remove idle resources, all while watching SLOs.

</details>

**Q152. Where does Kubernetes waste usually come from?**

<details>
<summary>Show answer</summary>

Over-requested resources, idle node capacity from poor bin-packing, oversized nodes, always-on non-prod environments, orphaned volumes and load balancers, cross-zone traffic and excessive observability data.

</details>

**Q153. How do you allocate costs to teams?**

<details>
<summary>Show answer</summary>

Enforce team and cost-center labels, use OpenCost or Kubecost to attribute requests and usage per namespace and label, include shared costs proportionally, and publish monthly showback.

</details>

**Q154. How do you decide which workloads can run on spot instances?**

<details>
<summary>Show answer</summary>

Stateless, horizontally scaled, interruption-tolerant workloads with multiple replicas, PDBs and graceful shutdown; batch jobs with checkpointing. Avoid single-replica stateful services and latency-critical control components.

</details>

**Q155. How do you handle spot interruptions gracefully?**

<details>
<summary>Show answer</summary>

Diversify instance types and zones, use interruption handling (Karpenter or Node Termination Handler) to cordon and drain on notice, keep replicas spread, and set short graceful shutdown periods within the notice window.

</details>

**Q156. What's the trade-off of removing CPU limits?**

<details>
<summary>Show answer</summary>

Better latency and utilisation because pods can burst into idle CPU, but less hard isolation; noisy pods can consume spare CPU. Accurate requests keep fair shares under contention.

</details>

**Q157. How do you choose instance types for a cluster?**

<details>
<summary>Show answer</summary>

Match workload shapes (CPU vs memory heavy), consider pod density limits, prefer a few families with flexibility for autoscalers, test Arm instances for price-performance, and include GPU or high-memory pools only where needed.

</details>

**Q158. How do you benchmark an application on Kubernetes?**

<details>
<summary>Show answer</summary>

Load test with realistic traffic in a production-like environment, record throughput and latency at increasing load, find saturation points per pod, and measure the effect of resources, replicas and limits.

</details>

**Q159. How do you improve pod startup time?**

<details>
<summary>Show answer</summary>

Smaller images, fewer layers changing often, pre-pulled or cached images, lazy-loading formats, faster app initialisation, startup probes tuned correctly, and avoiding heavy init containers.

</details>

**Q160. How do you improve node provisioning speed?**

<details>
<summary>Show answer</summary>

Karpenter or pre-warmed capacity, lightweight node images, fast bootstrap scripts, image caching, and overprovisioning placeholder pods.

</details>

**Q161. How do you troubleshoot performance issues that only happen at scale?**

<details>
<summary>Show answer</summary>

Load test at production scale, profile apps, watch saturation signals (CPU throttling, connection pools, DNS latency, conntrack table usage), and examine control plane metrics if scaling involves many objects.

</details>

**Q162. What are conntrack issues and how do they affect Kubernetes?**

<details>
<summary>Show answer</summary>

The kernel's connection tracking table can fill under heavy connection churn, dropping new connections. Monitor nf_conntrack usage, raise limits, reuse connections, and consider eBPF dataplanes.

</details>

**Q163. How do you optimise cross-zone data transfer costs?**

<details>
<summary>Show answer</summary>

Topology-aware routing, zone-affine placement for chatty services, local caches, avoiding unnecessary replication traffic, and VPC endpoints for cloud services.

</details>

**Q164. How do you scale a cluster to thousands of nodes?**

<details>
<summary>Show answer</summary>

Respect scalability limits (pods per node, Services, endpoints), use efficient dataplanes (IPVS/nftables/eBPF), tune API server and etcd, reduce controller churn, split into multiple clusters where sensible.

</details>

**Q165. How do you manage observability cost?**

<details>
<summary>Show answer</summary>

Drop unused metrics, limit label cardinality, sample traces, set log levels and retention tiers, and charge teams for their observability usage.

</details>

**Q166. How do you right-size memory without causing OOMs?**

<details>
<summary>Show answer</summary>

Base requests on p95 working set and limits on peak plus headroom, review after releases, use VPA recommendations, and alert at 90% of limit before making cuts aggressive.

</details>

**Q167. How do you approach Kubernetes cost for non-production environments?**

<details>
<summary>Show answer</summary>

Scale to zero outside working hours, use smaller node pools and spot, share clusters with namespaces, auto-delete preview environments, and cap with quotas.

</details>

**Q168. How do you measure cluster efficiency?**

<details>
<summary>Show answer</summary>

Ratios of requested to allocatable (packing efficiency) and used to requested (rightsizing efficiency), idle cost, and cost per request or per tenant.

</details>

**Q169. How do you reduce the cost of load balancers?**

<details>
<summary>Show answer</summary>

Consolidate HTTP services behind shared gateways, use internal load balancers where possible, and remove unused LoadBalancer Services.

</details>

**Q170. How do you decide between a managed service and running it in Kubernetes (e.g. databases)?**

<details>
<summary>Show answer</summary>

Compare operational burden, reliability requirements, team expertise, cost at your scale, compliance needs and portability; managed services usually win for critical databases unless scale or constraints justify self-hosting.

</details>

**Q171. How do you approach Arm migration for cost savings?**

<details>
<summary>Show answer</summary>

Build multi-arch images, test performance and compatibility in staging, add Arm node pools, schedule workloads gradually, and compare cost per request.

</details>

**Q172. How do you prevent runaway costs from autoscaling?**

<details>
<summary>Show answer</summary>

Set maxReplicas and NodePool or node group limits, budget alerts, quotas per namespace, and alerts for unusual scaling.

</details>

**Q173. How do you optimise large clusters' API server performance?**

<details>
<summary>Show answer</summary>

Reduce excessive watches and lists from controllers, use informers properly, avoid huge objects, limit events, tune APF, and scale control plane resources.

</details>

**Q174. What is bin-packing and how do you improve it?**

<details>
<summary>Show answer</summary>

Fitting pods onto as few nodes as possible. Improve it with accurate requests, MostAllocated scoring for batch, Karpenter consolidation, appropriate node sizes and fewer anti-affinity constraints.

</details>

**Q175. How do you deal with idle GPU costs?**

<details>
<summary>Show answer</summary>

Scale GPU pools to zero when idle, share GPUs with MIG or time-slicing for small workloads, queue jobs with Kueue, and monitor GPU utilisation with DCGM.

</details>

**Q176. How do you make HPA decisions cost-aware?**

<details>
<summary>Show answer</summary>

Target realistic utilisation (60-75%), scale down promptly with stabilisation, scale on demand-based metrics, and combine with node consolidation so freed capacity is removed.

</details>

**Q177. How do you handle memory leaks in production apps on Kubernetes?**

<details>
<summary>Show answer</summary>

Detect via working set trends, set memory limits to contain damage, capture heap profiles, fix the leak, and as a temporary mitigation use planned restarts rather than random OOMs.

</details>

**Q178. What tools do you use for Kubernetes cost visibility?**

<details>
<summary>Show answer</summary>

OpenCost or Kubecost, cloud cost tools with tags, Prometheus metrics for requests and usage, and dashboards per team.

</details>

**Q179. How do you reduce storage costs?**

<details>
<summary>Show answer</summary>

Right volume types (gp3 vs io2), right-size PVCs, delete orphaned PVs and old snapshots, use object storage for large data, and lifecycle policies.

</details>

**Q180. How do you set targets for cost optimisation without hurting teams?**

<details>
<summary>Show answer</summary>

Agree efficiency goals per team, provide data and recommendations, automate low-risk changes, protect SLOs, and celebrate savings rather than blame.

</details>

**Q181. How do you optimise Java workloads on Kubernetes?**

<details>
<summary>Show answer</summary>

Container-aware JVM flags, appropriate heap percentages, CPU requests matching GC threads, startup optimisations (CDS, CRaC), and avoiding tight CPU limits.

</details>

**Q182. How do you optimise network performance?**

<details>
<summary>Show answer</summary>

Native routing or eBPF dataplanes, proper MTU, connection reuse, topology-aware routing, NodeLocal DNSCache, and avoiding unnecessary proxies.

</details>

**Q183. How do you benchmark cluster scalability before a launch?**

<details>
<summary>Show answer</summary>

Synthetic load with clusterloader2 or kube-burner for control plane, application load tests for workloads, and checks of DNS, ingress and autoscaling under load.

</details>

**Q184. How do you handle many small namespaces' overhead?**

<details>
<summary>Show answer</summary>

Minimise per-namespace controllers and objects, use shared services, and avoid duplicating heavy add-ons per namespace.

</details>

**Q185. How do you plan capacity for a new product launch?**

<details>
<summary>Show answer</summary>

Estimate traffic, load test to determine per-pod throughput, compute required replicas and nodes with headroom, check quotas, pre-scale, and monitor closely post-launch.

</details>

**Q186. What's the impact of too many small pods?**

<details>
<summary>Show answer</summary>

Higher overhead per pod (sidecars, kubelet management, IPs), scheduling pressure and endpoint churn. Balance granularity with efficiency.

</details>

**Q187. How do you choose between vertical and horizontal scaling?**

<details>
<summary>Show answer</summary>

Horizontal for stateless services needing resilience and elasticity; vertical for single-instance or memory-bound workloads, databases or apps that don't scale out; often both with care to avoid conflicts.

</details>

**Q188. How do you optimise CI runners on Kubernetes for cost?**

<details>
<summary>Show answer</summary>

Ephemeral runner pods with autoscaling (Actions Runner Controller, GitLab runner), spot nodes for builds, caching of dependencies and layers, and scale to zero when idle.

</details>

**Q189. What are signs a cluster is over-provisioned?**

<details>
<summary>Show answer</summary>

Low used-to-allocatable ratios, many nodes with low utilisation, requests far above usage, and nodes that autoscalers can't remove due to constraints.

</details>

**Q190. How do you handle sustained high CPU on nodes?**

<details>
<summary>Show answer</summary>

Identify top consumers, check for throttling and runaway processes, rightsize or scale out, rebalance pods, and add nodes if genuinely capacity-bound.

</details>

**Q191. How do you approach caching in Kubernetes-hosted systems?**

<details>
<summary>Show answer</summary>

Use managed or in-cluster caches (Redis), CDN for static assets, per-pod caches with warm-up, and NodeLocal DNSCache for DNS, measuring hit rates.

</details>

**Q192. How do you deal with slow image registries?**

<details>
<summary>Show answer</summary>

Regional mirrors or pull-through caches, smaller images, pre-pulling critical images, and avoiding registry rate limits with authenticated pulls.

</details>

**Q193. How do you estimate the right number of nodes?**

<details>
<summary>Show answer</summary>

Sum requests across workloads plus DaemonSet overhead and headroom for failures and surges, divided by allocatable per node type; validate with real metrics and autoscaling.

</details>

**Q194. How do you approach performance testing in CI for Kubernetes apps?**

<details>
<summary>Show answer</summary>

Run short load tests on ephemeral environments, compare against baselines, and fail on significant latency or error regressions.

</details>

**Q195. How do you tune the Cluster Autoscaler or Karpenter for cost?**

<details>
<summary>Show answer</summary>

Enable consolidation, set scale-down delays appropriately, allow broad instance type choice and spot, limit expensive types, and remove scale-down blockers.

</details>

**Q196. How do you measure cost per customer or tenant?**

<details>
<summary>Show answer</summary>

Label workloads by tenant (or use per-tenant namespaces), allocate shared costs by usage, and combine with request volumes for unit economics.

</details>

**Q197. How do you prevent cost spikes from forgotten resources?**

<details>
<summary>Show answer</summary>

TTLs on preview environments, cleanup jobs for unused PVs and LBs, budget alerts, and regular reports of resources without owners.

</details>

**Q198. How do you balance performance and cost for databases on Kubernetes?**

<details>
<summary>Show answer</summary>

Right storage class and IOPS, dedicated nodes if needed, memory sizing based on working set, read replicas for scale, and reviewing whether managed services are cheaper overall.

</details>

**Q199. How do you handle large numbers of Services and endpoints efficiently?**

<details>
<summary>Show answer</summary>

Use EndpointSlices (default), efficient kube-proxy modes or eBPF, avoid excessive headless Services, and consider topology-aware routing to reduce churn.

</details>

**Q200. What would you do if a cluster's monthly cost doubled unexpectedly?**

<details>
<summary>Show answer</summary>

Break down by namespace, node pool and resource type, check recent deploys and scaling changes, look for runaway autoscaling, new LoadBalancers, storage growth or data transfer, fix the cause and add budget alerts.

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
