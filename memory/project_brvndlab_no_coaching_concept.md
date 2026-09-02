---
name: Brvndlab SaaS, zéro concept coaching interne
description: Validé 2026-04-22. Brvndlab est un SaaS, il n'y a PAS de rôle "Coach" dans l'app. Toute surface dédiée au coaching est supprimée.
type: project
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
Brvndlab est un produit SaaS. Il n'existe **AUCUN rôle "Coach" à l'intérieur de l'application**. Aucun espace coach, aucun onglet coach, aucun flow coach-client dans Brvndlab.

**Why:** Jonathan a pivoté. Au départ Brvndlab était pensé comme un outil qu'un coach utilisait pour suivre SES clients dans un cadre coaching. Cette logique est morte. Aujourd'hui :
- L'utilisateur Brvndlab est un infopreneur / consultant / créateur (il PEUT être coach dans son business perso, mais Brvndlab ne gère pas ça)
- Il utilise Brvndlab pour piloter son personal branding, son contenu, sa data de performance
- Ses propres clients finaux n'ont pas d'interface dans Brvndlab (pas de chat, pas de dashboard client, pas de note du jour client)
- Ses collaborateurs (monteur, mini maker, graphiste, ghostwriter, etc.) peuvent être invités pour la production mais ne sont pas des "clients"

**How to apply :**

1. **Aucun mockup, aucun brainstorm, aucune page "Coach"** dans le futur. Si on croise une ancienne référence à "Coach", on la retire sans demander.

2. **Vocabulaire** : éviter "coach" partout. Dire "l'utilisateur" ou "toi" dans le copy app. Le mot peut exister dans la communication marketing si c'est le persona cible, mais pas dans l'app.

3. **"Dashboard client", "Note du jour client", "Communication coach-client"** → tout ça est obsolète. Les éventuels reliquats dans le code sont à nettoyer au rework final.

4. **Clients de l'utilisateur** : ils restent dans la data (Analytics, Client Intel, Memoire dorée) car l'utilisateur veut **tracker** leur performance, mais il n'y a **aucune communication directe** entre l'utilisateur Brvndlab et ces clients à travers Brvndlab.

5. **Fichiers mémoire obsolètes** à cause de cette règle :
   - `project_brvndlab_coach_client_communication.md`
   - `feedback_coach_no_restrictions.md` (le rôle Coach n'existe plus)
   - Toute règle qui évoque un "mode coach" ou "espace coach"

6. **Todo list** : supprimer toute tâche "Brainstorm Coach" ou équivalent.

Cette règle s'applique à TOUTES les sessions futures. Zéro surface Coach dans Brvndlab. Jamais.
