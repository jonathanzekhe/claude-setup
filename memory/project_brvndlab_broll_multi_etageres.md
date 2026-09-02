---
name: project-brvndlab-broll-multi-etageres
description: "Rush B-rolls — multi-étagères validé 09/08 : une vidéo visible dans plusieurs dossiers de scène (références, jamais de copies), B-rolls UNIQUEMENT"
metadata: 
  node_type: memory
  type: project
  originSessionId: a3583f56-cfd0-4116-8fbf-476dfcfacf08
  modified: 2026-08-09T13:36:23.955Z
---

Décision Jonathan (2026-08-09, validée et déployée) : dans Rush, **uniquement la section B-rolls**, une vidéo peut être visible dans plusieurs dossiers de scène — modèle « playlist » : un seul fichier physique, des références. Jamais de duplication (stockage ×N + commentaires qui divergent = interdit).

- Modèle : `rush_assets.folderId` = dossier principal, `extraFolderIds` = références. Absent = comportement classique.
- Import dans B-rolls : chips « Aussi dans » (modale Importer une vidéo).
- Suppression à deux gestes si multi : « Retirer de ce dossier uniquement » (`removeAssetFromFolder`, promotion du principal si besoin) vs « Supprimer partout » (`removeAsset`).
- Un dossier supprimé promeut les vidéos qui vivent ailleurs au lieu de les détruire ; le fichier ne meurt que quand plus aucun dossier ne le référence.
- Hors B-rolls (Rushs, Livraisons) : un fichier = une place, ne jamais étendre sans validation.
- Import depuis la RACINE B-rolls avec thèmes cochés : la 1re coche devient le dossier principal (jamais de vidéo posée à la racine en plus des thèmes — bug Rafaela réparé + migration `migrateBrollRootRefs`).
- Menu vidéo B-rolls : « Ajouter à un dossier » = références en plus sans déplacer (rayons, déjà-dedans grisés).
- KPI dashboard Rush : la matière neutre (B-rolls, éléments…) ne compte JAMAIS dans les statuts (à récupérer/à revoir/validé) — seuls Rushs, Livraisons, Validé alimentent l'avancement (règle 09/08).

Liée à [[project-brvndlab-rush-dossiers-insupprimables]] et [[project-brvndlab-broll-structure-feature]].
