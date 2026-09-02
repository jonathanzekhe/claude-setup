---
name: Roadmap intégrations restantes Brvndlab (2026-05-02)
description: Liste exacte des intégrations à brancher après Whop. Skool retiré faute d'API webhook native.
type: project
originSessionId: e5e51002-1d47-4257-959e-cc08de4a79d7
---
**Restant à finaliser côté reporting (ordre validé 2026-05-02)** :

1. **iClosed** → webhook entrant existant à finaliser. Vérifier que l'URL `/api/webhooks/iclosed` reçoit bien les events `call.booked`, `call.qualified`, `call.no_show`, `call.sale`. Mapping vers tables `bookings` + `payments` (touchpoints type "booking" et "sale").
2. **Calendly** → OAuth déjà branché côté UI (`/api/auth/calendly/start`). Vérifier en prod que la callback aboutit, que le token est stocké, et qu'un webhook Calendly est créé pour les événements `invitee.created` et `invitee.canceled`.
3. **GoHighLevel** → webhook entrant générique multi-events. Setup URL côté GHL, parsing des payloads (contacts, opportunities, payments).

**Why:** Stripe + Whop sont en prod et validés. Pour boucler la promesse "un dashboard unique CA + Leads + Conversion + Cash" il manque ces 3 sources.

**Skool retiré (2026-05-02)** : pas d'API webhook marchande native côté Skool. Jonathan refuse explicitement de passer par Zapier/Make. À rebrancher si Skool ouvre des webhooks publics plus tard.

**How to apply:** Finir ces 3 dans cet ordre avant de toucher à autre chose côté reporting. Pas de scope creep en cours de route.

**Suite immédiate (après ces 3)** : basculer sur la **planification + publication native** dans le module Calendrier/Contenu. Voir memory `project_brvndlab_publication_native.md`.
