---
name: project_brvndlab_pipeline_redesign_notion
description: Redesign Pipeline Brvndlab — direction Notion validée (dark D + clair Color Lanes scellé 2026-06-13)
metadata: 
  node_type: memory
  type: project
  originSessionId: 891eaab9-8ef6-4fcf-a347-420863b4ac39
---

Refonte visuelle du board Pipeline de Brvndlab (app.brvndlab.com). Jonathan n'aimait pas le look (trop de chrome par carte : Assigner+Modifier+suppr+lien toujours visibles). Direction retenue après brainstorm visuel : **style Notion**, mais palette Brvndlab (pas les couleurs Notion).

**Décisions scellées (2026-06-13) :**
- Dark validé en premier = **Direction D « Notion Dark »** (vividflow… non : brvndlab-mockups.vercel.app/pipeline-redesign-D).
- Clair retenu = **« Color Lanes »** = `brvndlab-mockups.vercel.app/pipeline-light-3`. (Écartés : Paper Tint = tint sur carte ; White & Headers = cartes blanches couleur dans header seul.)

**Principe Color Lanes (à reproduire pixel par pixel) :**
- Chaque colonne = une **lane teintée douce derrière toute la colonne** (`hsl(h, ~s+30%, 96.5%)`, bordure `hsl(h, s+10%, 91%)`, radius 16, padding 10). Cartes **blanches** dessus.
- C'est la **couleur de colonne qui range** (lane), pas le chrome. Teintes très désaturées (lightness 96-97%) = anti-bonbon.
- Hue par colonne : Brainstorming 258 (violet), Production 212 (bleu), Montage 28 (orange), Prêt à programmer 150 (vert), Programmé/Publié 40 (ambre).
- Pill de titre coloré (`hsl(h, s+34%, 89%)` bg / `hsl(h, s+6%, 34%)` text) + count muted.
- Cartes : disque + initiale plateforme (**jamais logo officiel IG/YouTube/TikTok** — règle Brvndlab), titre, 2 chips empilés = **funnel** (TOFU bleu #1D4ED8 / MOFU ambre #B0660A / BOFU rouge #D23B3B sur fonds pastel) + **format** coloré par type, date discrète en bas (orange si « Planifier »).
- **Calme** : actions (Modifier/lien/suppr) + outils colonne `⋯ +` masqués, révélés au survol. « + Nouvelle page » orange en bas de colonne.

Fichiers mockup : `pipeline-light-3.html` (+ `pipeline-light-data.js` partagé data/render). Index compare : `pipeline-light-index`. Voir [[feedback_schmid_template_strict]] pour la règle « variante validée = reproduite pixel par pixel ».

**Implémenté en prod (2026-06-14)** : composant `src/app/(app)/content/page.tsx` (rendu par `/pipeline` via `view="pipeline"`). Color Lanes appliqué sur la lignée **`feat/dark-mode`** (la lignée live : route /pipeline + tokens var(--…) + dark toggle off par défaut), dans le repo propre `~/dev/brvndlab-claude`. Commit `0666440`.
- Modifs : `KANBAN_COLUMNS` porte un `hue` ; lane = `hsl(hue 58% 52% / 0.07)` (translucide → marche clair+sombre) ; pill titre coloré ; cartes = disque+initiale (composant `Disc`), titre 14px, chips funnel/format empilés, footer date+actions au survol.
- Layout (demande Jonathan 2026-06-14) : vue Pipeline élargie `max-w-[1600px]`, board en `flex gap-4 overflow-x-auto`, colonnes `w-[300px] shrink-0` → **scroll horizontal** + cartes plus larges (avant : `grid grid-cols-5` écrasait tout dans 1100px).
- Dark mode : Jonathan dit "non" mais on reste sur feat/dark-mode (toggle off par défaut) car déployer la vieille lignée light-only casserait la route /pipeline. Voir [[feedback_brvndlab_repo_path_and_git_rules]].
