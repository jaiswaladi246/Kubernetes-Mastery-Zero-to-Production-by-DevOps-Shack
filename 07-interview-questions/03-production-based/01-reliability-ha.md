<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Production-Based · Reliability & High Availability

Questions 1–50 of the production-based bank. Answer each one out loud before opening the answer.

---

**Q1. How do you design a highly available application on Kubernetes?**

<details>
<summary>Show answer</summary>

Multiple replicas spread across zones and nodes with topology spread constraints, PDBs, readiness probes and graceful shutdown, HPA with headroom, resilient dependencies (replicated databases, retries with timeouts), and a control plane that is itself HA or managed.

</details>

**Q2. What does a production-ready Deployment manifest include?**

<details>
<summary>Show answer</summary>

Pinned image, requests and memory limits, startup/readiness/liveness probes, preStop and grace period, securityContext (non-root, read-only FS, dropped capabilities), dedicated ServiceAccount, topology spread, PDB, HPA, labels for ownership, and config from ConfigMaps/Secrets.

</details>

**Q3. How many replicas should a critical service run?**

<details>
<summary>Show answer</summary>

At least 3, spread across 3 zones, sized so that losing one zone leaves enough capacity for peak load (or autoscaling can add it quickly). Two replicas don't survive a zone loss plus a deploy.

</details>

**Q4. What is your strategy for zero-downtime deployments in production?**

<details>
<summary>Show answer</summary>

Rolling updates with maxUnavailable 0, accurate readiness, preStop delays and SIGTERM draining, backward-compatible schema changes, progressive delivery for risky changes, and automated rollback on SLO regression.

</details>

**Q5. How do you handle a full zone outage?**

<details>
<summary>Show answer</summary>

Workloads spread across zones keep serving from remaining zones; the autoscaler adds capacity there; zonal volumes in the lost zone are unavailable, so stateful systems rely on replicas in other zones. Practise it with game days.

</details>

**Q6. What are PodDisruptionBudgets good and bad for in production?**

<details>
<summary>Show answer</summary>

Good: they protect availability during drains, upgrades and autoscaler scale-down. Bad: overly strict PDBs (zero allowed disruptions) block node maintenance and upgrades indefinitely.

</details>

**Q7. How do you set SLOs for a Kubernetes-hosted service?**

<details>
<summary>Show answer</summary>

Choose user-centric SLIs (availability, latency at p99 for key endpoints), set targets with product owners, measure from ingress or the service metrics, and alert on error budget burn rates.

</details>

**Q8. Your team gets paged constantly for pod restarts. How do you improve alerting?**

<details>
<summary>Show answer</summary>

Move to symptom-based SLO burn-rate alerts for paging; route cause signals like restarts, high memory or node pressure to tickets or dashboards; ensure every page is actionable with a runbook.

</details>

**Q9. What metrics do you watch for the control plane?**

<details>
<summary>Show answer</summary>

API server request latency and error rate, APF rejections, inflight requests, etcd fsync and commit latency, leader changes, DB size, scheduler pending pods and latency, controller work queue depth.

</details>

**Q10. What metrics matter most for workloads?**

<details>
<summary>Show answer</summary>

RED (rate, errors, duration) per service, saturation (CPU vs requests, throttling, memory working set vs limit), restarts, ready replicas vs desired, HPA state and pending pods.

</details>

**Q11. How do you make DNS resilient in production?**

<details>
<summary>Show answer</summary>

Multiple CoreDNS replicas across nodes and zones with a PDB and autoscaling, NodeLocal DNSCache, sensible ndots, monitoring of latency and SERVFAIL, and DNS allowed in all egress policies.

</details>

**Q12. How do you deal with noisy neighbours in a shared cluster?**

<details>
<summary>Show answer</summary>

Requests and limits enforced by LimitRange and quotas, PriorityClasses, separate node pools for heavy workloads, CPU limits where fairness matters, and monitoring per namespace.

</details>

**Q13. How do you protect a service from a dependency outage?**

<details>
<summary>Show answer</summary>

Timeouts and retries with backoff and budgets, circuit breakers, fallbacks or cached responses, bulkheads (separate pools), readiness that degrades gracefully, and load shedding.

</details>

**Q14. How do you prevent retry storms?**

<details>
<summary>Show answer</summary>

Bounded retries with exponential backoff and jitter, retry budgets in clients or meshes, timeouts shorter than callers', and idempotent operations.

</details>

**Q15. What's your approach to running stateful services on Kubernetes in production?**

<details>
<summary>Show answer</summary>

Use operators with proven failover and backup (or managed services), replicated storage across zones, anti-affinity, PDBs, tested backups with PITR, and careful upgrade procedures.

