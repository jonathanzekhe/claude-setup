---
name: Vision Messaging Brvndlab
description: Le Messaging Brvndlab doit remplacer WhatsApp/Telegram pour la relation coach-client-collaborateurs. Scope validé 15 avril 2026.
type: project
originSessionId: 1df69724-cc9f-4824-aff8-7c74c4ae7327
---
## Vision : Messaging interne = remplacement de WhatsApp

Jonathan ne veut plus utiliser WhatsApp/Telegram avec ses clients et collaborateurs. Tout passe par Brvndlab Messaging.

**Pourquoi c'est stratégique :**
- Conversations coaching restent dans le contexte produit (pas dans un canal externe)
- Historique conservé par client, retrouvable
- Contrôle permissions et confidentialité
- Pas de données qui fuitent vers Meta

## Architecture des chats

**1. Chats 1-à-1 :**
- Coach (Jonathan) ↔ Client (entrepreneur accompagné)
- Client ↔ Chacun de ses collaborateurs (monteur, assistant, graphiste)
- Coach ↔ Ses propres collaborateurs (CSM, sous-coach)

**2. Chats de groupe ad hoc :**
- Client + ses collaborateurs (ex : client + monteur + graphiste sur un projet)
- Coach + son collaborateur + un client (ex : coach + CSM gérant un client)
- Permissions : le créateur du groupe gère les membres

**3. Permissions strictes :**
- Un collaborateur d'un client A ne voit RIEN du client B
- Les conversations coach-client restent privées (pas de fuite vers collaborateurs)
- Le Brand OS d'un client n'est jamais visible à ses collaborateurs

## Section Messagerie

UI avec 2 onglets (ou plus selon le rôle) :
- `Clients` (si coach) ou `Coach` (si client)
- `Collaborateurs` (équipe interne)
- Groupes apparaissent dans leur onglet respectif

## Notifications (WhatsApp-like)

- Badge rouge sur la sidebar Messagerie avec compte non lu
- Toast in-app + son à la réception d'un message
- Browser Push (Web Push API + Service Worker) pour utilisateurs offline
- Email digest si inactif plus de X minutes
- Préférences par utilisateur (mute groupe, son ON/OFF)

**Why:** remplacer vraiment WhatsApp nécessite la ping sonore/visuelle immédiate. Sans ça les gens retournent sur WhatsApp par réflexe.

## Phasing (validé 15 avril 2026)

**Phase 1 : Collaborateurs (1 session, indépendant)**
Audit + fix du flow d'invitation existant (ShareButton → email → landing).

**Phase 2 : Messaging 1-à-1 (2-3 sessions)**
Coach-Client + Client-Collaborateur + Coach-Collaborateur. Note du jour remonte au Dashboard. Notifications in-app minimales (badge + toast + son).

**Phase 3 : Groupes (1-2 sessions)**
Création de groupes ad hoc, gestion des membres, mix coach/client/collaborateur.

**Phase 4 : Notifications avancées (1 session)**
Browser Push + email digest + préférences.

## Post-MVP (pas dans ce chantier)

- Appels voix/vidéo (WebRTC, complexité 10x)
- Messages vocaux (audio files)
- Réactions emoji
- Threads / réponses dans un message

**How to apply:**
- Quand on travaille sur Messaging, toujours se rappeler que c'est un remplacement de WhatsApp, pas juste un commentaire de tâche. Exigence sur latence, notifications, fiabilité.
- Les notifications Messaging viennent AVEC le Messaging (phases 2 et 4), pas à la fin du SaaS.
- Les autres notifications (contenu posté, digest hebdo, etc.) restent pour plus tard.
- Référer à `feedback_zero_bug_chat.md` : queue locale, idempotency, isolation stricte obligatoires.
