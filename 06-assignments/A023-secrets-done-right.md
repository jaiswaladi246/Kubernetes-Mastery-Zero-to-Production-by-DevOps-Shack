<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A023 · Secrets Done Right

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Configuration | 1–2 hours | [Module 06 · ConfigMaps & Secrets](../02-modules/06-configmaps-secrets.md) |

## Scenario

An audit found database passwords in plaintext env vars, in Git and in CI logs. Clean it up.

## Your tasks

1. Move credentials into a Secret mounted as files with mode 0400
2. Restrict `get secrets` RBAC to only the app's ServiceAccount pattern
3. Prove that a user with `create pods` can still read the secret and document the mitigation
4. Remove the secret from Git history in a scratch repo

## Acceptance criteria

- [ ] No plaintext credentials in manifests or env
- [ ] RBAC test results documented
- [ ] Escalation path explained
- [ ] Git history cleaned

<details>
<summary>Hints (try without them first)</summary>

- `git filter-repo --path secrets.yaml --invert-paths`
- Rotate the credential after any exposure

</details>

## Stretch goal

Replace the Secret with External Secrets Operator syncing from a vault.

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