</details>

**Q16. How do you keep latency low during scale-up events?**

<details>
<summary>Show answer</summary>

Fast container startup (small images, lazy init), warm pools or overprovisioning placeholders, HPA on leading metrics, readiness only when warm, and node autoscaling tuned for speed.

</details>

**Q17. How do you test resilience before production incidents happen?**

<details>
<summary>Show answer</summary>

Chaos engineering (Chaos Mesh, LitmusChaos): kill pods, drain nodes, inject latency and DNS failures in staging and carefully in production, verify SLOs hold and runbooks work.

</details>

**Q18. What's your incident response process for a Kubernetes outage?**

<details>
<summary>Show answer</summary>

Declare and assign roles, mitigate first (rollback, scale, failover), communicate status, gather evidence (events, logs, metrics, audit logs), resolve, then run a blameless postmortem with tracked action items.

</details>

**Q19. How do you make sure readiness probes reflect real health in production?**

<details>
<summary>Show answer</summary>

Check what the app needs to serve requests (initialised, connection pools ready, not overloaded) with a cheap endpoint, avoid hard-failing on optional dependencies, and test probe behaviour under load.

</details>

**Q20. How do you ensure graceful node shutdown on cloud instance termination?**

<details>
<summary>Show answer</summary>

Enable kubelet graceful node shutdown, handle spot interruption notices (AWS Node Termination Handler or Karpenter interruption handling), and ensure apps drain on SIGTERM.

</details>

**Q21. How do you approach capacity headroom?**

<details>
<summary>Show answer</summary>

Keep enough spare capacity (or autoscaling speed) to absorb a node or zone loss plus traffic spikes, measured against real peaks; review monthly with utilisation and cost data.

</details>

**Q22. What's the risk of using a single large cluster for everything?**

<details>
<summary>Show answer</summary>

Large blast radius (a bad CRD, webhook or upgrade affects everyone), noisy neighbours, scaling limits, harder upgrades and compliance boundaries. Many orgs split by environment, region or criticality.

</details>

**Q23. How do you handle long-running connections during deploys?**

<details>
<summary>Show answer</summary>

Graceful draining with longer grace periods, connection-aware load balancing, client reconnect logic with backoff, and for WebSockets/gRPC streams, server-side signals to reconnect.

</details>

**Q24. How do you monitor certificate expiry across clusters?**

<details>
<summary>Show answer</summary>

cert-manager metrics for managed certs, blackbox exporter TLS probes for endpoints, kubeadm certificate checks for control planes, and alerts at 30 and 7 days.

</details>

**Q25. How do you handle time-sensitive batch jobs reliably?**

<details>
<summary>Show answer</summary>

CronJobs with concurrencyPolicy, startingDeadlineSeconds, retries, idempotent logic, alerts on missed or failed runs, and enough capacity or priority to start on time.

</details>

**Q26. How do you plan for the API server becoming slow under load?**

<details>
<summary>Show answer</summary>

Monitor latency and APF, scale or size control plane (managed providers auto-scale), audit heavy clients, optimise controllers' list/watch usage, and avoid huge objects and excessive events.

</details>

**Q27. What are common causes of production outages in Kubernetes?**

<details>
<summary>Show answer</summary>

Bad deploys, expired certificates, misconfigured probes, resource exhaustion, DNS issues, admission webhooks failing closed, network policy mistakes, cluster upgrades breaking add-ons, and cloud quota limits.

</details>

**Q28. How do you reduce mean time to recovery?**

<details>
<summary>Show answer</summary>

Fast rollback paths, clear dashboards and SLO alerts, runbooks, good logging and tracing, practised incident response, and automation for common remediations.

</details>

**Q29. How do you guard against a single bad config change taking down many services?**

<details>
<summary>Show answer</summary>

Versioned immutable config, per-service config objects, progressive rollout of config changes, validation in CI and admission, and GitOps with quick revert.

</details>

**Q30. How do you run multi-region active-active on Kubernetes?**

<details>
<summary>Show answer</summary>

Clusters per region deployed identically via GitOps, global load balancing with health checks, a data strategy (multi-region databases, per-region sharding, or async replication with conflict handling), and regular failover tests.

</details>

**Q31. How do you decide between a service mesh and simpler tools in production?**

<details>
<summary>Show answer</summary>

Adopt a mesh when you need mTLS everywhere, consistent resilience policies across many polyglot services, or fine-grained traffic control; otherwise prefer NetworkPolicy, Gateway API and libraries to avoid complexity.

</details>

**Q32. What do you put in a runbook for a service?**

<details>
<summary>Show answer</summary>

