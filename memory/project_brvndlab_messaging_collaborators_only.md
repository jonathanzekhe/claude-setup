---
name: Messaging Brvndlab, collaborateurs uniquement (mode SaaS)
description: Correction 2026-04-22. Le messaging ne contient plus de clients. Uniquement collaborateurs (1-à-1) et groupes. Les clients vivent dans leur propre solution.
type: project
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
Dans Brvndlab en mode SaaS, le Messaging est réservé aux **collaborateurs uniquement**. Plus aucune conversation avec des clients finaux.

**Why:** Jonathan a pivoté sur un modèle SaaS, les utilisateurs Brvndlab sont des coachs/consultants/infopreneurs (et non plus des clients directs de Jonathan). Ces utilisateurs ne veulent pas parler à leurs propres clients dans Brvndlab, ils veulent seulement :
- Tracker la data de performance des clients (via Analytics, Client Intel, etc.)
- Collaborer avec leur équipe de production (monteurs, mini makers, graphistes, assistants) pour produire leur contenu

Le client final d'un utilisateur Brvndlab utilise sa propre solution (l'app/produit du coach), pas Brvndlab.

**How to apply:**

1. **Filter tabs Messaging** : `Tous / Équipe / Groupes / Archivés`. Pas de tab "Clients".

2. **Sections du listing** : Épinglés / Équipe (1-à-1) / Groupes / Archivés. Jamais de section "Clients".

3. **Note du jour** : reste disponible mais devient une **note épinglée pour un collaborateur** (directive clé que le collab verra en haut de son espace). Plus de flux vers "Dashboard client".

4. **Cette règle annule et remplace** le principe du fichier `project_brvndlab_coach_client_communication.md` qui parlait de "Chat + Note du jour coach-client". Ce fichier est obsolète.

5. **Collaborateurs possibles** : monteurs, mini makers, graphistes, rédacteurs, assistants, ghostwriters. Pas d'accès Brand OS mais accès Messaging + Calendrier + Contenu selon leurs permissions.

6. **Groupes** : un groupe Brvndlab = l'utilisateur + plusieurs collaborateurs (ex "Équipe vidéo" = toi + monteur + mini maker + graphiste). Jamais de client dans un groupe.

7. **Conséquence pour d'autres modules** : la feature de communication coach-client doit être retirée du Dashboard client (elle n'a plus lieu d'être). À vérifier au moment du rework final.
