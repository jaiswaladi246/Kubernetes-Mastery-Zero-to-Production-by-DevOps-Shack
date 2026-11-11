<!-- devopsshack:header -->
> ☸️ **Kubernetes Mastery: Zero to Production** · by **DevOps Shack** · [YouTube](https://www.youtube.com/@devopsshack) · [Hindi channel](https://www.youtube.com/@shackverse) · [devopsshack.com](https://devopsshack.com)
<!-- /devopsshack:header -->

# A029 · PostgreSQL on a StatefulSet

| Level | Topic | Estimated time | Read first |
|---|---|---|---|
| 🔵 Intermediate | StatefulSets | 1–2 hours | [Module 08 · StatefulSets](../02-modules/08-statefulsets.md) |

## Scenario

The team wants a dev database inside the cluster that survives pod restarts.

## Your tasks

1. Deploy PostgreSQL as a StatefulSet with a headless Service, Secret and volumeClaimTemplates
2. Add readiness and liveness probes appropriate for Postgres
3. Create data, delete the pod, verify persistence
4. Take a logical backup with a Job using pg_dump

## Acceptance criteria

- [ ] Data survives pod deletion
- [ ] Backup file produced
- [ ] Probes don't restart the DB during slow startup

<details>
<summary>Hints (try without them first)</summary>

- Use PGDATA in a subdirectory of the mount to avoid lost+found issues

</details>

## Stretch goal

Replace your StatefulSet with the CloudNativePG operator and compare the features you get.

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
