---
name: project-brvndlab-rush-dossiers-insupprimables
description: Rush — les dossiers de la structure de base sont INSUPPRIMABLES (règle Jonathan 09/08)
metadata: 
  node_type: memory
  type: project
  originSessionId: a3583f56-cfd0-4116-8fbf-476dfcfacf08
  modified: 2026-08-09T13:56:01.987Z
---

Règle Jonathan (2026-08-09) : dans Rush, les dossiers de la structure de base ne peuvent JAMAIS être supprimés. On peut en ajouter, jamais supprimer ceux-là.

- Projet « Projets vidéo » : Rushs, B-rolls, Éléments graphiques, Livraisons (+ Validé côté statuts).
- Projet « Espace Marque » : Logos, Charte graphique, SFX & jingles.

**Implémentation** : ces dossiers sont identifiés par leur champ `icon` (posé uniquement par `ensureDefaults` / migrations dans `convex/rush.ts`, jamais par `createFolder`). Protection double : `removeFolder` (Convex) throw si `!parentId && icon`, et le menu « Supprimer » est masqué côté UI dans `src/app/(app)/rush/p/[id]/page.tsx`. Renommer reste permis.

**Ordre canonique d'affichage** (09/08, pour tout le monde, rail + grille) : Éléments graphiques, B-rolls, Rushs, Livraisons, Validé — du brut vers le fini, de haut en bas. Dossiers perso après. Implémenté par `structureRank()` dans la page projet Rush.

Liée à [[project-brvndlab-broll-structure-feature]] et à la structure par nature (livraison/rushs) du 31/07.
