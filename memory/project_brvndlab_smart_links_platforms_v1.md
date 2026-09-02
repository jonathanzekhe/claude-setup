---
name: Smart Links plateformes V1 scellées (8 mai 2026)
description: 4 plateformes affichées en V1 : Instagram, YouTube, TikTok, Newsletter. LinkedIn et X reportés à V2 quand l'intégration sera vraie.
type: project
originSessionId: e37cd837-5455-4560-bcc5-81b6b082a9c8
---
Plateformes affichées dans Smart Links V1 : **Instagram, YouTube, TikTok, Newsletter** (4 seulement).

## Pourquoi seulement ces 4

- **Instagram, YouTube, TikTok** : OAuth déjà câblé en backend (`youtubeTokens`, `instagramTokens`, `tiktokTokens`), tracking effectif possible.
- **Newsletter** : exception légitime (canal en ligne mais pas réseau social), tracking via opt-in email + clic Smart Link standard.
- **LinkedIn et X** : reportés à V2. Pas encore d'intégration native, donc afficher la plateforme = donner l'illusion qu'on tracke alors qu'on tracke seulement les clics génériques.

## Règle générale

**On n'expose que les plateformes où on peut vraiment traquer.** Pas de plateforme "vitrine" qui ne fait que du clic basique sans contexte.

## Plateformes V2+ (à débloquer plus tard)

- LinkedIn (post-MVP, quand on aura un OAuth ou une intégration sérieuse)
- X (idem)
- Twitch / Discord / autres (selon demande user et capacité tracking)

## How to apply

- Liste plateformes dans la modal de création : `["Instagram", "YouTube", "TikTok", "Newsletter"]` + bouton "+ Ajouter" qui propose Custom (sans tracking natif, juste libellé).
- Filtres pills sur la page Smart Links : 4 + "Tous mes liens".
- Mockups à mettre à jour pour ne montrer que ces 4.
