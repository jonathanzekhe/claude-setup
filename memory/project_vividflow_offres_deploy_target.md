---
name: project_vividflow_offres_deploy_target
description: vividflow.co/offres est servi par le projet Vercel site-mockups (PAS vividflow-thank-you-da)
metadata: 
  node_type: memory
  type: project
  originSessionId: 445fdd04-7aec-441e-9250-c18303792262
---

**vividflow.co/offres vit dans le projet Vercel `site-mockups`, PAS `vividflow-thank-you-da`.**

Le domaine vividflow.co est aliasé au projet **site-mockups** (`~/dev/site-mockups`, projectId prj_r2dBtoTZK6EVvrkBP7XqWg0oJKkL). Le routing se fait via `~/dev/site-mockups/vercel.json` : rewrite `/offres` → `/offres.html`. Donc la page live = `~/dev/site-mockups/offres.html`.

**Piège rencontré (2026-07-14) :** j'ai d'abord bossé et déployé dans `~/dev/vividflow-thank-you-da/offres.html` (qui a aussi un offres.html + son propre projet Vercel), mais ça ne touchait PAS le live car le domaine pointe sur site-mockups. Toujours vérifier `vercel inspect vividflow.co` (ou comparer le HTML live avec le fichier local) AVANT de déployer.

**Déploiement :** `~/dev/site-mockups` n'est PAS un repo git → `cd ~/dev/site-mockups && vercel deploy --prod` (CLI direct). C'est un projet qui héberge TOUT le site (quiz, funnel, pages), donc ne toucher QUE le fichier ciblé et vérifier le live jusqu'au bout (curl vividflow.co, cache MISS + age:0).

Refonte /offres finalisée et LIVE (2026-07-14) : accordéon 3 étapes, audit offert, orchestrateur cliquable + définition, 6 agents cas d'usage, motion, section budget briques, 4 principes. Repo nettoyé de toute trace concurrent (Kalvi/Neocell). Voir [[project_vividflow_offres_etape1_sealed]].