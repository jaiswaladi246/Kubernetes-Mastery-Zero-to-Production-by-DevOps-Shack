<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A108 · GPU Workloads

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Kubernetes for AI/ML | 2–4 hours | [Module 32 · Kubernetes for AI/ML Workloads](../02-modules/32-ai-ml-workloads.md) |

## Scenario

Your company wants to serve an open-source LLM on Kubernetes.

## Your tasks

1. Prepare a GPU node pool with the NVIDIA GPU Operator (cloud) or simulate with a fake device plugin locally
2. Deploy a model server requesting one GPU
3. Taint GPU nodes and add tolerations
4. Autoscale on queue depth or requests rather than CPU

## Acceptance criteria

- [ ] Pods land only on GPU nodes
- [ ] Model server answers requests
- [ ] Scaling signal justified

<details>
<summary>Hints (try without them first)</summary>

- Without GPUs, use a small CPU model with vLLM or llama.cpp to practise the workflow

</details>

## Stretch goal

Use Kueue to share GPUs fairly between two teams.

## Submit

Push your manifests, scripts and a short `NOTES.md` (what you did, what broke, what you learned) to your own repository. Share it on LinkedIn and tag **DevOps Shack** if you'd like feedback.

← [All assignments](README.md)

<!-- devopsshack:footer -->
---

<p align="center">
  Made with ❤️ by <b><a href="https://devopsshack.com">DevOps Shack</a></b> · Part of <b>Kubernetes Mastery: Zero to Production</b><br/>
  <a href="https://www.youtube.com/@devopsshack">YouTube · DevOps Shack</a> · <a href="https://www.youtube.com/@shackverse">YouTube · DevOps Shack Hindi</a> · <a href="https://devopsshack.com">devopsshack.com</a> · <a href="https://www.instagram.com/devopsshack">Instagram · @devopsshack</a><br/>
  <sub>© DevOps Shack. Original content created by DevOps Shack. Free to learn from and share with credit to DevOps Shack. See <a href="../LICENSE">LICENSE</a>.</sub>
</p>
<!-- /devopsshack:footer -->
