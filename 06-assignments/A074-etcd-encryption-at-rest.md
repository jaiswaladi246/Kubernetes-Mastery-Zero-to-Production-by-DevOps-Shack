<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A074 · Encrypt Secrets at Rest

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🟣 Advanced | Secrets Management | 2–4 hours | [Module 18 · Secrets Management in Production](../02-modules/18-secrets-management.md) |

## Scenario

An auditor asks whether Secrets are encrypted in etcd. They aren't.

## Your tasks

1. On a kubeadm or kind cluster, read a Secret directly from etcd to prove it's plaintext
2. Configure EncryptionConfiguration with aescbc or secretbox
3. Rewrite all Secrets
4. Read from etcd again to prove encryption

## Acceptance criteria

- [ ] Before/after etcd output captured
- [ ] All existing Secrets re-encrypted
- [ ] Key rotation procedure documented

<details>
<summary>Hints (try without them first)</summary>

- `etcdctl get /registry/secrets/<ns>/<name>
- hexdump -C
- head`

</details>

## Stretch goal

Use a KMS v2 provider (e.g. a local KMS plugin) instead of a static key.

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
