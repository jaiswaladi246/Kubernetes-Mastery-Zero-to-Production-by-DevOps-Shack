<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Lab 22 · The Troubleshooting Gauntlet

**Goal:** fix 10 broken workloads, each reproducing a real production failure. No hints in the manifests; use the [Troubleshooting cheat sheet](../../03-cheatsheets/troubleshooting.md) and [playbooks](../../05-troubleshooting-playbooks/README.md).
**Time:** 90 minutes · **Level:** 🟣 Advanced

```bash
kubectl apply -f manifests/
kubectl get pods -n gauntlet
```

For each scenario: find the root cause, write it down in one sentence, fix the manifest, and re-apply. Aim for under 10 minutes each.

| # | Workload | Symptom you'll see |
|---|---|---|
| 1 | `s01-image` | ImagePullBackOff |
| 2 | `s02-crash` | CrashLoopBackOff |
| 3 | `s03-config` | CreateContainerConfigError |
| 4 | `s04-pending` | Pending |
| 5 | `s05-oom` | OOMKilled restarts |
| 6 | `s06-notready` | Running 0/1 |
| 7 | `s07-svc` | Service returns nothing |
| 8 | `s08-pvc` | Pending with PVC |
| 9 | `s09-probe` | Restarts every ~30s, logs look fine |
| 10 | `s10-selector` | Deployment creates no pods |

<details>
<summary>Answer key (open only after trying)</summary>

1. Typo in image tag (`ngnix`), fix to `nginx:1.27`.
2. Command references a missing script; container exits 127.
3. Pod references ConfigMap key `DATABASE_URL` that doesn't exist (key is `DB_URL`).
4. CPU request of 32 cores exceeds every node.
5. Memory limit 16Mi too small for the process.
6. Readiness probe hits `/healthz` on port 8080; nginx listens on 80.
7. Service `targetPort` 8080, container listens on 80.
8. PVC requests StorageClass `premium-ssd` that doesn't exist.
9. Liveness probe `timeoutSeconds: 1` against an endpoint that sleeps 2 seconds.
10. Deployment selector `app: s10` doesn't match template label `app: s10-selector`; the API rejects it. Read the apply error.

</details>

Clean up: `kubectl delete ns gauntlet`

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
