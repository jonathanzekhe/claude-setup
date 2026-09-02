---
name: project-pulp-saas-fitness-duo
description: "PULP, SaaS privé fitness/nutrition 90 jours pour Jonathan + Rafaela (pulp-duo.vercel.app)"
metadata: 
  node_type: memory
  type: project
  originSessionId: 33c6ab07-fd8a-4306-bae5-4edd77730148
---

**PULP** : SaaS privé pour Jonathan et **Rafaela** (orthographe exacte, jamais "Raphaëla"), objectifs physiques sur 90 jours (démarré 2026-07-06, fin 2026-10-05). Aussi un test pour Rafaela (coach sportive + nutritionniste) en vue d'un usage client futur.

- **Live** : https://pulp-duo.vercel.app (Vercel, projet `pulp`, scope jonathanzekhe-4288s-projects, SSO protection désactivée)
- **Repo** : `~/dev/pulp` (Next.js 15 + Tailwind v4 + Convex)
- **Convex** : team jonathan-zekhe, projet `pulp`, dev `enduring-partridge-223`, prod `good-parakeet-988` (clé ANTHROPIC_API_KEY copiée depuis Brvndlab prod)
- **Features** : 2 profils sans mot de passe (switch avatar, localStorage), repas photo → IA calories/macros (claude-sonnet-5, tool use forcé car **le modèle ne supporte pas le préfill assistant**), poids + courbe duo, photos progression par semaine + comparaison 2 photos, calendrier vert/repos/rouge, objectifs éditables (fixés par Rafaela), récap hebdo IA, vue duo, jour de repos.
- **DA** : fruité premium, fond off-white, mangue = Jonathan, framboise = Rafaela, kiwi = entraîné, Bricolage Grotesque + Onest, radius 24/14/pill.
- Deploy : `vercel deploy --prod --yes` puis **re-pointer l'alias** `vercel alias set <deployment-url> pulp-duo.vercel.app` + `npx convex deploy -y --typecheck=disable` pour le backend.
- Validé par tribunal 10 juges (voir session 2026-07-06).
