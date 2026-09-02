---
name: project-brvndlab-linkedin-audience-dma-fallback
description: "Audience LinkedIn de la home — scraping mort (999), repli relations DMA déployé, mais app linkedin-dma DÉSACTIVÉE côté LinkedIn (401 DISABLED_APPLICATION), à réactiver dans le portail dev"
metadata: 
  node_type: memory
  type: project
  originSessionId: 097a5085-b470-482a-9c78-38ee462ad986
  modified: 2026-08-02T07:24:59.110Z
---

État au 2026-08-02 (commit dc4a76c9, déployé Convex prod accurate-cormorant-297) :

- « Mon audience » (home) = YouTube + Instagram + LinkedIn ; « Mes vues » = YouTube SEUL, par design (aucune API n'expose des vues au niveau compte pour IG/LinkedIn).
- Les followers LinkedIn venaient d'un scraping JSON-LD du profil public → HTTP 999 systématique depuis les IP serveur ET locales : `followersCount` n'a JAMAIS été écrit, LinkedIn pesait 0 en silence.
- Repli validé par Jonathan (02/08) : compter les RELATIONS via le domaine CONNECTIONS du Member Snapshot API (app DMA), 1 appel via `paging.total`. Scraping des vrais abonnés toujours prioritaire ; garde de fraîcheur 12 h (la home déclenche `refreshMyLinkedInAudience` à chaque chargement) ; 404 snapshot = « archive indisponible », PAS 0 relation — on n'écrit rien (un faux zéro a été écrit une fois sur le compte client Dauphine avant ce fix, resté en base, sera écrasé à la prochaine vraie lecture).
- BLOCAGE EXTERNE : le token DMA de Jonathan renvoie 401 `DISABLED_APPLICATION` (code 65606) sur TOUS les domaines snapshot → l'app LinkedIn `linkedin-dma` est désactivée côté LinkedIn. Ça casse aussi l'import de posts (Mémoire). Action Jonathan : réactiver l'app dans le portail développeur LinkedIn, puis relancer `social:refreshAllLinkedInAudience`.
- Code mort repéré : `_listAccountsToSnapshot` (convex/contentMetrics.ts:406) calcule subscribers SANS LinkedIn mais n'est appelée nulle part — non touché (périmètre strict).
- CLI : `env -u VERCEL CONVEX_DEPLOYMENT=prod:accurate-cormorant-297 npx convex@1.42.1 run|deploy|data` marche depuis le repo (le VERCEL=1 de .env.local fait dérailler le CLI sinon). Voir [[feedback-convex-cli-1341-lies-use-1421]].
