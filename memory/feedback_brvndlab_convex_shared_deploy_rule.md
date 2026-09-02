---
name: feedback_brvndlab_convex_shared_deploy_rule
description: "Plusieurs Claude/devs partagent le même Convex prod Brvndlab — toujours pull avant deploy, passer par deploy-brvndlab.sh"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 9d32f1c3-da16-457c-bc54-273b971a7eaf
---

Deux entités "Claude" (et Jonathan) travaillent sur le **même déploiement Convex prod** Brvndlab (`accurate-cormorant-297`). `convex deploy` ne merge pas : il **remplace tout le backend** par le dossier `convex/` local du déployeur. Déployer sans le travail de l'autre = l'écraser.

**Why :** déjà constaté le 2026-06-22 — le fix `brandDna` (promesse via Offre) + le composant `ExampleToggle` étaient déjà dans HEAD avant que je touche au code (l'autre Claude). Sans discipline, le dernier qui déploie sans pull annule l'autre.

**How to apply :**
- Source partagée = branche `recover/pipeline-darkmode-745bcd8` sur GitHub (cf. [[feedback_verify_deploy_lineage_before_prod]]). Commit + push après chaque édition.
- **Jamais `npx convex deploy` à la main.** Toujours passer par `~/dev/brvndlab-claude/deploy-brvndlab.sh` : il refuse si travail non committé, fait `git pull --rebase` AVANT, puis deploy Convex + Vercel. (`./deploy-brvndlab.sh convex` ou `vercel` pour cibler).
- Un seul deploy Convex à la fois (pas les deux Claude en parallèle).
- Pas de `seed`/`reset` Convex pendant que l'autre bosse (base partagée).
- Git/GitHub ne notifie PAS en temps réel : la protection vient du pull-avant-deploy, pas d'une alerte.
- Limite de mon accès : je n'ai pas pu lancer `convex deploy` le 2026-06-22 (pas de `CONVEX_DEPLOY_KEY` ni `CONVEX_DEPLOYMENT` dans `.env.local`). Le front part via Vercel, mais le back peut rester en retard tant que personne n'a lancé le script. Voir [[feedback_always_push_to_vercel]].
