---
name: Logique du module Leads Brvndlab
description: Validé 2026-04-22. Clarification du funnel, des capteurs d'email et du booking. C'est le lead qui agit, pas l'utilisateur.
type: project
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
Le module Leads suit une **logique de tracking passif** avec actions déclenchées **par le lead**, pas par l'utilisateur Brvndlab.

## Funnel standard

1. **Contenu publié** (YouTube, Instagram, TikTok, pub, etc.)
2. **Smart Link** inséré dans description / commentaire épinglé / bio. C'est un lien tracké par Brvndlab qui redirige vers :
   - Une **landing page avec opt-in** (pour capturer l'email)
   - Un **calendrier de booking** (iClosed ou Calendly)
   - Une **VSL** (Video Sales Letter)
   - Une **page de vente** directe
3. **Clic** sur le Smart Link → création d'un visitor anonyme (chaleur Cold)
4. **Opt-in** (soumission d'un formulaire sur la landing) → capture de l'email + éventuellement nom/téléphone → passage Warm
5. **Booking** d'un appel via iClosed/Calendly (synchronisé automatiquement avec Brvndlab via webhook) → passage Hot
6. **Appel réalisé** puis **vente** enregistrée (soit manuellement, soit via Stripe webhook)

## Capture des emails

**Jonathan ne récupère les emails que via opt-in**. Il n'y a pas de magie. Si le Smart Link pointe sur une page sans formulaire, le lead reste anonyme (visitor ID seulement).

## Booking des appels

Les appels sont bookés par le **lead**, pas par Jonathan. Via :
- **iClosed** (outil actuel principal, cf `project_brvndlab_iclosed_booking.md`)
- **Calendly** (alternative possible)
- Webhooks automatiques vers Brvndlab pour afficher l'appel dans "Appels à venir"

Jonathan ne clique jamais sur "Booker" pour un lead. Il peut par contre :
- **Envoyer son lien iClosed/Calendly** au lead (par email ou DM) pour l'inviter à prendre RDV
- **Voir ses appels à venir** en section dédiée
- **Préparer l'appel** en consultant la fiche du lead juste avant

## Actions valides depuis une fiche lead

À partir de la fiche d'un lead dans Brvndlab, les actions **réalistes** sont :

1. **Écrire au lead** (ouvre l'email composer, éventuellement avec templates)
2. **Envoyer le lien d'appel** (copie le lien iClosed/Calendly ou le pousse via email/DM)
3. **Ajouter une note interne** (contexte pour plus tard, ou pour partager avec collab)
4. **Consulter le parcours complet** (timeline des touchpoints)
5. **Voir ses transactions** (si achat(s) réalisé(s))
6. **Marquer manuellement une vente** (si la synchronisation Stripe n'est pas active)

**Actions à bannir** :
- "Booker un appel" comme si Jonathan créait le rendez-vous. C'est le lead qui book.
- "Appeler" comme si Brvndlab faisait des appels téléphoniques. Brvndlab n'est pas un dialer.

## Affichage "Comment ça marche"

Dans les zones où un utilisateur peut avoir un doute (fiche lead, section Appels à venir, stats leads), afficher une explication courte du fonctionnement, type tooltip ou callout léger, sans surcharger l'UI :
- "Les appels sont bookés directement par tes leads via ton iClosed/Calendly connecté."
- "Les emails sont capturés quand un lead soumet un formulaire d'opt-in sur une de tes landing pages."

Cette logique doit être limpide au premier regard. Si un utilisateur se demande "comment c'est arrivé là", c'est qu'on a raté la transparence.
