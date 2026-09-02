---
name: project_brvndlab_memoire_universelle_contenus
description: "Mémoire universelle des contenus — recherche à vie de tout contenu passé (phase 1 faite, phase 2 à venir)"
metadata: 
  node_type: memory
  type: project
  originSessionId: 85669be3-5f8f-465a-b4ca-9c318860b9c4
  modified: 2026-07-26T15:44:22.839Z
---

Brvndlab, sealed 26/07/2026. Objectif : quand Jonathan brainstorme ou refond un contenu et mentionne un contenu passé (« reprends la structure de la série X », « le script qui m'a le plus rapporté », « celui d'il y a 3 mois »), l'IA le RETROUVE. Mémoire universelle par compte, à vie, même publié/archivé.

**Décisions scellées (brainstorm) :**
- Elle TROUVE, tu VALIDES : recherche puis proposition « tu parles de ça ? », clic pour confirmer (pas de sélection manuelle obligatoire, pas de devinette dans le dos).
- 4 entrées de recherche : par SENS (mots-clés), par TEMPS (hier/3 mois), par PERFORMANCE (vues/argent), par LEVIER qui a marché (hook/angle — phase 2+).
- Fil des versions : garder l'ancienne version d'un contenu refondu, BACKEND ONLY (jamais à l'écran, accessible sur demande) — phase 2+.
- Recherche par MOTS-CLÉS (Convex full-text natif), pas d'embeddings pour l'instant (évolutif).
- Isolation stricte par compte OBLIGATOIRE (inquiétude 10k users) — validée absolue par tribunal.

**PHASE 1 FAITE (socle recherche)** dans `convex/contentItems.ts` :
- Champ `searchText` (titre + texte extrait du JSON slides/sections) sur contentItems + `.searchIndex("search_content", {searchField:"searchText", filterFields:["clerkUserId","status"]})`.
- Maintenu à chaque écriture : create/update ET les 5 chemins backend (brainstormRadar, youtubeChannels insert+resync, social.ts import LinkedIn ×2, radarPicks) via `buildSearchText` exporté. Backfill `contentItems:backfillSearchText` lancé (121 contenus).
- Queries : `searchMemory` (mots-clés + filtres temps/format/statut, vivier 64 avant filtrage), `topByPerformance` (vues/likes via contentMetrics), `getMemoryContent` (contenu complet après confirmation). Toutes isolées par `resolveOwnerClerkUserId`.
- Vérifié en prod sur le compte de Jonathan (recherche « entreprise employé » retrouve ses contenus archivés). Tribunal 2 agents : isolation absolue + couverture écritures OK.

**PHASE 2 — REFONTE FAITE (26/07)** : mécanique validée = l'IA DÉTECTE + propose des CHIPS CLIQUABLES (décision Jonathan, pas de reformulation IicNaturelle à 2 appels). Dans `api/refonte-content` : le prompt apprend à l'IA à émettre `contentSearch` (mots-clés) quand tu évoques un contenu passé → l'API lance `searchMemory` → renvoie `contentMatches` → le panneau `RefonteInterview` affiche des chips (titre + « il y a X », desktop + mobile) → clic = `getMemoryContent` charge le contenu complet → injecté comme `referenceContent` au tour suivant (bloc CONTENU DE RÉFÉRENCE). Vaut pour script/carousel/story (panneau partagé). Tribunal : isolation absolue confirmée ; 2 bugs pickMatch corrigés (res.ok, null-content). `pickMatch` fait un 2e fetch direct (pas via send), gardé par loading/loadingRef.

**PHASE 2 — BRAINSTORM PRINCIPAL FAIT (26/07)** : même mécanique dans `api/brainstorm-explore` (chat Lya d'idéation) via un MARQUEUR `[CONTENT_SEARCH: mots-clés]` dans le message (parsé comme `[CLARITY:N]`, retiré du texte) -> searchMemory -> contentMatches -> chips dans `idea/explore/page.tsx` (desktop ET mobile — bug rattrapé : d'abord mobile seulement). Clic -> getMemoryContent -> referenceContent injecté. `handleSend` refactoré avec `overrideMessage?` (envoi programmatique, guard de précédence vérifié OK par tribunal). Tribunal : isolation absolue, pas de régression.

**PHASE 2 RESTE À FAIRE** : `topByPerformance` exposé dans le chat (« le contenu qui a le mieux marché » -> tri par vues). + le « pourquoi ça a marché » (levier : hook/angle — brique lourde, analyse des contenus performants). + le fil des versions backend (garder l'ancienne version d'un contenu refondu, backend only). Éventuellement l'interview Brand OS. Voir [[project_brvndlab_memoire_doree_arme]] [[project_brvndlab_seconde_brain_comment_ecrire]].
