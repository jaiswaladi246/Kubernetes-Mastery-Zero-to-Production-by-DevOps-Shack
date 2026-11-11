<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# Diagrams · Roadmap, Labs, Cheat Sheets & Guides

## Kubernetes Mastery: Zero to Production — by DevOps Shack

Source: [Kubernetes Mastery: Zero to Production — by DevOps Shack](../README.md)

### 1. 🧭 Learning path

```mermaid
flowchart LR
    A[Roadmap] --> B[Core objects<br/>Modules 01-09]
    B --> C[Architecture<br/>deep dive]
    C --> D[Networking & storage]
    D --> E[Scaling & scheduling]
    E --> F[Security]
    F --> G[Helm · Kustomize<br/>GitOps · CI/CD]
    G --> H[Observability &<br/>delivery strategies]
    H --> I[Cluster ops<br/>upgrades · DR]
    I --> J[Troubleshooting<br/>mastery]
    J --> K((Capstones +<br/>1,000 Q&A))
```

### 2. The architecture at a glance

```mermaid
flowchart TB
    U[kubectl · CI/CD · GitOps] --> API[kube-apiserver]
    subgraph CP[Control plane]
        API <--> ETCD[(etcd)]
        SCH[scheduler] --> API
        KCM[controller-manager] --> API
        CCM[cloud-controller-manager] --> API
    end
    subgraph N[Worker nodes]
        KL[kubelet] --> CR[containerd] --> P[Pods]
        KP[kube-proxy / eBPF]
    end
    KL --> API
    KP --> API
```

## 00 · The Kubernetes Roadmap

Source: [00 · The Kubernetes Roadmap](../00-roadmap/README.md)

### 3. 00 · The Kubernetes Roadmap

```mermaid
flowchart LR
    S0[Week 0<br/>Prerequisites] --> S1[Weeks 1-2<br/>Core objects]
    S1 --> S2[Week 3<br/>Architecture]
    S2 --> S3[Weeks 4-5<br/>Networking & storage]
    S3 --> S4[Week 6<br/>Scheduling, resources, autoscaling]
    S4 --> S5[Week 7<br/>Security]
    S5 --> S6[Week 8<br/>Helm, Kustomize, GitOps, CI/CD]
    S6 --> S7[Week 9<br/>Observability & delivery strategies]
    S7 --> S8[Week 10<br/>Cluster ops, upgrades, DR]
    S8 --> S9[Week 11<br/>Troubleshooting mastery]
    S9 --> S10[Week 12<br/>Capstone + interview prep]
```

## 01 · Kubernetes Architecture: The Deep Dive

Source: [01 · Kubernetes Architecture: The Deep Dive](../01-architecture/README.md)

### 4. The whole system on one page

```mermaid
flowchart TB
    subgraph Users["Clients"]
        K[kubectl]
        CI[CI/CD pipeline]
        GO[GitOps agent]
        UI[Dashboards / Lens]
    end

    subgraph CP["Control Plane"]
        API[kube-apiserver]
        ETCD[(etcd)]
        SCH[kube-scheduler]
        KCM[kube-controller-manager]
        CCM[cloud-controller-manager]
    end

    subgraph N1["Worker Node 1"]
        KL1[kubelet]
        KP1[kube-proxy]
        CRI1[containerd]
        P1[Pods]
    end

    subgraph N2["Worker Node 2"]
        KL2[kubelet]
        KP2[kube-proxy]
        CRI2[containerd]
        P2[Pods]
    end

    CLOUD[(Cloud provider APIs<br/>LBs, disks, nodes)]

    K --> API
    CI --> API
    GO --> API
    UI --> API
    API <--> ETCD
    SCH -- watch / bind --> API
    KCM -- watch / reconcile --> API
    CCM -- watch / reconcile --> API
    CCM --> CLOUD
    KL1 -- watch pods, report status --> API
    KL2 -- watch pods, report status --> API
    KP1 -- watch Services / EndpointSlices --> API
    KP2 -- watch Services / EndpointSlices --> API
    KL1 --> CRI1 --> P1
    KL2 --> CRI2 --> P2
```

## Cheat Sheet · Troubleshooting

Source: [Cheat Sheet · Troubleshooting](../03-cheatsheets/troubleshooting.md)

### 5. The universal order

```mermaid
flowchart TD
    A[kubectl get pods -o wide] --> B{Status?}
    B -->|Pending| P[describe pod → Events<br/>scheduling: resources, taints,<br/>affinity, PVC]
    B -->|ContainerCreating| C[describe → Events<br/>volumes, CNI, image pull, secrets]
    B -->|ImagePullBackOff| I[image name/tag, registry auth,<br/>network, rate limits, arch]
    B -->|CrashLoopBackOff| CR["logs --previous, exit code,<br/>command/args, config, OOM"]
    B -->|Running, not Ready| R[readiness probe, app logs,<br/>dependencies]
    B -->|Running + Ready, still broken| S[Service selector/ports → endpoints →<br/>DNS → NetworkPolicy → Ingress]
    B -->|Terminating forever| T[finalizers, node down,<br/>volume detach]
```

## Lab 25 · End-to-End Microservices Platform

Source: [Lab 25 · End-to-End Microservices Platform](../04-labs/lab-25-end-to-end-microservices/README.md)

### 6. Lab 25 · End-to-End Microservices Platform

```mermaid
flowchart LR
    U[User] --> ING[Ingress shop.local]
    ING --> FE[frontend ×2]
    FE --> API[orders-api ×2-6 HPA]
    API --> DB[(postgres StatefulSet)]
    API --> CACHE[redis]
    PROM[Prometheus] -.-> FE & API
```

## 07 · Interview Questions: 1,000 Q&A

Source: [07 · Interview Questions: 1,000 Q&A](../07-interview-questions/README.md)

### 7. 07 · Interview Questions: 1,000 Q&A

```mermaid
flowchart LR
    C[Concepts<br/>250] --> S[Scenarios<br/>250]
    S --> P[Production<br/>250]
    S --> T[Troubleshooting<br/>250]
    P --> R((Interview ready))
    T --> R
```

## 09 · Certification Prep: CKA, CKAD, CKS

Source: [09 · Certification Prep: CKA, CKAD, CKS](../09-certification-prep/README.md)

### 8. 09 · Certification Prep: CKA, CKAD, CKS

```mermaid
flowchart LR
    KCNA[KCNA<br/>fundamentals, MCQ] --> CKAD[CKAD<br/>build & deploy apps]
    KCNA --> CKA[CKA<br/>administer clusters]
    CKA --> CKS[CKS<br/>secure clusters<br/>requires active CKA]
```

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
