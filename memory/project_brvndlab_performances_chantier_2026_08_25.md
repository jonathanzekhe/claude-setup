---
name: brvndlab-performances-chantier-2026-08-25
description: "Chantier Performances 25/08 — fiche story KPIs dédiés, filtres par format, archive média à vie (videoStorageId + relais IG + yt-dlp), fix accès collaborateur /performances"
metadata: 
  node_type: memory
  type: project
  originSessionId: 16cb2d23-0d4e-482a-bf6a-befe0e4e13c0
  modified: 2026-08-25T06:42:43.367Z
---

Chantier Performances livré le 25/08/2026 (commits d6133c51, 1170c55b, 00b26316), vérifié en E2E prod par le robot (8/8 OK, script `verif3.mjs` réutilisable) :

1. **Fiche story** : KPIs = Vues / Personnes touchées / Réponses / Partages (issus de la bêta ffc8c32a : vues, replies→comments, shares ; taps/exits n'ont JAMAIS existé, dépréciés par Meta v22). Pas de bloc Résumé, pas de rétention, pas d'appel IA pour une story.
2. **Liste** : une story n'a AUCUN titre (pas de « Publication ») ; double filtre : formats (Stories/Reels/Posts/Carrousels/Vidéos YouTube, un seul menu ouvert à la fois) + réseaux.
3. **Archive à vie** : `videoStorageId` dans instagramMedia (le visuel dans mediaStorageId, la vidéo dans son fichier). Capture copie les deux sur les 2 chemins. `copierMediasManquants` (branché aux 2 crons) rattrape : URL archivée → sinon relais IG (`IG_SCRAPER_URL`/`IG_RELAY_SECRET` maintenant aussi dans Convex prod) qui donne des URLs fraîches par shortcode du permalien. Les reels que le relais rend en « image » (embed restreint) : yt-dlp --cookies-from-browser chrome depuis le Mac de Jonathan + upload via `_urlDeDepot`+`_rangerFichiers`.
4. **Bug corrigé** : MODULES_PAR_ROLE serveur (collaborators.ts) n'avait pas « analytics » pour headofcontent → le proxy éjectait tout collaborateur de /performances vers /home.
5. **4 comptes avec médias** : Jonathan user_3CaB (1 reel C6mHWi8sIyK supprimé d'IG = seul trou), Thomas user_3FUC, Rafaela user_3GP7 (cliente), Lulunae user_3FpcFpWSMMxD2kwZ89MqFbC4lUF. Des reels sont DUPLIQUÉS entre comptes (mêmes shortcodes chez Thomas et Lulunae).
6. Robot audit : seat UNIQUE désormais sur le compte de Jonathan (revokeRobot+inviteRobot refaits le 25/08). INSTAGRAM_SESSIONID (falsego) morte ce jour-là, non bloquant.

Voir [[brvndlab-story-insights-zernio]] pour les métriques stories.
