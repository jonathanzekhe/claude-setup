---
name: project_brvndlab_brouillon_vs_pipeline
description: "Contenu d'angle en \"brouillon\" invisible tant que non ajouté à la pipeline ; seul le validé apparaît dans \"Contenus créés avec cet angle\""
metadata: 
  node_type: memory
  type: project
  originSessionId: abdd70b7-74c5-4b6c-b52c-b7eb8e155083
  modified: 2026-07-30T15:47:48.193Z
---

Règle scellée (28/07/2026) : un script/carousel/story créé depuis un angle vit en statut Convex **"brouillon"** (non validé, invisible) tant que l'utilisateur ne clique pas **"Ajouter à la pipeline"**. À ce clic seulement, il passe en **"draft"** (= "Post validé", colonne 1 pipeline). Rien n'est jamais supprimé au départ : le brouillon est conservé, invisible, et se rouvre par le MÊME chemin (retransformer l'angle dans le même format via findByAngleFormat).

**Why:** Avant, "draft" servait deux rôles (brouillon jamais validé ET colonne 1 pipeline) → brouillons non finis affichés partout + doublons de titre dans la pipeline. Traumatisme n°1 de Jonathan : les doublons. Il refuse aussi qu'un crash supprime un travail de plusieurs heures (donc invisible ≠ supprimé).

**How to apply:**
- Nouveau statut Convex "brouillon" dans schema.ts + statusType (contentItems.ts).
- Création/génération IA/autosave → "brouillon". Validation (handleAddToPipeline) → "draft".
- findByAngleFormat / dedupeAngleContents / previewDedupe / previewDedupeByEmail / discardDraft ciblent "brouillon" comme jetable. "draft" rejoint le set PRODUCED (préservé).
- Fiche angle "Contenus créés avec cet angle" (angles/[id]/page.tsx) : filtre `alive` exclut "brouillon" ET "archived". Libellé draft = "Post validé" (plus "Brouillon").
- calendar/page.tsx a un type ContentItem manuel à étendre avec "brouillon" (sinon typecheck casse).
- Migration rétro-compatible : contenus existants restent "draft" (dans la pipeline).
- Livré via PR #7 (branche feat/brouillon-status-separation), jamais push direct sur main. Voir [[feedback_never_overwrite_thomas_work.md]] : Thomas bosse le même code depuis une instance Claude sur le VPS, donc branche + PR obligatoire, jamais force-push.
- Second temps possible (non fait) : Jonathan a évoqué une "solution pour les brouillons" mais a tranché Vision A (invisible, pas d'onglet dédié).
- MAJ 30/07/2026 : les brouillons SONT affichés (grisés) dans "Contenus créés avec cet angle" mais ne comptent pas dans le badge. Ajout demandé par Jonathan : bouton poubelle + confirm() sur chaque ligne brouillon de la fiche angle → appelle discardDraft (garde-fou serveur : ne supprime QUE status==="brouillon"). Déployé prod (commit df591dc4).
