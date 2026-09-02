---
name: project-vividflow-diagnostic-funnel
description: Diagnostic IA VividFlow (clone du funnel Neocell) déployé sur vividflow-diagnostic.vercel.app
metadata: 
  node_type: memory
  type: project
  originSessionId: b2b4c2e5-cd22-4e9b-85a0-1606a4551cc5
---

Le 2026-07-09, réplique complète du diagnostic neocell.ai/diagnostic en identité VividFlow, déployée sur **https://vividflow-diagnostic.vercel.app** (projet Vercel `vividflow-diagnostic`, fichier unique index.html autonome).

Source scrapée : le quiz Neocell vit dans `/js/diagnostic-config-generic.js` + `/js/diagnostic-engine.js` (pas de SSR). Logique reprise à l'identique : gate form (prénom/email/entreprise/taille/secteur + RGPD) → 7 questions (Q1 multi-select plafonnée à 9 pts, Q2-Q7 single-select auto-advance 400ms, Q4/Q7 sans score, Q7 = +1 bonus) → loading 1,5s → résultats. Score /30 → 5 profils (Déconnecté 0-6, Curieux 7-12, En transition 13-18, Avancé 19-24, Prêt à scaler 25-30) + 3 quick wins par profil + estimation : `heures/sem = baseHours[taille] × (30 − score)/30`, valeur annuelle = heures × 35 € × 46 semaines.

DA appliquée : crème #FBF9F4, terracotta #E26137, olive, Fraunces + Inter + IBM Plex Mono, couleurs de profils transposées en gamme terre. Copy sans em-dash, vouvoiement, "on". CTA final pointe vers vividflow.co (pas de backend : aucune capture de lead réelle, mockup visuel).

**Why:** base réutilisable si VividFlow veut son propre funnel de diagnostic en acquisition.
**How to apply:** pour le rendre fonctionnel, brancher la gate + résultats sur un endpoint (l'original poste vers /api/partial-diagnostic et /api/submit-diagnostic). Voir [[project-vividflow]] et [[project_vividflow_acquisition_ete_2026]].