Overview and dependencies, dashboards and logs links, common alerts with diagnosis steps, safe mitigations (rollback, scale, feature flags), escalation contacts and known issues.

</details>

**Q33. How do you make CoreDNS or ingress controller failures less likely to cause total outages?**

<details>
<summary>Show answer</summary>

Run them with multiple replicas across zones, PDBs, priority classes, resource requests, monitoring and controlled upgrades, and test failure modes.

</details>

**Q34. How do you handle a sudden traffic spike 10x normal?**

<details>
<summary>Show answer</summary>

Autoscaling with high max limits, load shedding and rate limiting at the edge, caching, queue-based buffering for async work, and pre-provisioned headroom for known events.

</details>

**Q35. How do you prevent a misbehaving pod from filling node disks?**

<details>
<summary>Show answer</summary>

ephemeral-storage limits, emptyDir sizeLimit, container log rotation settings, and alerts on node disk usage.

</details>

**Q36. What's your approach to logging at scale?**

<details>
<summary>Show answer</summary>

Structured JSON logs to stdout, a node agent shipping to a scalable backend with retention tiers, sampling or level controls for noisy services, and correlation IDs linking logs to traces.

</details>

**Q37. How do you keep observability costs under control?**

<details>
<summary>Show answer</summary>

Limit high-cardinality labels, drop unused metrics, set log retention and sampling, use recording rules, and tier storage.

</details>

**Q38. How do you ensure ordering when the platform starts after a full cluster restart?**

<details>
<summary>Show answer</summary>

Make apps tolerate dependencies being unavailable (retries, readiness), use priority classes for core add-ons, and avoid hard startup dependencies between services.

</details>

**Q39. How do you handle configuration drift between clusters?**

<details>
<summary>Show answer</summary>

GitOps with self-heal for every cluster, policy checks, and periodic drift reports comparing live state with Git.

</details>

**Q40. How do you validate that a cluster is healthy after maintenance?**

<details>
<summary>Show answer</summary>

Automated checks: node readiness, system pods healthy, DNS resolution, ingress synthetic checks, sample app deployment, SLO dashboards green, no pending pods.

</details>

**Q41. How do you make sure HPAs don't scale beyond what dependencies can handle?**

<details>
<summary>Show answer</summary>

Set maxReplicas based on dependency capacity (database connections), use connection pooling, and protect dependencies with rate limits.

</details>

**Q42. How do you handle pod-level hotspots, where one pod gets more traffic?**

<details>
<summary>Show answer</summary>

Check load-balancing behaviour (long-lived connections, session affinity), use L7 balancing for HTTP/2 and gRPC, and ensure even spread of endpoints.

</details>

**Q43. How do you make your platform resilient to cloud provider API throttling?**

<details>
<summary>Show answer</summary>

Tune controllers' cloud API rate limits, cache where possible, avoid churn (constant node or LB recreation), and request quota increases ahead of growth.

</details>

**Q44. What do you consider before running Kubernetes on bare metal in production?**

<details>
<summary>Show answer</summary>

Load balancer solution (MetalLB/BGP), storage (Ceph, local PVs with replication), control plane HA and etcd backups, node provisioning and OS lifecycle, networking design, and the team's operational capacity.

</details>

**Q45. How do you ensure secrets and certificates don't expire during holidays?**

<details>
<summary>Show answer</summary>

Automated renewal everywhere, inventory and alerts well in advance, and change freezes that exclude routine automated renewals.

</details>

**Q46. How do you approach on-call for a Kubernetes platform team?**

<details>
<summary>Show answer</summary>

Clear ownership boundaries between platform and app teams, SLOs for platform services, actionable alerts with runbooks, sustainable rotations, and postmortems feeding improvements.

</details>

**Q47. How do you handle a failing node in production automatically?**

<details>
<summary>Show answer</summary>

Node problem detector plus automated remediation, managed node auto-repair, Karpenter replacing unhealthy nodes, and workloads designed to tolerate node loss.

</details>

**Q48. How do you ensure apps start correctly after a cluster upgrade?**

<details>
<summary>Show answer</summary>

Staging upgrades first, smoke tests, scanning for removed APIs, add-on compatibility checks, and canary node pools for kubelet upgrades.

</details>

**Q49. How do you prevent cascading failures across microservices?**

<details>
<summary>Show answer</summary>

Timeouts, circuit breakers, bulkheads, rate limiting, load shedding, async messaging for non-critical paths, and readiness that removes overloaded pods rather than restarting them.

</details>

**Q50. How do you measure the reliability of the platform itself?**

<details>
<summary>Show answer</summary>

SLOs for API server availability and latency, deployment success rate and duration, DNS success rate, ingress availability, and time to provision nodes.

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
