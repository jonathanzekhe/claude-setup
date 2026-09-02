---
name: project_brvndlab_script_versioning_undo_redo
description: "Versioning des scripts Brvndlab — undo/redo par flèches empilées, isolé par script, jamais de curseur"
metadata: 
  node_type: memory
  type: project
  originSessionId: a37a3368-7eda-407d-8bf9-980db1db3c7c
  modified: 2026-07-29T12:14:58.407Z
---

Versioning des scripts dans Brvndlab (éditeur `src/app/(app)/brainstorming/script/page.tsx`).

**Décision 1 (scellée 29/07/2026).** Undo = flèche arrière, cliquable PLUSIEURS fois pour remonter les versions successives d'une section. Redo = flèche avant, apparaît dès qu'on a reculé, ramène vers le présent cran par cran. On EMPILE les versions et on ne jette RIEN tant qu'on navigue (contrairement à l'undoRefine actuel ligne ~1564 qui fait `delete n[index]` après restauration = aller simple, à corriger). Même UI/charte que le bouton `refundo` existant, style `Undo2`. **PAS de curseur, pas de nouveau concept à l'écran, pas de complexité** — juste deux flèches soft dans la charte existante. Deux granularités : section (capsule) ET script entier (snapshot avant refonte/brainstorm, via `contentItemVersions` déjà en base mais pas restaurable).

Backend existant : `snapshotVersion` + `listVersions` dans `convex/contentItems.ts` (isolé owner+itemId, aucune mutation restore encore). Manque : restore + redo + UI branchée sur le fil script entier.

**Décision 2 (scellée 29/07/2026) — isolation stricte.** Voir [[project_brvndlab_seconde_brain_comment_ecrire]] : la seconde brain ne stocke QUE des règles de style transversales (le « comment j'écris »), apprises des corrections faites sur les scripts, appliquées à TOUS les prochains scripts. Le contenu versionné d'un script reste ISOLÉ à ce script (clé itemId). Une demande « remets une ancienne version » ne pioche JAMAIS dans un autre script ni un brouillon — uniquement les flèches undo/redo de CE script. Les deux mémoires ne communiquent pas : règles montent+redescendent partout, phrases enfermées dans leur script. Origine : incident où la mauvaise version (autre capsule) a été rendue. Miroir de [[project_brvndlab_brandos_versioning_memory]].
