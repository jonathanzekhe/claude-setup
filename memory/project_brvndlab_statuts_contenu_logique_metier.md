---
name: project_brvndlab_statuts_contenu_logique_metier
description: "Brvndlab — logique métier des statuts de contenu : brouillon / archivé / supprimé (SCELLÉ)"
metadata: 
  node_type: memory
  type: project
  originSessionId: 85669be3-5f8f-465a-b4ca-9c318860b9c4
  modified: 2026-07-28T13:50:22.747Z
---

Logique métier des statuts de contentItem, refondue et SCELLÉE 28/07/2026 (demande Jonathan : « les noms ne correspondent pas à l'usage, réaudite tout »).

**LES 3 NOTIONS (définitions fermes) :**
- BROUILLON (draft) = contenu en cours, pas fini. C'est tout.
- ARCHIVÉ (archived) = UNIQUEMENT du contenu qui a été PUBLIÉ puis rangé dans l'historique. JAMAIS un brouillon abandonné. Passage AUTOMATIQUE published→archived 24h après publication (cron horaire `content published to archive` → `contentItems.archiveOldPublished`, date sur publishedAt ?? updatedAt ?? createdAt).
- SUPPRIMÉ = brouillon abandonné (quitter sans mettre en pipeline → discardDraft, draft only).

**Cycle de vie :** création→draft ; draft→production→montage→scheduled (drag pipeline) ; scheduled→published (publication native ou drag) ; published→archived (cron 24h). remove = suppression manuelle (avec confirmation). discardDraft = suppression sûre (draft only, garde serveur).

**Règles UI (brainstorming/page.tsx) :**
- Bouton « Archiver » sur une carte : réservé au statut `published` (« Ranger dans l'archive »). Jamais sur un brouillon/production.
- WIP brouillon non envoyé : « Laisser en pipeline » OU « Supprimer le brouillon » (option Archiver retirée).
- Panneau Archive = `published || archived` (le vrai contenu sorti). Jamais un brouillon.
- Board Kanban : draft→production→montage→scheduled→published(<24h). Archived jamais sur le board.

**Anti-doublon (cf [[project_brvndlab_personas_regen_audience_problemes]] non, plutôt le fix contenus) :** angleId champ INDEXÉ (by_user_and_angle). findByAngleFormat(angleId, format) rouvre QUE des DRAFTS (jamais écraser un produit/publié/archivé) — format déduit du contenu (itemFormat : sections=script, slides+carouselType=carousel, slides+framework=story), PAS la platform (les 3 = Short).

**PIÈGE CRITIQUE (rôle tribunal, 2 passes) :** changer le SENS d'archived (brouillon jetable → publié rangé) casse tout ce qui dépendait de l'ancien sens. dedupeAngleContents/previewDedupe traitaient archived comme `disposable` (supprimable) → aurait DÉTRUIT du contenu PUBLIÉ. Corrigé : `disposable = draft only` ; archived ajouté à PRODUCED (préservé, prioritaire comme keeper). RÈGLE : quand on renomme/re-sémantise un statut, réauditer TOUS ses usages.

**Nettoyage effectué (28/07) :** 15 doublons archivés supprimés du compte Jonathan (9x « croissance », 9x « tu travailles pour ton entreprise » → 1 chacun), via mutation par titre+format (les doublons n'avaient pas d'angleId). 32→17 contenus.

Voir [[feedback_never_overwrite_thomas_work]] (rebase, jamais force-push). Fichiers : convex/contentItems.ts, convex/crons.ts, brainstorming/{page,carousel,new/story}.tsx.
