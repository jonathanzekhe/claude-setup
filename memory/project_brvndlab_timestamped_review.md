---
name: Review timestampée sur asset (Frame.io-like)
description: Feature future Brvndlab — commentaires timestampés sur vidéos/assets avec synchro vers Messaging
type: project
originSessionId: b89456e2-2692-4863-b103-66dec20d323d
---
Feature à intégrer dans Brvndlab : commentaire timestampé sur asset (vidéo cut monteur, thumbnail, script), synchro temps réel avec le messaging du collaborateur concerné.

**Why:** Le 90% des allers-retours créateur ↔ monteur se font aujourd'hui dans Frame.io / WhatsApp sans ancrage temporel. C'est l'évolution naturelle qui complète Contenu + Messaging déjà en place. Aucun concurrent personal branding ne l'a — différenciant fort.

**How to apply:**
- Pas avant l'audit Radar et le polish des modules existants. Pas urgent mais sealed dans la roadmap.
- Pattern à viser : player embed dans fiche Contenu → bouton "Commenter à 1:34" → commentaire visible à la fois dans timeline sous le player (pins cliquables) ET comme message dans la conv avec ancrage `assetId + timecode`.
- Vocal sur timecode = killer feature ("le rythme casse à 1:34" en 12s).
- Trois questions à trancher avant build :
  1. Asset = vidéo only ou tout (script paragraphe, thumbnail zone) ?
  2. Hébergement : upload Convex/S3 (contrôle total) vs embed Frame.io/Drive (léger mais dépendance) ?
  3. Threads vs plat : pour le volume Brvndlab, plat suffit (1 comment = 1 message + 1 pin timeline).
