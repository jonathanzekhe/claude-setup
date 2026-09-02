---
name: Intégration calendrier générique
description: Validé 2026-04-22. iClosed, Calendly ou autre, pas forcé sur un seul outil. Brvndlab s'adapte à ce que l'utilisateur a déjà.
type: project
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
L'intégration calendrier pour booker des appels est **générique**. Brvndlab ne force jamais iClosed ni Calendly, l'utilisateur choisit.

**Why:** Chaque utilisateur a déjà son outil de calendrier préféré. Jonathan a iClosed, mais beaucoup de coachs/consultants utilisent Calendly, Google Calendar, Cal.com, etc. Forcer un seul outil = friction énorme, abandon possible.

**Comment ça marche techniquement :**

1. **Dans Intégrations**, l'utilisateur choisit son outil de booking parmi la liste disponible (iClosed, Calendly, Cal.com à terme) et clique "Intégrer".
2. L'utilisateur s'authentifie via OAuth ou fournit une clé API de son outil.
3. Brvndlab configure un **webhook** côté outil tiers qui envoie les événements booking → Brvndlab.
4. Quand un lead book un appel dans l'outil de l'utilisateur, le webhook arrive dans Brvndlab et crée un touchpoint "Booking" dans le parcours du lead + remonte l'appel dans "Appels à venir" sur le dashboard Leads.

**Dans l'UI :**
- Dans Intégrations, catégorie "Booking" liste les solutions supportées
- Dans le reste de l'app, afficher simplement "Booké via **[nom de ton outil connecté]**" au lieu de forcer "iClosed"
- Dans la section Appels à venir, kicker "Synchronisés depuis **[outil connecté]**"

**Ce qui évolue :** quand l'utilisateur change d'outil, on met à jour toutes les mentions automatiquement. Pas de hardcode sur iClosed dans l'UI.

**Règle associée :** cette logique s'applique aussi aux autres outils potentiellement multiples (CRM, email marketing, analytics, etc.). Toujours laisser le choix à l'utilisateur, jamais forcer.
