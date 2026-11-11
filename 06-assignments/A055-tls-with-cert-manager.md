<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A055 · TLS with cert-manager

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Ingress & Gateway API | 1–2 hours | [Module 14 · Ingress & Gateway API](../02-modules/14-ingress-gateway-api.md) |

## Scenario

Your site needs HTTPS that never expires.

## Your tasks

1. Install cert-manager
2. Create a self-signed ClusterIssuer and a CA issuer
3. Issue a certificate for your ingress
4. Force a renewal and watch the secret change
5. Document how ACME HTTP-01 and DNS-01 differ

## Acceptance criteria

- [ ] HTTPS works with your CA
- [ ] Renewal demonstrated
- [ ] HTTP-01 vs DNS-01 explained

<details>
<summary>Hints (try without them first)</summary>

- `cmctl renew <cert>` or delete the secret to trigger reissue

</details>

## Stretch goal

Use Let's Encrypt staging with DNS-01 on a real domain.

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
