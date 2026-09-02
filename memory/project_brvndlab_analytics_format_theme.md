---
name: brvndlab-analytics-format-theme
description: "Analytics IG : lecture par format + thème (IA Haiku) + bloc « ce qui marche/ne marche plus », et taux d'engagement par vidéo YouTube. Live 19/08."
metadata: 
  node_type: memory
  type: project
  originSessionId: 100d0ff3-e583-486e-ade2-ef55a5f52457
  modified: 2026-08-19T10:54:48.197Z
---

Livré et déployé le 2026-08-19 (boucle corrective, 3-4 tests live). Suite du deck d'audit SooWei Goh : rendre l'analytique « pilotage » et non « reporting ».

**INSTAGRAM (convex/instagramAnalytics.ts + convex/instagramThemes.ts + InstagramContent.tsx)** :
- `getFormatBreakdown` / `getThemeBreakdown` (queries owner-scopées, 30 j par défaut, lecture RÉELLE de instagramMedia, AUCUN appel Graph). Engagement recalculé (jamais le champ engagementRate du schéma, non rempli) = (j'aime+comm.+partages+enreg.)/vues, MOYENNE par publication (pas ratio global). Story = taux null (pas de vues comparables). Format : Reel/Carrousel/Photo/Story via productType+mediaType (CAROUSEL_ALBUM distingué de IMAGE).
- `classerThemesInstagram` (Haiku claude-haiku-4-5-20251001, ANTHROPIC_API_KEY, copie fidèle de classerPostsLinkedIn social.ts). Liste FERMÉE THEMES_INSTAGRAM (Coulisses, Conseil, Témoignage client, Offre/promotion, Storytelling personnel, Inspiration/mindset, Éducatif/pédagogie, Divertissement). Écrit instagramMedia.theme/themeAt. Déclenché après CHAQUE sync (syncMine token+Zernio) et cron tous-comptes (_syncUnCompte). Résilience _noterResultat, reprise par lots (LOT 60), rien-à-classer=succès. Preuve live : 12/12 légendes de Raphaela classées, thèmes cohérents.
- Front : composant `LectureSemaine` inséré entre Contenu et Overview. Bloc « Ce qui marche, ce qui ne marche plus » (2 colonnes vert/route, chaque ligne = 1 chiffre 30 j, RÈGLE aucune ligne = ressenti). Barres par format et par thème. schema : instagramMedia.theme/themeAt.

**YOUTUBE (convex/social.ts getMyTopVideos + YtVideoCards.tsx)** : taux d'engagement PAR VIDÉO = (j'aime+commentaires)/vues, cohérent avec le benchmark chaîne. likeCount/commentCount étaient déjà dans la réponse API, juste non parsés.

**REPORTÉS (décision de périmètre, à statuer plus tard)** :
- Smart Links croisés avec les posts IG : AUCUN lien post IG → trackingLink n'existe (ni schéma ni UI). Chantier = nouveau champ mediaExternalId sur trackingLinks + picker Instagram dans CreateModal (aujourd'hui verrouillé YouTube). trackingLinks/trackingTouchpoints/getContentReport (convex/tracking.ts) existent mais getContentReport n'est branché nulle part.
- Taux d'engagement par post LinkedIn : le dénominateur (impressions/reach par post) existe chez Zernio mais n'arrive pas jusqu'à Metrics.tsx (alimenté par contentItems qui ne garde que likes/coms). Faut faire remonter Zernio par post. YouTube fait, LinkedIn reste.

**DÉBLOCAGE** : le déploiement était bloqué par un doc prod collaborators avec champ `sharedTodo` absent du validateur (drift, pas de ce chantier). Ajouté `sharedTodo: v.optional(v.boolean())` au schéma pour coller à la donnée. Voir [[feedback_metriques_croisees_reseaux]] (règle : porter chaque métrique sur tous les réseaux), [[brvndlab-instagram-ordre-lecture]].
