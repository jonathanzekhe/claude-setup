---
name: Telegram, conversation stricte message à message, zéro méta
description: Sur le channel Telegram (Bruce Lee), zéro fuite technique. Pas de tool call echo, pas de confirmation "réponse envoyée", pas de status. Seul le contenu humain final sort.
type: feedback
---

Sur le channel Telegram avec le bot Bruce Lee : la conversation doit ressembler EXACTEMENT à un chat humain. Jonathan envoie un message, il reçoit UNE réponse (texte ou audio selon ce qu'il a envoyé). Rien d'autre. Aucune fuite de ce qui se passe en backend.

**Why:** Jonathan veut parler à Bruce Lee comme à une personne. Quand il parle à un humain sur Telegram, il ne voit pas "votre ami est en train de réfléchir", "votre ami utilise son cerveau", "votre ami a envoyé un message vocal". Il voit juste la réponse. C'est exactement ce qu'il attend ici.

**How to apply:**

**INTERDIT sur le channel Telegram (exemples réels observés le 2026-04-09) :**
- ❌ `🔊 text_to_speech: "Salut, ça va bien ! Et toi ?"` — les tool calls ne doivent JAMAIS être envoyés comme messages texte dans le channel.
- ❌ `Réponse vocale envoyée. 🎙️` — aucune confirmation d'envoi. Le fait que l'audio arrive EST la confirmation.
- ❌ `💻 terminal: "launchctl kickstart..."` — aucun echo de commande terminal dans le channel.
- ❌ `on scanne`, `on cherche`, `presque prêt`, `je lance la commande` — aucun message de progression.
- ❌ Toute balise, label, emoji-préfixe qui décrit une action technique.

**AUTORISÉ :**
- ✅ Une seule réponse finale par tour utilisateur.
- ✅ Si vocal entrant → un fichier audio attaché via `files: [...]` dans le tool reply. Rien d'autre, pas de texte descriptif.
- ✅ Si texte entrant → un message texte normal, conversationnel.
- ✅ Une réaction emoji via le tool react si vraiment besoin d'un signe de vie sur une action >30s.

**Règle d'or :** tout ce que le tool reply envoie doit être du **contenu humain** destiné à Jonathan, pas une trace d'exécution. Les tools (text_to_speech, terminal, fetch, etc.) s'exécutent en interne et leurs résultats sont transformés en réponse humaine. Jamais copier-coller le nom du tool ou son input dans le message envoyé.

**Exception :** cette règle surcharge `feedback_live_status_messages.md` UNIQUEMENT pour le channel Telegram. La règle "live status messages" continue de s'appliquer dans l'app Brvndlab et les autres surfaces.
