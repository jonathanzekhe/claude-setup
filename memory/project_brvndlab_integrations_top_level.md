---
name: Intégrations = section top-level, pas sous-partie de Settings
description: Validé 2026-04-22. Intégrations est une section de navigation à part entière, séparée de Settings.
type: project
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
Le module **Intégrations** est une section de navigation à part entière dans la sidebar Brvndlab, PAS une sous-partie de Settings.

**Why:** Jonathan considère les intégrations comme un hub stratégique de l'app, pas un détail de config. L'utilisateur peut plugger Stripe, Whop, YouTube, Instagram, TikTok, iClosed, Calendly, Notion, Slack, et à terme proposer de nouvelles intégrations à l'équipe Brvndlab. Le volume et l'importance justifient un espace dédié.

**How to apply :**

1. **Sidebar Brvndlab** : ajouter une entrée "Intégrations" en tant que section top-level (ou dans un groupe "Système").

2. **Page Intégrations** : layout dédié avec :
   - Catégories : Paiement / Réseaux sociaux / Booking / Productivité / Communication
   - Pour chaque intégration : logo, nom, statut (Connecté / Non connecté), bouton Gérer / Intégrer
   - **Calendrier unifié** : iClosed OU Calendly OU autre, jamais forcé sur un seul. L'utilisateur choisit sa solution, on se connecte via webhook standardisé.
   - **Bouton "Proposer une intégration"** : form à remplir qui envoie la demande à l'équipe Brvndlab (ex: Slack, Airtable, HubSpot, etc.)
   - **Architecture backend** : une couche générique d'intégrations via webhooks + API keys. Le pipeline data de Brvndlab peut pousser vers une intégration ajoutée (ex: nouveau lead → Slack channel).

3. **Retirer de Settings** : la sous-section "Intégrations" qui était dans Settings est supprimée. Settings reste pour le profil, compte, abonnement, apparence, notifications, Smart Links, offres, légal, déconnexion uniquement.

4. **Nomenclature** : toujours "Intégrations" jamais "Connexions" (cf `feedback_naming_integrations.md`).
