---
name: project-rush-video-library
description: "Rush, le Frame.io perso de Jonathan (rush-studio.vercel.app) : refonte parité Frame.io validée tribunal 6 juges 8+/10 le 2026-07-07, stack, accès, limites v1"
metadata: 
  node_type: memory
  type: project
  originSessionId: 2763c9c3-faab-42c2-94fa-7c147ee564c8
---

Rush = SaaS perso de Jonathan pour remplacer Frame.io : bibliothèque vidéo, dossiers, upload multipart jusqu'à 20 Go, review avec monteurs. DA Brvndlab appliquée (ink #0b0a09, crème #EDE7DA, or #c9a96a, Satoshi, radius 28/16/8). Envisagé plus tard comme module Brvndlab, auth Brvndlab prendra le relais du code d'accès.

- Prod : https://rush-studio.vercel.app · repo ~/dev/rush · projet Vercel "rush" (protection SSO désactivée, nécessaire pour les liens invités)
- Convex : projet "rush", dev dusty-quail-316, prod harmless-vulture-905 (jamais toucher au Convex Brvndlab)
- Blob store : rush-media, fichiers publics par URL non devinable (limite assumée)
- Code d'accès admin : rush-7d48-c06c-a4cf (~/dev/rush/.rush-key) ; même valeur sous DEUX envs : ADMIN_KEY (Convex dev+prod) et RUSH_ADMIN_KEY (Vercel) : si elles divergent, login ok mais uploads en échec
- Deploy : npx convex deploy --yes --typecheck=disable puis vercel deploy --prod (manuel)

Refonte parité Frame.io 2026-07-07, validée par tribunal 6 agents en 3 rounds (parité 8.5, player 8, backend 8.5, UX 8.5, flux monteur 8.5, perf 8.5) :
- Player : timecode SMPTE frame-précis (fps mesuré par requestVideoFrameCallback sur l'ORIGINAL uniquement puis persisté), menu réglages type Frame.io (Qualité originale/720p/auto, Guides 2.35→1:1 + masque, Zoom T/Y/±/⌘0 pixel-à-pixel, Vue sur l'asset), frame→vignette, image fixe pleine résolution, vitesse, boucle, hover scrub lazy, nav entre assets (Maj+Flèches), playhead rVFC
- Commentaires : épingles + dessins sur l'image (coordonnées normalisées 0-1), filtres/tri/recherche, export EDL Resolve (marqueurs LOC, base 01:00:00:00) + relevé texte timecodé avec réponses
- Proxy 720p navigateur (canvas+MediaRecorder, file de fond sérialisée, abandon si onglet masqué + watchdog). Téléchargement = TOUJOURS l'original (4K reste 4K)
- Monteurs : upload par lien de partage (permission "livraison" bornée au périmètre du dossier), notifications temps réel bidirectionnelles (cloche invité + admin, toasts live, items cliquables), StatusBadge côté invité
- ShareModal unifiée (projet/dossier/fichier), renommage des liens, résumé permissions
- Sécurité : préfixes blob validés (media/thumbs/proxies) upload + suppression, anti-référencement croisé (index by_blob), parentId commentaire validé, notifications purgées en cascade

Batch 2 (2026-07-07, tribunal 3 juges 8.5/8.5/8.5 en 2 rounds, 1 bloquant tué : text/vtt refusé par allowedContentTypes) :
- Mode clair/sombre : variables --rush-* (Tailwind v4 @theme pointe dessus), [data-theme="light"], anti-flash next/script beforeInteractive, ThemeToggle, .dark-scope force le sombre sur le player et les vignettes (la vidéo reste sur fond noir), statuts/danger/success thémés
- Sous-titres FR/EN : import .srt/.vtt (conversion client, encodages UTF-8/UTF-16 BOM/Windows-1252), route /api/subtitle même origine (track sans CORS vidéo), bouton CC, section réglages admin
- Annotations refaites : un bouton "Annoter" + barre d'outils overlay (feutre/épingle/5 couleurs or-rouge-bleu-vert-blanc/annuler/Terminé), transport totalement gelé pendant l'annotation (clavier, play, seek), points arrondis 4 décimales, validation Convex stricte (whitelist couleurs, bornes, caps)
- Identité invité : prénom obligatoire à l'arrivée sur /s/<token>, chip modifiable dans le header
- Téléchargement au choix : Original {qualité} · {poids} / Proxy 720p léger

Reste connu pour v2 (standalone) : réconciliation blobs orphelins post-crash, marquage lu individuel des notifications, edit/delete de son propre commentaire côté invité, dénormalisation projects.list si volumétrie, blob proxy invité orphelin si rattachement échoue, callbacks CommentRow non memoïsés, transcription automatique des sous-titres.

## Rush INTÉGRÉ dans Brvndlab (2026-07-08, EN PROD sur app.brvndlab.com)
Le module Rush vit maintenant NATIVEMENT dans le SaaS Brvndlab (~/dev/brvndlab-claude/brvndlab-app), sous le shell (sidebar "Création de contenu → Rush", AppHeader, thème data-bvh-theme, auth Clerk). Le standalone rush-studio.vercel.app reste séparé et intact (pas de migration de données, décision Jonathan).
- Stockage : Convex storage natif (pas Vercel Blob) : storageId/proxyStorageId/thumbStorageId. Convex prod = accurate-cormorant-297 (PARTAGÉ, plusieurs sessions déploient dessus : vérifier que `npx convex run rush:resolveShare` répond avant de conclure, une autre session peut écraser le backend).
- Déploiement (ce repo n'a PAS brvndlab-sync.sh/deploy-brvndlab.sh) : `env -i ... CONVEX_DEPLOYMENT=prod:accurate-cormorant-297 npx convex deploy --yes --typecheck=disable` (les env Vercel polluent la détection, d'où le env -i), puis merge sur main + `vercel deploy --prod`. Les env vars Vercel sont PROD-ONLY (previews cassent en 500 Clerk sans config de branche).
- Accès par personne à 5 niveaux type Frame.io (modal "Gérer l'accès" owner-only) : rushAccessLevel sur table collaborators (full/edit_share/edit/comment/view), + collaboratorRole "rush_member" (invité Rush uniquement, role viewer + customAllowedPages ["Rush"], étanche : resolveOwnerClerkUserId + brandDna + inspirations le gatent à null, requireWriteAccess throw). convex/rush.ts : resolveRushContext/requireRushLevel, download source dès edit, partage public token crypto /r-share/[token], livraison invité durcie, notifs hybrides (globales membres + rush_notifications feed invité).
- Front : src/components/rush/RushPlayer.tsx (port du standalone), pages /rush (+AccessModal), /rush/p/[id], /rush/a/[id], /r-share/[token] (public), src/lib/rushMedia.ts, /api/rush-subtitle. Statuts couleurs affirmées (.rush-status + variante --solid + .rush-statusbar). Téléchargement cross-origin via forceDownload (fetch→blob). Exports monteur "Pour DaVinci Resolve (.edl)" / "Relevé texte timecodé".
- Validé par 6 tribunaux (archi 7.5/7/7.5, backend 7→8.5, front 9/8/8, final 8.5/8.5, verif 7→corrigé). Smoke test prod OK : app.brvndlab.com 307, /r-share 200 rendu correct.
