---
name: feedback_brvndlab_titre_court_brainstorm
description: "Règle de titre validée pour les angles de brainstorm Brvndlab — court, une idée, une accroche, jamais de deux-points qui déballe l'explication."
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 26a6f39e-8a8d-4598-9f9f-c40e275656ec
---

Le titre d'un angle de brainstorm (champ `angle` dans le prompt, sauvé en `title`) suit une RÈGLE STRICTE validée par Jonathan le 2026-06-19 : court (6 à 12 mots, une ligne), UNE seule phrase, UNE seule idée, une vraie accroche. INTERDIT : les deux-points suivis d'une explication, et coller deux idées. On garde l'accroche, on COUPE l'explication (le détail va dans `central`, jamais dans le titre). Mais pas de titre vague non plus ('Le contenu', 'Une génération').

**Why** : sur sa capture, un titre type « Pourquoi ton contenu attire des fans mais pas des clients : le divertissement remplit ton agenda de prospects sans budget » manquait de clarté. L'ancien prompt disait l'inverse (« vise 8 à 18 mots, ne sacrifie jamais le sens pour faire court ») → titres trop longs. Il a refusé une forme de titre différente par catégorie (trop mécanique, casse l'authenticité, cf. [[project_brvndlab_brainstorm_from_radar]]).

**Calibrage AVANT → APRÈS validé** : « Pourquoi ton contenu attire des fans mais pas des clients : … » → « Pourquoi ton contenu attire des fans, mais pas des clients. » | « La liberté quand tu es entrepreneur, ce n'est pas de ne pas travailler, c'est de choisir sur quoi tu travailles » → « La liberté, ce n'est pas arrêter de travailler. »

**Le bouton « Re-enrichir » de /admin/costs n'a rien changé (2026-06-19)** — méthode qui MARCHE pour corriger les angles existants sans passer par lui : `npx convex export` la table `angles` (deployment `prod:accurate-cormorant-297`), lire les `transcript`/`central`, fabriquer titre+businessCategory à la main, puis `cd brvndlab-app && CONVEX_DEPLOYMENT="prod:accurate-cormorant-297" npx convex import --table angles --replace --format jsonLines <fichier> --prod -y`. L'export préserve `_id`/`_creationTime` donc --replace garde l'identité des angles. Toujours garder l'export d'origine comme backup. Catégories attribuées le 2026-06-19 : rap→Marché, contenu/clients→Conversion, parfum→Positionnement, sport→Autorité. Si un futur angle arrive sans catégorie : relire le transcript et attribuer pareil.

**How to apply** : règle posée dans 2 endroits — `brvndlab-app/src/app/api/brainstorm-explore/route.ts` (champ `angle`, futurs brainstorms) et `brvndlab-app/src/app/api/admin/angles/backfill/route.ts` (raccourcit les titres EXISTANTS via Sonnet + régénère businessCategory, ce qui re-catégorise aussi les cartes grises « ANGLE »). Le backfill se lance en cliquant « Re-enrichir » sur app.brvndlab.com/admin/costs (founder-only, je ne peux pas le déclencher en CLI). La mutation `angles.backfillEnrich` accepte `title` (en mode force) — déployé sur Convex prod `accurate-cormorant-297`. Carte d'angle = titre seul désormais (cf. cartes épurées). Voir [[feedback_convex_deploy_pitfalls]] pour le deploy Convex (`--typecheck=disable`).
