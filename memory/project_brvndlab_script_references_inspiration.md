---
name: project_brvndlab_script_references_inspiration
description: "Attacher des références Inspiration (court/long/dump/miniature) à un script, avec note par réf ; pense-bête visuel monteur, pas d'usage IA"
metadata: 
  node_type: memory
  type: project
  originSessionId: abdd70b7-74c5-4b6c-b52c-b7eb8e155083
  modified: 2026-08-16T17:53:13.281Z
---

Feature scellée (28/07/2026, PR #8) : sur la page d'un script (sidebar ContentDocumentSidebar, sous "Rushs partagés"), une section **Références** permet de piocher une ou plusieurs inspirations depuis la bibliothèque Inspiration (table `inspirations`, champ `kind` = court/long/dump/miniature/sujet). Chaque référence attachée porte une **note perso libre, une note PAR référence**, écrite après l'attachement. Pense-bête visuel pour le créateur et le monteur ("réf pour le montage"). L'IA ne s'en sert PAS.

**Why:** Jonathan voulait, à côté des rushs partagés, pouvoir épingler des références visuelles piochées dans Inspiration. Décisions de brainstorm : Vision "pense-bête visuel" (option 1, pas d'entrée dans le prompt IA) ; picker scénario A (grille + filtres par format, sélection multiple) choisi parmi 3 maquettes ; note par référence (pas commune à la sélection).

**How to apply:**
- Convex : champ `attachedReferences?: { inspirationId: Id<"inspirations">, note?, addedAt, addedByClerkUserId }[]` sur `contentItems` (optionnel, zéro migration). Mutations addReference/removeReference/updateReferenceNote dans contentItemExtras.ts (pattern rushLinks + assertCanAccess). Query inspirations.getByIds (scope owner effectif, même shape aplati que inspirations.list).
- UI picker : ReferencePicker.tsx = REPRISE DIRECTE du module Inspiration (règle Thomas 29/07 : ne rien réinventer). Racine `.insp-root` + inspiration.css, cartes `.card` du feed, maçonnerie useMasonry, rendu média par CardMedia (importé d'InspirationFeed) — le rendu média partagé vit dans `@/lib/inspirationMedia` (DumpStage, Thumb, linkVisual, parseUrl…). L'ancienne décision « images propres, pas de vidéo qui tourne » est OBSOLÈTE.
- MISE À JOUR 16/08/2026 (demande explicite Jonathan, commit a0546aac) : les références doivent VIVRE comme dans Inspiration. ReferenceCard (ContentDocumentSidebar.tsx) rend son média via CardMedia → vidéo en autoplay muet + scrub, dump feuilletable, minia figée. Le CLIC n'ouvre PLUS la plateforme en _blank : il ouvre ReferencePreview, un aperçu portalé sur body (`.insp-root.insp-overlay-root` + `.dialog` → tout le SaaS flouté, header/sidebar compris) avec CardMedia en mode detail (son + avance dans la vidéo, sans quitter la plateforme), DumpStage pour un dump, image pour une miniature. L'original reste accessible via une icône ExternalLink dans la ligne meta.
- Historique : v1 crop 3/4 déformé ; v2 LiveThumb autoplay REFUSÉ visuellement à l'époque ; l'extraction du moteur, jugée trop lourde le 29/07, a finalement été faite par Thomas (module partagé + export CardMedia), ce qui a rendu la reprise triviale.
- On stocke SEULEMENT inspirationId + note, jamais url/thumbUrl (les miniatures IG expirent). Visuel résolu à la lecture via getByIds.
- Livré via branche feat/script-references + PR #8, jamais push direct main. Voir [[feedback_never_overwrite_thomas_work.md]] (Thomas bosse le même code depuis une instance sur le VPS). Checks Vercel verts.
- Rappel : les rushs partagés vivent dans ContentDocumentSidebar.tsx, PAS dans script/page.tsx.
