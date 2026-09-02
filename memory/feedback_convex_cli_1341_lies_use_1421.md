---
name: feedback_convex_cli_1341_lies_use_1421
description: "Convex CLI 1.34.1 dit \"Deployed\" sans pousser le code ; déployer via convex@1.42.1"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 9f30526b-7410-4588-91e8-2a967de4205a
---

Le Convex CLI **1.34.1** (version pinnée dans brvndlab-app/package.json) **ment au déploiement** : `npx convex deploy` affiche « ✔ Deployed Convex functions » avec diffs vides, mais **les nouvelles fonctions n'arrivent jamais en prod**. Constaté 2026-07-12 : `getMyTotalViews`/`getMyAudience` (session antérieure) + mes nouvelles fonctions étaient toutes absentes du déploiement live malgré des « Deployed » répétés.

**Preuve du diagnostic** : `--debug-bundle-path /tmp/x` montrait que le bundle CONTENAIT bien les fonctions (grep OK dans isolate/*.js) → le bug est dans l'étape de push, pas le bundler.

**Fix qui marche** : déployer avec le CLI courant sans toucher package.json :
`CONVEX_DEPLOYMENT="prod:accurate-cormorant-297" npx --yes convex@1.42.1 deploy --typecheck=disable --yes`
La 1.42.1 identifie clairement `jonathan-zekhe:brvndlab:production` et pousse réellement.

**How to apply** : (1) après tout `convex deploy`, VÉRIFIER via `npx convex@1.42.1 run <module>:<fn>` — si « Could not find function », le push a échoué. (2) Utiliser `convex@1.42.1` pour déployer. (3) Suggérer à Jonathan de bumper `convex` dans package.json. Toujours `--typecheck=disable` (erreurs préexistantes radarActions/radarEnrichment/youtube-callback bloqueraient sinon).

Complète [[reference_convex_cli_false_not_found]] et [[feedback_convex_deploy_pitfalls]].
