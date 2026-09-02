---
name: Brvndlab radius hierarchy validée 2026-05-09
description: Hiérarchie corner radius scellée — cards 28px, boutons primaires 16px, badges/pills/status 8px (rounded-lg). Pas de rounded-md sur badges.
type: project
originSessionId: f1f3c685-a9e8-4d3e-a97b-a934c6629003
---
Hiérarchie corner radius validée pour Brvndlab (2026-05-09, après audit vidéo Juxtopo "7 UI/UX mistakes").

**3 paliers, ratio 2x à chaque saut** :
- **Cards / panneaux** : `rounded-[28px]` ou `rounded-[24px]` (sidebar)
- **Boutons primaires / inputs / surfaces actionnables** : `rounded-2xl` (16px)
- **Badges / pills / status / tags / micro-utilitaires** : `rounded-lg` (8px)

**Règle stricte** : tout composant qui matche le pattern badge (text-[9-11px] + uppercase + small padding + bg-{color}-50/100) DOIT être à `rounded-lg`. Pas de `rounded-md` (6px), pas de `rounded-xl` (12px) sur badges.

**Exception conservée** : `rounded-full` autorisé sur pills 100% pill-shaped (statuts type "En cours" avec dot animé). C'est un choix de design language, pas une incohérence.

**Why** : Linear/Vercel/Notion/Stripe Dashboard sont à 6-8px sur badges/pills. Hiérarchie 28→16→8 crée un signal cognitif net (objet principal vs surface actionnable vs marqueur utilitaire). 10/12px se confondent avec les boutons primaires (16) et l'œil hésite. 10px est un orphelin Figma hors Tailwind, génère un token inutile. Décision prise après brainstorm 3 options A/B/C, Jonathan a validé B (8px).

**How to apply** : 
- Lors de toute nouvelle UI badge/pill/status/tag → `rounded-lg`
- Lors de tout audit UI → grep `rounded-md` + pattern uppercase = candidat à standardiser
- Boutons (text-[11px]+, px-3+, py-2+) restent à `rounded-xl` ou `rounded-2xl` selon hiérarchie
- Cards et panneaux ne bougent pas

**Migration appliquée 2026-05-09** : ~25 occurrences converties dans 10 fichiers (leads, CollaboratorDrawer, messaging, admin/integration-requests, brainstorm-radar, ScheduleButton, radar, brand-os, content/radar-picks, collaborateurs). Déploiement prod dpl_BjX2kwBKqdQfRZyzDrtW8xC2fzpM aliasé app.brvndlab.com.
