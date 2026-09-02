---
name: project-brvndlab-chantier-publier-2026-08-24
description: "Refonte complète du flux Publier (24/08/2026) : 20/23 demandes livrées, architecture des nouvelles briques, 3 demandes écartées avec preuve, dossier canonique"
metadata: 
  node_type: memory
  type: project
  originSessionId: d4dc536a-fab1-47d4-b0d1-90166112699b
  modified: 2026-08-24T08:40:27.744Z
---

Chantier Publier livré et vérifié en live le 24/08/2026 (commits a9abdb14, 071552c7, d3ebfe67). Dossier canonique : https://brvndlab-mockups.vercel.app/brvndlab-dossier-publier

**Briques nouvelles :**
- `convex/composerPicker.ts` query `pipeline` : posts non publiés/archivés AVEC vidéo Rush validée liée (jointure `scriptItemId` + index `by_script`), double gate modules contenus ET rush. Un pick remplit média + texte d'un coup.
- `convex/ytDescriptionPresets.ts` + table `ytDescriptionPresets` : modèles de description YouTube avec emplacements `{{lien:N}}` reliés à des destinations linkLibrary. `materialize` crée des liens trackés NEUFS à CHAQUE publication (slug `<cat>-yt-<n>`), jamais au chargement, jamais sans emplacement dans le texte. UI « Mes modèles » dans YoutubeComposer.
- Options Reel dans `zernioPublish.ts` (platformSpecificData) ET `instagramPublish.ts` (Meta direct) : couverture (image gagne sur thumbOffset), collaborateurs (3 max, @ retirés), reel d'essai `trialParams.graduationStrategy = MANUAL` uniquement, avec GARDE SERVEUR des deux côtés (refus si pas une vidéo seule hors story).
- Stories multi-séquences : envois séquentiels séparés (maxVideos=1 serveur), item « Story i/N » chacun, +60 s par séquence en différé, erreur qui dit où ça s'est arrêté.
- ComposerPicker : onglets Rush/Pipeline (script réservé à reseaux/page.tsx), bouton aperçu par ligne (`.cpk-prev` DOIT porter flex:none, sinon écrasé à hauteur 0 dans la liste défilante).
- Composeurs acceptent `onBack` : depuis /publier, retour = setReseau(null), jamais router.back().
- IgPreview lit `getMySocialConnections` (nom réel) + repli photo via action `socialImport.listZernioAccounts` en visant LE compte rattaché (`myZernioAccounts`), jamais le premier de l'espace partagé (super-admin voit tout).
- Marque de la sidebar masquée sur /publier et les composeurs (`fluxPublication` dans AppSidebar).

**Écartés avec preuve** (règle Jonathan « si c'est compliqué on ne le met pas ») : musique catalogue (aucune API de recherche), amis proches (API Meta ne l'expose pas), lieu (recherche Pages Meta = chantier séparé).

**Limites honnêtes documentées** : 16:9 en Reel = letterbox Instagram (aucun crop API, l'aperçu montre la vérité) ; YouTube 2 h accepté au composeur mais transport multi-Go non éprouvé.

**3e tour (même jour)** : couverture = bouton discret + fiche Sheet (timeline 33 ms, boutons fins, import image, astuce durationchange pour les flux progressifs qui rendent duration=Infinity) ; aperçus en autoplay muet boucle, état playing piloté par onPlay/onPause ; reel d'essai = vrai switch + badge dans l'aperçu ; musique = cause racine trouvée (zernioConnectUrl n'envoyait jamais loginMethod, la déconnexion Brvndlab est locale) → flux facebook_login complet (loginMethod + select-account Pages, miroir du pattern LinkedIn, users.zernioLoginMethods, badge « via Facebook » + « Reconnecter via Facebook (musique) » dans Intégrations). ATTENTION : Thomas a renommé /reseaux → /performances (commits Performances v2) pendant le chantier, le merge a suivi ; les composeurs vivent sous src/app/(app)/performances/. Tests live : navigateur isolé + sign-in token Clerk sur le compte de Jonathan (lecture seule), le robot viewer ne voit pas /publier. Un fichier ONBOARDING-CLAUDE-PERFORMANCES.md à la racine du repo appartient à une autre instance, JAMAIS le committer.

**4e tour** : contentItems.publishedFormat/publishedMedia écrits par zernioPublish dès l'envoi accepté (source unique du format : youtube → story → reel → carousel → post) ; pipeline : carte publiée = format réel sans funnel, clic = PublishedPostSheet lecture seule (query contentItems.getPublishedMedia pour les MIME) ; son : onglets Musique/Sons originaux (audioType), recherche débouncée avec jeton de course, lecteur avec timeline ; premier commentaire Instagram (options.firstComment, purgé entre publications) ; « Publier la même vidéo sur l'autre réseau » (onPublishedVideo/initialVideo, handoff dans publier/page). Vérifié LIVE : le catalogue musical rend de VRAIS titres (Noah Kahan, etc.) : la reconnexion Facebook de Jonathan a fonctionné.

**5e décision (24/08 soir)** : Jonathan a RETIRÉ du composeur les collaborateurs, le son, et le pont « publier sur l'autre réseau » (« ça ne me parle pas »). Le Reel garde UNIQUEMENT couverture + reel d'essai (note intouchée) + légende + premier commentaire. Les mécaniques serveur (zernioAudio, collaborators, audioConfiguration) restent dormantes et réactivables. Le rattrapage backfillPublishedFormats (zernioPublish) a corrigé les 2 posts publiés sans format ; GET /posts Zernio rend platformSpecificData (vérifié par appel réel).

**Tribunal** : 8/10, ses 3 fuites d'état (B.1 garde Zernio, B.2 presetId, B.3 reset options Reel) corrigées avant mise en ligne. Voir [[reference-zernio-platformspecificdata]].
