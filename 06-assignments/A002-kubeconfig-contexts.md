<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A002 · Kubeconfig & Contexts

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟢 Beginner | Foundations | 45–60 min | [Module 01 · Foundations & Your First Cluster](../02-modules/01-foundations-and-setup.md) |

## Scenario

You work across three clusters (dev, staging, prod) and a colleague just ran a delete against prod thinking it was dev. You're asked to make context mistakes much harder.

## Your tasks

1. Create three kind clusters named dev, staging and prod
2. Merge their kubeconfigs into a single file and also keep them as separate files
3. Set a default namespace per context
4. Configure a shell prompt that shows the current context and namespace, coloured red for prod
5. Write a `kprod` wrapper that asks for confirmation before running any mutating kubectl verb against prod

## Acceptance criteria

- [ ] `kubectl config get-contexts` shows all three contexts
- [ ] Switching contexts changes the prompt
- [ ] `kprod delete pod x` asks for confirmation, `kprod get pods` doesn't
- [ ] Notes explain KUBECONFIG merging order

<details>
<summary>Hints (try without them first)</summary>

- `KUBECONFIG=a:b:c kubectl config view --flatten > merged`
- kube-ps1 or starship's kubernetes module
- Match verbs like apply, create, delete, edit, patch, replace, scale, drain in the wrapper

</details>

## Stretch goal

Make prod credentials short-lived by using an exec credential plugin that prints a token valid for 15 minutes.

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
