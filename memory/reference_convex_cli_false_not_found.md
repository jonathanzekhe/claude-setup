---
name: reference-convex-cli-false-not-found
description: "Piège Convex : `npx convex run`/`function-spec` (CLI 1.34.1) renvoie 'Could not find function' à tort alors que la fonction EST déployée. Vérifier via dashboard ou HTTP direct, pas la CLI."
metadata: 
  node_type: memory
  type: reference
  originSessionId: 49dd6ee1-ffd4-4483-887f-3f7234c9704b
---

Sur Brvndlab (Convex prod `accurate-cormorant-297`, CLI locale 1.34.1 alors que 1.42.1 dispo), la commande `npx convex run rush:xxx` et `npx convex function-spec` renvoient de façon persistante et trompeuse `Could not find function for 'rush:xxx'. Did you forget to run npx convex dev?` — ALORS QUE la fonction est bel et bien déployée et fonctionnelle.

**Ne jamais conclure "la fonction n'est pas déployée" à partir de `convex run`/`function-spec` seuls.** Vérifier avec une source qui fait autorité :
1. **Dashboard Convex** (dashboard.convex.dev → projet Brvndlab → Production → Functions) : la liste réelle des modules/fonctions déployés.
2. **HTTP direct** (ce que l'app utilise vraiment via NEXT_PUBLIC_CONVEX_URL) :
   `curl -s -X POST "https://accurate-cormorant-297.eu-west-1.convex.cloud/api/run/<module>/<fn>" -H "Content-Type: application/json" -d '{"args":{...},"format":"json"}'`
   → `{"status":"success",...}` = la fonction existe et tourne. `{"status":"error",...}` avec un vrai message métier (pas "not found") = elle existe aussi.

Épisode 2026-07-09 : des heures perdues à diagnostiquer un faux "écrasement concurrent / autodeploy fantôme" sur le déploiement du module Rush batch 4. En réalité le déploiement avait réussi ; c'était la CLI qui mentait. Le compteur `function-spec | grep -c identifier` qui "oscillait" (90/146/179/268/363) était un artefact de lecture CLI, pas des déploiements concurrents. Le dashboard montrait tout rush présent, HTTP direct confirmait `resolveShare` en success.

Corollaire : mettre à jour la CLI Convex (`npm i convex@latest` dans brvndlab-app) éliminerait probablement ce faux négatif. Voir [[project_rush_video_library]] et [[feedback_convex_deploy_pitfalls]].
