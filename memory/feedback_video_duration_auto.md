---
name: Durée vidéo auto-calculée depuis Wistia
description: Quand une vidéo Wistia est ajoutée ou modifiée, la durée doit être récupérée automatiquement depuis l'API Wistia oEmbed. Jamais saisie manuellement.
type: feedback
---

La durée des vidéos prérequis Brand OS doit être calculée automatiquement à chaque fois qu'une URL Wistia est ajoutée ou modifiée.

**Why:** Jonathan ne veut pas d'informations faussées. Si la vidéo fait 4 min 30, ça doit afficher 4 min 30, pas 8 min.

**How to apply:** Utiliser l'API Wistia oEmbed (https://fast.wistia.net/oembed?url=URL&format=json) pour récupérer la durée en secondes, puis la convertir en format lisible. Faire ça automatiquement quand l'URL est sauvegardée, pas manuellement.
