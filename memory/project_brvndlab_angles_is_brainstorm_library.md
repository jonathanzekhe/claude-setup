---
name: project_brvndlab_angles_is_brainstorm_library
description: "La bibliothèque de brainstorms Brvndlab = la page /angles (cartes TOFU/MOFU/BOFU), pas le board kanban /brainstorming"
metadata: 
  node_type: memory
  type: project
  originSessionId: 249b19d7-0a15-4b6c-bcdf-ed7bc10aa23e
---

Quand Jonathan parle de "la bibliothèque de brainstorming" / "la section brainstorming pour les créations" avec des CARTES en grille (badges TOFU/MOFU/BOFU, icône corbeille + étoile au survol, "Nouveau dossier", "Tout"), il s'agit de la route **/angles** (`src/app/(app)/angles/page.tsx`), PAS du board kanban `/brainstorming` (colonnes brouillon→publié).

- `/angles` = bibliothèque des brainstorms sauvegardés, grille de cartes, dossiers, favoris. Data = `api.angles.*` (list/remove/toggleFavorite/folders).
- `/brainstorming` = board kanban pipeline (contentItems), a déjà sa propre confirmation de suppression (deleteConfirm).

Le 2026-07-22 : ajout d'un pop-up de confirmation avant suppression d'une carte /angles (le clic corbeille appelait `removeAngle` direct). Styles dans le bloc `ANG_TOKENS` (styled-jsx, thème-aware via `html[data-bvh-theme]`), keyframe dédié `dmpop` pour garder le centrage translate(-50%,-50%). Poussé sur main + déployé prod.

**How to apply:** face à une demande sur "la bibliothèque de brainstorm", ouvrir /angles en premier. Réutiliser les tokens `--surface/--border/--text/--text2/--bad` et un keyframe qui préserve le centrage pour tout modal.
