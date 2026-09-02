---
name: Couleurs TOFU/MOFU/BOFU standardisées
description: Scellé 2026-04-24. TOFU=bleu, MOFU=amber jaune-brun, BOFU=rouge red. Cohérence globale dans toute la solution.
type: feedback
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
**Palette funnel unique pour tout Brvndlab :**

- **TOFU = bleu** (attirer, haut du funnel) → `bg-blue-50/100`, `text-blue-600/700`
- **MOFU = amber jaune-brun** (engager, milieu) → `bg-amber-50/100`, `text-amber-700` (texte volontairement brunâtre, pas or vif)
- **BOFU = rouge red** (convertir, action, bas) → `bg-red-50/100`, `text-red-600/700`

**Why :** Jonathan a validé 2026-04-24 en 2 passes. Première itération j'avais pris emerald pour MOFU, il a corrigé : "jaune brun, presque brun". Logique : rouge = action = BOFU ; amber = chaleur éducative sans concurrence visuelle avec le rouge ; bleu = fraîcheur découverte.

**How to apply :**

Chaque nouveau composant/page qui affiche un badge funnel doit utiliser cette palette exacte. Ne JAMAIS retomber sur :
- ❌ orange pour MOFU (trop proche du rouge BOFU)
- ❌ emerald pour MOFU (Jonathan a explicitement rejeté)
- ❌ rose pour BOFU (doit être red, pas rose)
- ❌ emerald pour BOFU

Si un nouvel écran mélange funnel + intensité (light/strong), garder la famille :
- MOFU strong → `bg-amber-500` / `text-amber-700`
- BOFU strong → `bg-red-500` / `text-red-700`

**Fichiers alignés (avril 2026) :**
- `calendar/page.tsx` (FUNNEL_COLORS + ratios bars)
- `content/page.tsx` (FUNNEL_BADGE_STYLES)
- `content/qa/[id]/page.tsx` (FUNNEL_STYLES)
- `dashboard/page.tsx` (funnelColor + stats bars)
- `content/guide-funnel/page.tsx` (FUNNEL_LEVELS + FORMAT_MATRIX headers)
- `content/new/filmed/page.tsx` (FUNNEL_STYLES)
- `content/new/idea/results/page.tsx` (FUNNEL_STYLES)
- `content/new/idea/explore/page.tsx` (funnel selector)
- `content/new/qa/page.tsx` (FUNNEL_STYLES)


**Complément 2026-08-25 (vocal Jonathan) :** la couleur appartient au funnel SEULEMENT. Le badge de FORMAT (REEL, VIDÉO, CARROUSEL, STORY, POST) reste NEUTRE (blanc sur bandeau sombre, gris sinon). Mettre le format en couleur a été explicitement rejeté (« c'est le format TOFU, MOFU ou BOFU qui doit avoir une couleur précise, c'est tout »). Attention aussi aux règles CSS du thème clair qui écrasaient les couleurs funnel sur les cartes du Calendrier (spécificité `html[data-bvh-theme=light] .cal .pcard-body .pcard-funnel`) — corrigé le 25/08.
