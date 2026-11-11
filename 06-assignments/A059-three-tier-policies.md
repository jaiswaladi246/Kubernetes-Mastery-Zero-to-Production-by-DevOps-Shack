<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A059 · Three-Tier Network Policies

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | Network Policies | 1–2 hours | [Module 15 · Network Policies](../02-modules/15-network-policies.md) |

## Scenario

A classic web/api/db app must follow least privilege at the network layer.

## Your tasks

1. Write policies so only web talks to api on 8080 and only api talks to db on 5432
2. Allow Prometheus from the monitoring namespace to scrape all three
3. Block access to the cloud metadata IP
4. Document each policy's intent

## Acceptance criteria

- [ ] Policies enforce the intended graph
- [ ] Monitoring scrape works
- [ ] Metadata IP blocked

<details>
<summary>Hints (try without them first)</summary>

- Use kubernetes.io/metadata.name to select namespaces

</details>

## Stretch goal

Visualise the allowed graph from your YAML with a small script or tool.

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
