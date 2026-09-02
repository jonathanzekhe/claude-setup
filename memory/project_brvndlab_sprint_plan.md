---
name: Brvndlab Sprint Plan - Modules Analytiques/Recherche/Radar
description: Plan de build 3 sprints pour finaliser backend Analytiques, Recherche et Radar avant tout frontend
type: project
originSessionId: d20c1ad6-25c2-4284-9ee1-b6f59ff05e86
---
Plan valide le 2026-04-21 par Jonathan. Ordre strict pour backend-first approach.

**Why:** Jonathan a explicitement decide de finir TOUT le backend avant de toucher le frontend. Les 3 modules (Analytiques, Recherche, Radar) dependent des API sociales mais on peut avancer intelligemment en separant ce qui necessite OAuth de ce qui ne le necessite pas.

**How to apply:** Suivre cet ordre strict. Ne pas commencer un sprint avant d'avoir fini le precedent. Ne pas toucher au frontend tant que Sprint 3 n'est pas livre.

## Sprint 1 - Backend sans OAuth (en cours)
1. Schema `contentMetrics` - prete a recevoir les stats per-contenu (vide pour l'instant)
2. Schema `researchQueries` + `researchResults` + integration IA (Perplexity/Tavily)
3. Schema `marketSignals` + `competitorTracking` + scan YouTube Data API public

## Sprint 2 - OAuth externes (apres Sprint 1)
4. YouTube OAuth + remplissage contentMetrics avec vraies stats privees
5. TikTok OAuth + stats videos courtes

## Sprint 3 - Instagram (apres pages legales publiees)
6. Privacy policy + CGU + mentions legales sur brvndlab.com
7. Instagram OAuth via Meta Review (1-2 semaines validation)

## Sprint 4 - Frontend (tout a la fin)
8. UI de tous les modules backend construits

## Notes critiques
- Table `memoireDoree` existante traque des users, pas le marche. A migrer/renommer vers `marketSignals` pour Radar.
- YouTube Data API v3 PUBLIC (trending, chaines publiques) ne necessite PAS d'OAuth, juste une API key.
- Instagram EXIGE privacy policy publiee AVANT de soumettre a Meta Review.
