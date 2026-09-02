---
name: Smart Links · cas YouTube vidéo + multi-objectifs (8 mai 2026)
description: Modal 4 questions pour YouTube vidéo. Recherche dans toutes les vidéos (OAuth API). Multi-objectifs cochés en une seule création (1 lien par objectif).
type: project
originSessionId: e37cd837-5455-4560-bcc5-81b6b082a9c8
---
Pour les Smart Links créés depuis YouTube, modèle spécifique scellé.

## Modal 4 questions

1. **Sur quoi tu publies ?** → Plateforme (Instagram / YouTube / TikTok / Newsletter)
2. **Où sur YouTube ?** → Placement (Description vidéo / Bio chaîne / Card vidéo / Communauté / Commentaire épinglé)
3. **Quelle vidéo ?** → Picker dynamique des vidéos de la chaîne :
   - Liste scrollable max-height 240px
   - Barre de recherche en haut
   - Compteur total ("247 vidéos") affiché
   - Pagination implicite via scroll
   - Bouton "+ Coller l'URL d'une vidéo plus ancienne"
4. **Tu veux qu'il fasse quoi ?** → Multi-select des objectifs :
   - Checkboxes (pas radio)
   - Plusieurs cases cochées = plusieurs liens créés en un geste
   - Aperçu live des slugs générés
   - Bouton final dynamique "Créer N liens" (N = nombre de cases cochées)

## Pourquoi multi-objectifs sur YouTube

Sur YouTube, dans une description, on met souvent **plusieurs liens** : Appel de démo + Lead magnet + Communauté Skool + Newsletter. Sans multi-création, l'utilisateur doit refaire la modal 4 fois pour la même vidéo.

Avec multi-création :
- 1 modal ouverte
- Cocher 4 objectifs
- 4 Smart Links générés en un seul clic "Créer 4 liens"
- Slugs déterministes : `yt-{titre-tronqué}-{date}-{objectif-suffix}`

## Slugs multi-objectifs (pattern)

Pour la vidéo "Comment scaler à 6 chiffres" du 5 mai avec 3 objectifs :

```
brvnd.co/@jonathan/yt-comment-scaler-05mai-demo
brvnd.co/@jonathan/yt-comment-scaler-05mai-pricing
brvnd.co/@jonathan/yt-comment-scaler-05mai-skool
```

Le suffix court (`demo`, `pricing`, `skool`) vient d'un slug court de l'objectif (configuré ou auto-généré).

## Where multi-objectif s'active

- ✅ YouTube → Description vidéo (plusieurs liens dans une description = norme)
- ✅ YouTube → Bio chaîne (plusieurs liens en bio possibles)
- ✅ YouTube → Communauté (post communauté avec plusieurs liens)
- ✅ Newsletter → Email custom (plusieurs liens dans un email)
- ❌ Instagram → Story (1 sticker swipe-up = 1 lien)
- ❌ Instagram → Bio (1 lien Insta dans la bio)
- ❌ Instagram → DM (1 lien par message)
- ❌ TikTok → Vidéo (1 lien par vidéo TikTok)

Règle : multi-objectif activé seulement où la plateforme accepte plusieurs liens dans le même placement.

## Recherche vidéos YouTube

Tape un mot-clé → filtre instant côté client sur la liste pré-chargée.
Si pas de match → "Aucune vidéo trouvée. + Coller l'URL d'une vidéo plus ancienne".
Pour les chaînes 200+ vidéos, charger par paquets de 50 (pagination API YouTube).

## How to apply

- L'OAuth YouTube est déjà connecté côté Brvndlab (`youtubeTokens` en BD).
- L'API YouTube Data v3 permet `playlistItems.list` avec quota raisonnable (1 unit par request).
- Cache des vidéos côté Convex (refresh quotidien via cron `youtube metrics daily refresh` à 5h UTC).
- À l'ouverture de la modal, on charge depuis cache (instantané), refresh background si > 24h.
