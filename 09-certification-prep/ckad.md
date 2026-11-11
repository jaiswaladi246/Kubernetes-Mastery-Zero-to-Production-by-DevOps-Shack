<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# CKAD · Certified Kubernetes Application Developer

## Domains mapped to this repository

| Domain (approximate weight) | Study | Practise |
|---|---|---|
| Application Design and Build (~20%) | [Pods](../02-modules/02-pods.md), [Jobs & CronJobs](../02-modules/09-daemonsets-jobs-cronjobs.md), multi-container patterns, [Storage](../02-modules/07-storage.md) | Labs 02, 06, 08 · A006–A010, A033–A034 |
| Application Deployment (~20%) | [Deployments](../02-modules/04-deployments.md), [Deployment strategies](../02-modules/24-deployment-strategies.md), [Helm](../02-modules/19-helm.md), [Kustomize](../02-modules/20-kustomize.md) | Labs 03, 18, 19 · A011–A015, A075–A080, A092 |
| Application Observability and Maintenance (~15%) | [Probes](../02-modules/11-health-probes-lifecycle.md), debugging, API deprecations | Labs 10, 22 · A041–A043 · [Troubleshooting Q&A](../07-interview-questions/04-troubleshooting/README.md) |
| Application Environment, Configuration and Security (~25%) | [ConfigMaps & Secrets](../02-modules/06-configmaps-secrets.md), [Resources](../02-modules/10-resource-management.md), [ServiceAccounts](../02-modules/16-rbac-service-accounts.md), [securityContext](../02-modules/17-pod-security-hardening.md), CRDs | Labs 05, 09, 16, 17 · A021–A024, A036–A038 |
| Services and Networking (~20%) | [Services](../02-modules/05-services.md), [Ingress](../02-modules/14-ingress-gateway-api.md), [NetworkPolicies](../02-modules/15-network-policies.md) | Labs 04, 13, 15 · A016–A020, A054, A058–A059 |

## Must-be-fast tasks

```bash
k run nginx --image=nginx:1.27 --port=80 $do > pod.yaml
k create deploy web --image=nginx:1.27 --replicas=3 $do > deploy.yaml
k expose deploy web --port=80 --target-port=80 --type=NodePort
k create cm cfg --from-literal=MODE=prod ; k create secret generic s --from-literal=pw=x
k create job once --image=busybox -- sh -c 'echo hi'
k create cronjob tick --image=busybox --schedule="*/1 * * * *" -- date
k set image deploy/web nginx=nginx:1.27-alpine ; k rollout undo deploy/web
k create sa app ; k set sa deploy/web app
k create ingress web --rule="app.example.com/*=web:80"
```

## Two-week plan

1. Days 1–4: Modules 01–09, Labs 01–08, timing yourself on generators.
2. Days 5–8: Modules 10–15, 19–20, Labs 09–15, 18–19.
3. Days 9–12: Assignments listed above; Lab 22 gauntlet twice.
4. Days 13–14: Full mock exams (killer.sh comes with registration), review misses.

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
