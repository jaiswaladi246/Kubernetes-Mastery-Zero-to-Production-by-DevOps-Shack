#!/usr/bin/env bash
# Kubernetes Mastery: Zero to Production · by DevOps Shack · https://devopsshack.com · https://www.youtube.com/@devopsshack
t() { if kubectl -n "$1" exec "$2" -- curl -s -m 2 -o /dev/null "$3"; then echo "✅ $2 ($1) -> $3"; else echo "❌ $2 ($1) -> $3"; fi; }
t lab15 frontend http://api.lab15
t lab15 frontend http://db.lab15
t lab15-other attacker http://api.lab15
kubectl -n lab15 exec api -- sh -c 'curl -s -m 2 -o /dev/null http://db.lab15 && echo "✅ api -> db" || echo "❌ api -> db"'
