---
name: Planification + publication native YouTube/IG/TT dans Brvndlab (roadmap)
description: Décision 2026-05-02 d'intégrer la publication directe depuis Brvndlab après que le reporting soit complet. Pas une intégration, une feature produit.
type: project
originSessionId: e5e51002-1d47-4257-959e-cc08de4a79d7
---
**Décision (2026-05-02)** : la publication directe (planifier + poster) sur YouTube, Instagram, TikTok depuis Brvndlab est **prochain gros chantier** après le bouclage du reporting (Whop ✅, Skool, iClosed, Calendly, GHL).

**Why:** Les OAuth YouTube/IG/TT déjà connectés pour les stats peuvent **réutiliser les mêmes tokens** pour publier. Une connexion = deux capacités (stats + publication). Évite à l'user de jongler avec un Buffer/Hootsuite externe. Renforce la promesse "tout dans un seul OS".

**How to apply** :
- **Pas une intégration** au sens page Intégrations. C'est une **feature produit** qui vit dans le module Calendrier (et/ou Contenu).
- La page Intégrations ne change pas, juste un liseré informatif sur les cartes Réseaux sociaux après connexion : "Connecté · Stats + Publication".
- Phase 1 : ajouter `publishStatus` + `publishTargets` à la table `contentItems`. Bouton "Programmer la publication" dans Calendrier. Job Convex scheduler qui déclenche les uploads via tokens OAuth.
- Phase 2 UX : caption AI par réseau, hashtag optim, best time to post, multi-format (1 long YT → clips IG/TT).

**Faisabilité technique** :
- YouTube Data API v3 : ✅ upload + métadonnées + thumbnail. Quota 10k/j, ~6 vidéos/jour/compte.
- TikTok Content Posting API : ✅ Direct Post depuis 2023. Approbation review TikTok requise pour Direct Post.
- Instagram Graph API : ⚠️ Reels + Feed uniquement, comptes Business/Creator (pas perso, pas Stories). 99% de l'ICP business est OK.
- LinkedIn UGC API : ✅ si on l'ajoute plus tard.

**À ne PAS oublier** : reprendre cette feature **après** que les 4 intégrations restantes (Skool, iClosed, Calendly, GHL) soient toutes en prod et validées. Pas avant.
