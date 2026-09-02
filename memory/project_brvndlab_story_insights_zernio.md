---
name: brvndlab-story-insights-zernio
description: "Stories Instagram via Zernio — la liste ne porte aucune métrique, les chiffres vivent sur /stories/{id}/insights (live/cached/unavailable) ; fix déployé 25/08/2026"
metadata: 
  node_type: memory
  type: project
  originSessionId: 16cb2d23-0d4e-482a-bf6a-befe0e4e13c0
  modified: 2026-08-25T05:22:09.893Z
---

Fix du 25/08/2026 (commit d6133c51) : sur le chemin Intégrations (Zernio), l'endpoint `GET /accounts/{accountId}/instagram/stories` ne renvoie AUCUNE métrique — les stories s'archivaient en base avec toutes les colonnes vides ("—" à vie dans Performances). Les chiffres vivent sur `GET /accounts/{accountId}/instagram/stories/{storyId}/insights`, avec un champ `source` :
- `live` = story encore en ligne, chiffres temps réel
- `cached` = story expirée mais Zernio a reçu le webhook Meta `story_insights` (chiffres finaux)
- `unavailable` = expirée sans webhook → les métriques renvoyées sont des ZÉROS FABRIQUÉS, ne jamais les écrire

Implémenté dans `convex/instagramCapture.ts` : helper `storiesZernioAvecInsights` (les deux chemins de sync), rattrapage borné 30 jours dans `_syncUnCompte` (`_storiesSansChiffres`), diag lecture seule `_diagSocial:couvertureMedias`. Le cron `syncTousLesComptes` (10 min) garantit la capture de chaque story active.

**Limite Meta irrécupérable** : les 19 stories de la cliente (user_3GP7…, compte Zernio 6a82b843…) expirées AVANT le fix sont `unavailable` chez Zernio — aucune interface au monde ne peut relire les stats d'une story expirée non webhookée. Posts et reels étaient déjà couverts à 100 %.

Comptes Zernio prod : Jonathan = 6a80ec1477555aae01278f4d (2 users), cliente = 6a82b84377555aae01834066. Voir aussi [[reference_zernio_platformspecificdata]].
