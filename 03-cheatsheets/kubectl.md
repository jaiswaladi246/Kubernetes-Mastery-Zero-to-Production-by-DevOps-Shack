<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Cheat Sheet · kubectl Essentials

## Setup & speed

```bash
alias k=kubectl
source <(kubectl completion bash)           # or zsh
complete -o default -F __start_kubectl k
export do="--dry-run=client -o yaml"        # k create deploy x --image=nginx $do
export now="--force --grace-period=0"       # k delete pod x $now  (labs only!)
```

## Contexts & namespaces

| Task | Command |
|---|---|
| List contexts | `kubectl config get-contexts` |
| Switch context | `kubectl config use-context prod-in` |
| Set default namespace | `kubectl config set-context --current --namespace=shop` |
| Who am I | `kubectl auth whoami` |
| Cluster info | `kubectl cluster-info` · `kubectl version` |

## Get & inspect

| Task | Command |
|---|---|
| Everything in a namespace | `kubectl get all -n shop` (not truly all; misses ConfigMaps, Secrets, PVCs, Ingresses) |
| Wide output | `kubectl get pods -o wide` |
| All namespaces | `kubectl get pods -A` |
| Watch | `kubectl get pods -w` |
| Show labels | `kubectl get pods --show-labels` · `-L app,version` |
| Filter by label | `kubectl get pods -l app=api,env!=dev` |
| Filter by field | `kubectl get pods --field-selector status.phase!=Running -A` |
| Sort | `kubectl get pods --sort-by=.metadata.creationTimestamp` |
| YAML of live object | `kubectl get deploy api -o yaml` |
| Just one field | `kubectl get pod api-1 -o jsonpath='{.status.podIP}'` |
| Custom columns | `kubectl get pods -o custom-columns=NAME:.metadata.name,NODE:.spec.nodeName,IP:.status.podIP` |
| Describe | `kubectl describe pod api-1` |
| API docs | `kubectl explain pod.spec.containers.securityContext --recursive` |
| Resource types | `kubectl api-resources` · `kubectl api-versions` |
| Events, newest last | `kubectl get events -n shop --sort-by=.lastTimestamp` |

## JSONPath recipes

```bash
# Images running in the cluster
kubectl get pods -A -o jsonpath='{range .items[*]}{range .spec.containers[*]}{.image}{"\n"}{end}{end}' | sort | uniq -c
# Node names and their InternalIP
kubectl get nodes -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.status.addresses[?(@.type=="InternalIP")].address}{"\n"}{end}'
# Pods that restarted
kubectl get pods -A -o jsonpath='{range .items[?(@.status.containerStatuses[0].restartCount>0)]}{.metadata.namespace}/{.metadata.name}{"\n"}{end}'
# Decode a secret value
kubectl get secret db-creds -o jsonpath='{.data.password}' | base64 -d
```

## Create & generate YAML

| Object | Command |
|---|---|
| Pod | `kubectl run web --image=nginx:1.27 --port=80 $do` |
| Deployment | `kubectl create deployment web --image=nginx:1.27 --replicas=3 $do` |
| Service | `kubectl expose deployment web --port=80 --target-port=80 --type=ClusterIP $do` |
| ConfigMap | `kubectl create configmap app --from-literal=K=V --from-file=app.conf $do` |
| Secret | `kubectl create secret generic db --from-literal=password=x $do` |
| Job | `kubectl create job once --image=busybox -- echo hi` |
| CronJob | `kubectl create cronjob tick --image=busybox --schedule="*/5 * * * *" -- date` |
| Job from CronJob | `kubectl create job manual-1 --from=cronjob/tick` |
| Namespace | `kubectl create namespace shop` |
| ServiceAccount | `kubectl create serviceaccount ci` |
| Role / binding | `kubectl create role pod-reader --verb=get,list,watch --resource=pods` · `kubectl create rolebinding rb --role=pod-reader --serviceaccount=shop:ci` |
| Ingress | `kubectl create ingress web --class=nginx --rule="shop.example.com/*=web:80"` |
| Quota | `kubectl create quota q --hard=pods=20,requests.cpu=4` |
| PDB | `kubectl create pdb api --selector=app=api --min-available=2` |
| Token | `kubectl create token ci --duration=1h` |

## Apply, change, delete

```bash
kubectl apply -f manifests/ -R                 # recursive
kubectl apply -k overlays/prod                 # kustomize
kubectl diff -f deploy.yaml                    # preview
kubectl apply --server-side -f deploy.yaml
kubectl set image deploy/api api=shop/api:2.1.0
kubectl set env deploy/api LOG_LEVEL=debug
kubectl set resources deploy/api --requests=cpu=200m,memory=256Mi --limits=memory=512Mi
kubectl scale deploy/api --replicas=5
kubectl autoscale deploy/api --min=3 --max=10 --cpu-percent=70
kubectl patch deploy api -p '{"spec":{"replicas":4}}'
kubectl patch deploy api --type=json -p='[{"op":"replace","path":"/spec/template/spec/containers/0/image","value":"shop/api:2.1.1"}]'
kubectl label ns shop env=prod --overwrite
kubectl annotate deploy api kubernetes.io/change-cause="hotfix 2.1.1"
kubectl delete -f deploy.yaml
kubectl delete pods -l app=api --wait=false
```

## Rollouts

```bash
kubectl rollout status deploy/api
kubectl rollout history deploy/api
kubectl rollout undo deploy/api [--to-revision=N]
kubectl rollout restart deploy/api
kubectl rollout pause|resume deploy/api
```

## Debug

```bash
kubectl logs api-1 [-c app] [--previous] [-f] [--since=10m] [--tail=100]
kubectl logs -l app=api --all-containers --prefix
kubectl exec -it api-1 -c app -- sh
kubectl debug -it api-1 --image=nicolaka/netshoot --target=app
kubectl debug node/worker-1 -it --image=ubuntu
kubectl port-forward svc/api 8080:80
kubectl cp shop/api-1:/tmp/heap.hprof ./heap.hprof
kubectl top nodes · kubectl top pods -A --sort-by=memory
kubectl run tmp --rm -it --image=nicolaka/netshoot -- bash
kubectl get --raw='/readyz?verbose'
```

## Nodes

```bash
kubectl cordon worker-1 · kubectl uncordon worker-1
kubectl drain worker-1 --ignore-daemonsets --delete-emptydir-data
kubectl taint nodes worker-1 dedicated=gpu:NoSchedule      # add
kubectl taint nodes worker-1 dedicated=gpu:NoSchedule-     # remove
kubectl label nodes worker-1 disktype=ssd
kubectl describe node worker-1 | grep -A8 "Allocated resources"
```

## RBAC

```bash
kubectl auth can-i create deployments -n shop
kubectl auth can-i --list --as=system:serviceaccount:shop:ci -n shop
kubectl get rolebindings,clusterrolebindings -A -o wide | grep <subject>
```

## Useful plugins (krew)

`ctx` · `ns` · `neat` (clean YAML) · `tree` (owner hierarchy) · `stern` (multi-pod logs) · `who-can` · `rbac-tool` · `view-secret` · `resource-capacity` · `node-shell`

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
