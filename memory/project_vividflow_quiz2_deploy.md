---
name: project_vividflow_quiz2_deploy
description: Déploiement quiz VividFlow — alias domaine manuel obligatoire après vercel --prod
metadata: 
  node_type: memory
  type: project
  originSessionId: a54e13c0-71dc-4752-b4ae-c8503e4335a4
---

Quiz diagnostic VividFlow : repo `~/dev/vividflow-quiz2`, single-file `index.html`, projet Vercel `vividflow-quiz2` (pas de git, CLI-only). Domaine public : **quiz.vividflow.co** (sous-domaine de vividflow.co en DNS Third Party).

**PIÈGE DÉPLOIEMENT (2026-07-13) :** `vercel --prod --yes` crée bien un déploiement Production READY, mais **ne réassigne PAS** `quiz.vividflow.co` — le sous-domaine reste collé à l'ancien déploiement. Symptôme : le live ne bouge pas ("toujours rien") alors que le deploy a réussi.

**Fix obligatoire après chaque `vercel --prod` :**
```
vercel alias set https://<nouveau-deploiement>.vercel.app quiz.vividflow.co
```
Puis vérifier en live avec cache-buster `?v=$(date +%s)` + grep d'un marqueur CSS du fix.

Voir [[feedback_verify_until_live]] (push ≠ déployé) et [[feedback_always_link_preview_url]].
