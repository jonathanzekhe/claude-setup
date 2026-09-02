---
name: project_brvndlab_inspiration_ig_autoplay
description: Inspiration — autoplay natif des reels Instagram via compte technique + retrait TikTok
metadata: 
  node_type: memory
  type: project
  originSessionId: 0b57e729-edfe-4371-93b7-577019d95641
---

Section **Inspiration** de Brvndlab (app.brvndlab.com/inspiration) : deux chantiers livrés en prod le 2026-07-10 (commit `e61ca6b`, mergé `b5aceee`).

## 1. Retrait TikTok
Inspiration ne prend QUE YouTube + Instagram. TikTok refusé à l'ajout (toast "Inspiration ne prend que YouTube et Instagram, pas TikTok"), placeholder + états vides mis à jour. Le parser reconnaît TOUJOURS TikTok pour AFFICHER les anciennes cartes déjà en base (rendu conservé, seul l'ajout bloqué). Cohérent avec [[feedback_no_tiktok]].

## 2. Autoplay natif des reels Instagram (LA feature)
**Objectif final = faire approuver oEmbed Read par Meta** (app `26589079784021135` "Brvndlab App", dossier soumis, PAS encore approuvé → l'endpoint `instagram_oembed` renvoie erreur #10 "must be reviewed and approved"). En attendant, pont via **compte technique**.

**Ce qui est FERMÉ par Meta (prouvé le 2026-07-10, 6 méthodes testées) :** page HTML publique (coquille JS vide), `?__a=1` (404), GraphQL shortcode anonyme, API mobile anonyme, oEmbed public (donne titre+auteur mais pas MP4), noembed. Tous en `login_required`. → aucune voie anonyme pour le MP4.

**Voie qui MARCHE = API mobile authentifiée :** `GET https://i.instagram.com/api/v1/media/{media_id}/info/` avec headers `Cookie: sessionid=...; ds_user_id=...`, `User-Agent` app Android, `X-IG-App-ID: 936619743392459`. Renvoie `video_versions[0].url` (MP4), `image_versions2.candidates[0].url` (poster), `user.username`, `original_width/height`, `video_duration`. `ds_user_id` = préfixe du sessionid (avant premier `:`). `media_id` = shortcode décodé en base64 (alphabet `A-Za-z0-9-_`, base 64, BigInt).

**Architecture livrée :**
- Route `src/app/api/inspiration/ig-media/route.ts` : mode `meta` (renvoie videoUrl pointant vers le proxy + poster + dims) et mode `stream=<shortcode>` (proxie le MP4 frais, supporte Range 206 ; les URLs CDN IG expirent + bloquent le hotlinking cross-origin).
- `sessionid` en env serveur `INSTAGRAM_SESSIONID` (Vercel prod + dev ; PAS preview car le CLI bloque sur le choix de branche). JAMAIS exposé au navigateur. Posé avec `printf` sans newline ([[feedback_vercel_env_printf]]).
- Moteur `inspiration/page.tsx` : Instagram joue en `<video autoplay muted loop playsinline>` natif (fonction `createIgVideoPlayer`) → autoplay muet en boucle comme YouTube, feed ET fiche. Scrub via `video.currentTime`, son via `video.muted`. Ratio réel adaptatif (classe `.ig-native` + `--ig-ar`, object-fit cover). Type `Player` a un champ `video` en plus de `iframe`.
- **Fallback** : si la route renvoie null/502 (session expirée), retombe sur l'embed officiel tap-to-play (`createPlayer` branche instagram). Jamais de carte cassée.

**Compte technique actuel : `falsego1234`** (compte jetable Jonathan, PAS son perso). Le `sessionid` expirera dans semaines/mois → à ce moment les reels retombent sur poster+tap automatiquement, et il faudra que Jonathan redonne un `sessionid` frais (DevTools Chrome → Application → Cookies → instagram.com → `sessionid`). Jonathan a dit "pas grave si ça retombe, on le refera" — l'objectif reste l'appro Meta.

**Preview Vercel inutilisable sur ce projet** : aucune env var Clerk/Convex configurée pour l'environnement Preview → tout en 500 (`Missing publishableKey`). Tester = prod directement (seul env configuré). Voir [[feedback_brvndlab_work_directly_on_prod]].

**Tests validés avant livraison** (reel `DXpNd7WipSI` de `iam.rcf`, 16:9 horizontal 1080x608, 87s) : API mobile HTTP 200 + MP4 + poster + auteur ; proxy Range HTTP 206 vrai MP4 H.264 `ftypisom avc1`. Route déployée prod (401 auth OK). Reste : validation visuelle navigateur par Jonathan (en cours).
