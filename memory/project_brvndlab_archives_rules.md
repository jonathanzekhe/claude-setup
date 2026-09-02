---
name: project-brvndlab-archives-rules
description: "Archives Brvndlab — archive = contenu PUBLIÉ uniquement, 24h, anti-doublon structurel dans le cron, purge du 30/07"
metadata: 
  node_type: memory
  type: project
  originSessionId: 3412dc2b-3b95-42ef-937b-a36137bc2d8d
  modified: 2026-07-30T05:47:21.138Z
---

Règles archives scellées le 30/07/2026 (commit 6f3807b5, déployé Convex prod accurate-cormorant-297) :

- `contentItems.update` REFUSE `status: "archived"` si l'item n'est pas passé par `published` (garde backend, l'UI cachait déjà le bouton).
- `publishedAt` est posé au passage en published ; le cron archive **5 jours** après CETTE date (règle Thomas 29/07, CONFIRMÉE par Jonathan le 30/07 : « s'il l'a mis à 5 jours, il a une raison »). Constante unique `PUBLISHED_TO_ARCHIVE_HOURS` dans contentItems.ts.
- Le cron `archiveOldPublished` collapse à chaque passage les doublons EXACTS d'archives (même owner+angle+format+titre, garde le plus récent) : un doublon d'archives ne survit jamais plus d'une heure.
- Purge du 30/07 : 35 items archivés supprimés (32 jamais publiés, 1 doublon exact « Ta formation ne te rapportera rien »), vérifié 0 restant. Outils : `contentItems:purgeArchived` (internal mutation) et `contentItems:archivedStats` (lecture seule, à lancer AVANT toute purge).
- Fiche angle : validés + archivés + brouillons visibles, jamais deux fois le même poste. Lié à [[project-brvndlab-brouillon-vs-pipeline]].
