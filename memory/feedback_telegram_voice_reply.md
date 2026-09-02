---
name: Telegram, vocal in → vocal out
description: Sur le channel Telegram (Bruce Lee), quand Jonathan envoie un message vocal, répondre obligatoirement en vocal, pas en texte.
type: feedback
---

Sur le channel Telegram avec le bot Bruce Lee : quand Jonathan envoie un **message vocal**, la réponse doit être **un fichier audio** (text-to-speech), pas du texte. Un message texte en retour d'un vocal est une erreur.

**Why:** Jonathan utilise Telegram en mobilité. S'il a pris la peine d'enregistrer un vocal, c'est qu'il ne veut/peut pas lire un écran. Lui répondre en texte casse l'usage.

**How to apply:**
- Détecter le type du message entrant dans le channel Telegram.
- Vocal entrant → générer un fichier audio et l'envoyer via le tool reply avec `files: ["/abs/path.ogg|mp3|wav"]`.
- Texte entrant → réponse texte normale.
- Règle spécifique au channel Telegram, ne s'applique pas aux autres surfaces.
