---
name: brvndlab-chantier-performances-vocal-2026-08-25
description: Chantier vocal Jonathan+Thomas du 25/08 — 19 tâches Performances livrées 20/20 (commit e73f0b7b) ; stickers sondage/question = impossible par API ; concurrents IG = jeton de service à activer par OAuth Meta
metadata: 
  node_type: memory
  type: project
  originSessionId: 16cb2d23-0d4e-482a-bf6a-befe0e4e13c0
  modified: 2026-08-25T11:46:10.888Z
---

Chantier du vocal 25/08 (Jonathan + Thomas), commit e73f0b7b, score audit Playwright prod 20/20 (script `audit-final.mjs`). Décisions produit à retenir :

- **Post sans légende = AUCUN titre** (plus jamais « Publication »), pour posts ET stories.
- **Ligne story** : vues / réponses / partages. **Fiche story** : Vues / Personnes touchées / Réponses / Partages + liste des VRAIES réponses DM (action `instagramCapture.reponsesDeStory`, inbox Zernio, match `storyReply.storyId`).
- **Stickers story (sondages, questions) : IMPOSSIBLE par API** — ni Meta ni Zernio ne les exposent (vérifié doc + openapi). Ne jamais le promettre. Seules les réponses DM sont récupérables.
- **Fiche contenu** : préview au ratio réel du média (aspectRatio dynamique onLoadedMetadata), lecteur maison sans `controls` (pastille `.sonbtn`), rétention moyenne/temps moyen/partages/enregistrements en boxes, courbe rétention YT nue (phrase d'explication supprimée à la demande de Thomas), résumé compact (max 260px).
- **Compactage onglet YouTube** : cause = `.anx2.wrap` flex item sans width (shrink-to-fit) — `width:100%` obligatoire. Ne pas retirer.
- **Icônes cartes KPI** : le svg porte aussi la classe `.ic` → règle `svg.ic{position:static}` obligatoire ; engagement en rouge #ef4444.
- **Marché** : grille `.marche2` (concurrents+références gauche, benchmark droite) ; pas de titre h3 dans YtBenchmark.
- **Vidéos YouTube à 0** : fenêtre `POSTS_WINDOW_DAYS` doit rester ≤ 364 (Zernio rejette 366 en 400 « cannot exceed 1 year », erreur avalée par zget).
- **Concurrents Instagram : RÉGLÉ et testé live le 25/08.** Un jeton Meta de service a été créé par OAuth Business (compte 17841447739040026, clerkUserId Jonathan, expire ~60j → à renouveler). `_maConnexionInstagram` (social.ts) retombe sur le premier jeton valide de la table `instagramTokens` = business_discovery marche pour TOUS les comptes Zernio. Prouvé E2E : ajout de @hormozi → carte « Alex Hormozi 4,9M abonnés », fiche 4354 publications/23 par mois. Le jeton a été obtenu via cookies FB de Chrome + Playwright (fb-cookies.txt, oauth-meta3.mjs dans scratchpad). Table benchmark = `youtubeBenchmarkChannels` (même pour IG).
- **follows/reposts par contenu** : Zernio les expose dans analytics ; ajoutés au schéma instagramMedia + mappings. Carte Abonnés classe par `abonnesGagnes` (=follows), repli sur « plus vues » SI aucun contenu n'a follows>0. ⚠️ Meta ne donne PAS follows sur les reels — un compte 100% reels (comme celui de Jonathan) affiche toujours le repli ; c'est une limite réseau, pas un bug. Rafaela a des posts avec follows (vérifié).
- **Fiche post finale** : 2 rangées collées (kpi2, gap 8px). Rangée 1 = Vues/J'aime/Commentaires/Engagement. Rangée 2 = Rétention moyenne/Reposts/Partages/Enregistrements (temps moyen retiré du post, gardé sur YouTube).
- **Maquettes fiche** : artifact 3 formats (reel 9:16, reel 16:9, post) + story, 2 dispositions chacun — https://claude.ai/code/artifact/7a6a8e38-2da6-4d9f-8621-bb9383863eb3 — Jonathan doit valider la lettre par format avant push définitif de la disposition.
- **Thématiques concurrents** : produites par l'IA via /api/analyse-concurrent (champ `themes`), repli comptage lexical.
- **Cartes KPI cliquées** : la liste du bas s'adapte (Abonnés→`follows` par post, Couverture→reach, Vues→vues) ; carte Vues IG sans taux d'engagement.
- **confirm() natif interdit** : composant `src/components/ConfirmModal.tsx` (7 remplacements intégrations).
- Hors périmètre assumé : refonte du raisonnement de l'Analyse IA (« plus tard », dixit Jonathan).

## Vague 2 (25/08 après-midi) — tout testé E2E prod
- **Contenus archivés/supprimés retirés** : un post/reel qui disparaît de la source Zernio est retiré de notre base (`_reconcilierFeed` dans instagramCapture, comparaison par SHORTCODE du permalien car les 2 chemins ont des externalId différents). Champ Zernio `removedFromPlatformAt` = signal explicite de suppression (exclu aussi). STORIES JAMAIS touchées (gardées à vie). Garde-fou : source vide + >2 candidats = on ne purge pas. Prouvé : 2 reels 2024 de Jonathan retirés (retires:2).
- **Badge « En essai »** : champ Zernio `isTrialReel` → `estEssai` en base → badge `.essai` dans liste/carte.
- **Marché par réseau** : `.marchebloc` par réseau, YT/IG séparés sur « Tous » (icône+couleur), icône au lieu du texte (`.nlabel`). `benchmarkPour(reseau)`, `concurrentsDe/referencesDe` filtrent par `reseauBench`.
- **Fiche concurrent IG complète** : `business_discovery` renvoie media_url (reel joue), children (carrousel 7 slides feuilletable), like_count/comments_count. Vues tierces = null (Meta ne les donne pas, honnête). `CarrouselNav` (flèches+points) rend TOUT carrousel feuilletable (mes contenus via mediaItems Zernio + concurrents via children).
- **Thématiques IG corrigées** : le titre IG = 1ère ligne de légende (pauvre) → on envoie la LÉGENDE ENTIÈRE à /api/analyse-concurrent. Résultat : angles réels (« Mindset de richesse », « Leadership et management d'équipe ») au lieu du comptage lexical.
- Dispositions fiche validées : reel 9:16 = média gauche/chiffres droite ; reel 16:9 = média large en tête ; post = image centrée en tête + chiffres pleine largeur (classes .top2.vid / .top2.post).
- `slides` (array {type,url}) ajouté au schéma instagramMedia + business_discovery `children`.

## Vague 3 (25/08 fin) — reposts + cartes KPI + marché épuré
- **REPOSTS par post** : Zernio ne les donne PAS (que `shares`). Meta OUI via `/{media-id}/insights?metric=reposts`, mais seulement pour le compte propriétaire du jeton. Action `enrichirReposts` (instagramCapture) balaie TOUS les jetons Meta, lit reposts média par média, complète par SHORTCODE le propriétaire réel (`_rangerRepostsParPermalienTous`). ⚠️ Le jeton OAuth de Jonathan dessert le compte Meta de RAFAELA (iam.rcf, ig user 17841447739040026) — c'est ce compte qui reçoit les reposts (13/13). Concurrents : reposts + enregistrements IMPOSSIBLES (insights privés d'un tiers interdits par Meta) → cases masquées via `estConcurrent` (id préfixé cc-). Icône dédiée `P_REPOST` (double flèche « republier »), distincte de `P_PARTAGE`.
- **Cartes KPI cliquées** : liste répond à la carte (Couverture→reach, Vues/Vues moyennes→vues avec titres distincts). Abonnés gagnés par contenu : Instagram seul (Meta `follows`), YouTube ne l'expose PAS par vidéo (Zernio n'a que l'agrégat channel-insights `subscribersGained` quotidien) → repli « plus vues ».
- **Marché épuré** (AnalyticsV2) : disparaît sur onglet « Tous » ; icône réseau retirée des titres ; invite = « URL ou @ » / « Compte ou lien Instagram » ; « Position réelle » + textes vides retirés du benchmark ; MON point sur la carte dès que le compte est branché (repli sur stats yt/ig quand pas d'OAuth Google/Meta — `moiYt`/`moiIg` construits depuis yt?.abonnes/ig?.abonnes dans benchmarkPour). YtBenchmark `push()` : « me » placé même si freq inconnue (=0).

## Vague 4 (25/08 soir) — composer carrousel
- **Réordonner les slides** d'un carrousel/story : drag HTML5 natif sur les vignettes `.igc-thumb` de InstagramComposer.tsx (état `dragFrom`/`dragOver`, `deplacerMedia(de,vers)` splice sur le tableau `medias`). L'ordre du tableau `medias` EST l'ordre publié — preview (IgPreview bloc isCarousel) et backend (zernioPublish mediaItems / instagramPublish children) le suivent sans autre modif. Numéro d'ordre `.igc-ord` affiché en carrousel (avant : story seulement), hint `.igc-hint`. Prouvé E2E 5/5.
- **Carrousel MIXTE images+vidéos** : faux garde-fou allowMixedMedia:false + maxVideos:1 dans PLATFORM_RULES.instagram (zernioPublish.ts) corrigé en allowMixedMedia:true, maxVideos:10, plafond TOTAL 10 items ajouté dans checkPlatform. Doc Meta : « up to 10 images, videos, or a combination of the two ». Le chemin Meta direct (instagramPublish.ts) l'acceptait déjà. Vérifié : 2img+1vid, 1img+2vid, 5img+5vid acceptés ; 11 refusés.
