<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A021 · ConfigMaps as Env and Files

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟢 Beginner | Configuration | 45–60 min | [Module 06 · ConfigMaps & Secrets](../02-modules/06-configmaps-secrets.md) |

## Scenario

An app needs 12 config values and two config files, different per environment.

## Your tasks

1. Create a ConfigMap from literals, an env file and two files
2. Consume values with env, envFrom and a volume
3. Mount only one key with items/path
4. Mount a file into an existing directory with subPath and explain the update caveat

## Acceptance criteria

- [ ] All three consumption methods work
- [ ] You can show which ones update live
- [ ] subPath limitation documented

<details>
<summary>Hints (try without them first)</summary>

- `kubectl create configmap x --from-env-file=app.env --from-file=nginx.conf`

</details>

## Stretch goal

Generate the ConfigMap with Kustomize configMapGenerator and show the hashed name.

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
