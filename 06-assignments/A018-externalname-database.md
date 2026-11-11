<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A018 · ExternalName for an External Database

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Services | 1–2 hours | [Module 05 · Services](../02-modules/05-services.md) |

## Scenario

Apps reference a managed database by a long cloud hostname. You want them to use `orders-db` and switch providers without touching app config.

## Your tasks

1. Create an ExternalName Service pointing at an external hostname
2. Create a selector-less Service with a manual EndpointSlice pointing at an IP
3. Show both resolving from a pod
4. Explain the TLS hostname verification gotcha with ExternalName

## Acceptance criteria

- [ ] Both services work from a pod
- [ ] Notes explain why HTTPS clients may fail certificate checks through ExternalName

<details>
<summary>Hints (try without them first)</summary>

- ExternalName returns a CNAME; the client still connects to the external name's IP and sends `orders-db` as SNI/Host unless configured

</details>

## Stretch goal

Use the selector-less Service to route to a legacy VM during a migration, then cut over to in-cluster pods by adding a selector.

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
