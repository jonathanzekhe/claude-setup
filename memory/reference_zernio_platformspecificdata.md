---
name: reference-zernio-platformspecificdata
description: "Doc Zernio (docs.zernio.com/platforms/instagram) : clés platformSpecificData Instagram vérifiées le 24/08, dont couverture, collaborateurs, trial reels, audio"
metadata: 
  node_type: memory
  type: reference
  originSessionId: d4dc536a-fab1-47d4-b0d1-90166112699b
  modified: 2026-08-24T08:40:40.978Z
---

Vérifié le 24/08/2026 sur https://docs.zernio.com/platforms/instagram (les docs vivent sur docs.zernio.com, PAS zernio.com/docs). Clés Instagram de `platformSpecificData` :

- `contentType: "story"` (absent = feed/reel)
- `shareToFeed` (bool, Reels)
- `collaborators` (array de usernames, max 3, comptes Business/Creator PUBLICS, pas sur les stories)
- `userTags` ({username, x, y, mediaIndex})
- `audioConfiguration` ({audioId, audioVolume, videoVolume}) : attacher un son de catalogue à un Reel, EXIGE loginMethod=facebook_login ; aucune API de RECHERCHE catalogue => inutilisable en pratique sans audioId connu
- `audioName` (renommer l'audio original, à la création seulement)
- `isAiGenerated` (bool, étiquette de divulgation)
- `firstComment` (feed + carrousels)
- `instagramThumbnail` (URL JPEG/PNG, couverture de Reel)
- `thumbOffset` (ms, instant de la vidéo servant de couverture ; exclusif avec instagramThumbnail)
- `trialParams` ({graduationStrategy: "MANUAL" | "SS_PERFORMANCE"}) : reels d'essai. Brvndlab n'envoie QUE MANUAL (garantie essai = essai).

`ZernioAccount` (GET /v1/accounts) porte `profilePicture` (photo de profil réelle) et `followersCount`. Utilisé par l'aperçu du composeur via socialImport.listZernioAccounts.

Voir [[project-brvndlab-chantier-publier-2026-08-24]].
