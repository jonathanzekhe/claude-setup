---
name: project-brvndlab-script-editedsections-layer
description: "Page script — toute feature IA qui lit le contenu DOIT passer par getSectionContent, jamais s.content (couche editedSections)"
metadata: 
  node_type: memory
  type: project
  originSessionId: 3412dc2b-3b95-42ef-937b-a36137bc2d8d
  modified: 2026-07-29T19:25:39.050Z
---

Dans `src/app/(app)/brainstorming/script/page.tsx`, le contenu affiché = `getSectionContent(i, s.content)` qui lit la couche `editedSections` (corrections manuelles, affinages, undo/redo) PAR-DESSUS `scriptData.sections[i].content` (texte brut de génération). Story et carousel n'ont PAS cette couche : ils éditent directement `storyData`/`carouselData`.

**Pourquoi :** bug corrigé le 29/07/2026 (commit da5130ae) — le panneau RefonteInterview envoyait `s.content` à l'IA, qui niait les modifications visibles à l'écran (« ce que tu vois est l'original »). Tout nouveau flux IA sur la page script qui envoie `s.content` recréera ce bug.

**Comment appliquer :** toute lecture du script destinée à l'IA (chat, refonte, export, classification) passe par `getSectionContent(i, s.content)`. Le `RefonteBlock` porte un flag `edited` par section, et `api/refonte-content` marque ces sections « CORRIGÉE À LA MAIN » + règle dure dans le prompt (CONTENU ACTUEL = ce qui est à l'écran). Lié à [[project-brvndlab-script-versioning-undo-redo]].
