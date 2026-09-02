---
name: Exigence zéro bug sur le chat et infrastructure
description: Jonathan exige une infrastructure chat ultra fiable, zéro perte de message, zéro fuite entre conversations, zéro duplication. Tests de chaos obligatoires avant livraison.
type: feedback
---

Exigence de Jonathan validée le 2026-04-08 : **zéro bug sur le chat, non négociable**.

**Why:** Jonathan a des clients coachs qui utilisent Brvndlab comme outil de collaboration avec leurs monteurs. Si un message fuit vers la mauvaise conversation, est perdu, ou est dupliqué, c'est la crédibilité du SaaS qui tombe. Un coach qui perd un message important de son monteur arrête de payer.

**How to apply:**

Sur l'implémentation du chat et de toute feature temps réel :
1. **Pas de perte de message** : queue locale avec retry automatique en cas de coupure réseau. Messages stockés côté client jusqu'à confirmation serveur.
2. **Pas de doublon** : identifiant unique généré côté client avant envoi (idempotency key). Le serveur reconnaît et ignore les doublons.
3. **Isolation stricte entre conversations** : chaque message strictement lié à un couple d'utilisateurs en base. Jamais de jointure ambiguë qui pourrait faire fuiter un message vers la mauvaise conversation.
4. **Statuts clairs** : envoi, envoyé, livré, lu. Comme WhatsApp. Pas d'état ambigu.
5. **Tests de chaos avant livraison** obligatoires :
   - Couper le Wi-Fi en plein message
   - Envoyer 50 messages d'affilée
   - Envoyer le même message 10 fois (anti-doublon)
   - Basculer entre deux conversations rapidement
   - Ouvrir la conversation sur 2 onglets en parallèle
   - Perdre la connexion pendant l'envoi et la récupérer
6. Tant que TOUS ces tests passent, le chat n'est pas livrable à Jonathan.

**Applicable aussi à :**
- La synchronisation Kanban temps réel (Thomas déplace une card, Jonathan voit le changement, pas de fantômes de cards)
- Les notifications (ne jamais envoyer la mauvaise notif à la mauvaise personne)
- Le calendrier multi-utilisateurs quand plusieurs collaborateurs bougent des cards

**Stack recommandée :** Convex pour le temps réel (déjà en place dans Brvndlab). Convex gère nativement les 3 premiers points. Les tests de chaos sont à faire manuellement avant chaque release touchant au chat.
