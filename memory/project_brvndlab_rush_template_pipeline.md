---
name: project-brvndlab-rush-template-pipeline
description: "Rush — nouveau template scellé 31/07 (Signatures & bumpers supprimé, Rushs remplace Vidéos à traiter) + vue Pipeline kanban par statuts, mockup validé, LIVE"
metadata: 
  node_type: memory
  type: project
  originSessionId: 333200f7-27e1-4e07-a73a-bad19f6323f8
  modified: 2026-07-31T21:42:03.238Z
---

Décision Jonathan 31/07 (mockup validé : https://brvndlab-mockups.vercel.app/rush-template, lien canonique à rafraîchir, jamais dupliquer).

**Principe scellé : un dossier dit ce que C'EST, le statut dit où ça EN EST.** Jamais de dossier-état (« vidéo à traiter », « vidéo validée ») : double source de vérité refusée après discussion (Jonathan proposait un kanban par déplacement de dossiers, convaincu par la vue Pipeline à la place).

**Template (nouveaux comptes, RUSH_DEFAULT_STRUCTURE dans convex/rush.ts) :**
- Espace Marque : Logos, Charte graphique, SFX & jingles. « Signatures & bumpers » SUPPRIMÉ partout (jargon monteur, inutilisé).
- Projet vidéo : Rushs (ex « Vidéos à traiter »), B-rolls, Éléments graphiques, Exports (seul dossier où À revoir/Validé travaillent : le monteur consomme les 3 premiers, livre dans Exports).

**Migration prod exécutée 31/07 (rush:migrateTemplateV2, internalMutation, one-shot) :** 4 dossiers « Signatures & bumpers » supprimés, 4 « Vidéos à traiter » renommés « Rushs ». Migration douce : contenu recasé dans « SFX & jingles » avant suppression (aucun fichier perdu).

**Vue Pipeline (LIVE, commit 3d0f7fc7) :** dans la page projet /rush/p/[id], bascule Dossiers/Pipeline (rush-viewtoggle), kanban 4 colonnes À traiter/En cours/À revoir/Validé alimenté par api.rush.listProjectPipeline (assets racine du projet, vignettes, dossier d'origine, images exclues). Lecture seule : rien ne se déplace, une vidéo change de colonne quand son statut change. Clic carte → /rush/a/[id].

Trajet type expliqué à Jonathan : dépôt dans Rushs (statut À traiter) → monteur passe En cours, pioche B-rolls/Éléments graphiques/Espace Marque → livre dans Exports (À revoir) → retours au timecode, V2 au même endroit → Validé = le fichier à publier. Voir [[project-rush-video-library]].


## Modèle FINAL par nature (scellé 31/07 soir, LIVE commit 17285b43, migration v3 exécutée : 4 Exports renommés Livraisons, 5 statuts remappés)
- **Statuts par NATURE du fichier** : brut (source) = « À récupérer » / « Récupéré » ; livraison (montage) = « À revoir » / « Validé ». a_traiter/en_cours = legacy migré, plus jamais proposé. B-rolls/Éléments graphiques (images) = pas de statut.
- **« Exports » s'appelle « Livraisons »** (flag `livraison` sur rush_folders + détection par nom Exports/Livraisons pour les dossiers créés à la main). Livraison invitée via lien = a_revoir d'office.
- **Pipeline 3 colonnes actionnables** : À récupérer (carte de LOT groupée par projet, jamais 30 cartes pour un vlog, bouton « Tout récupéré » = rush:markRushsRecuperes, compteur « chez le monteur ») → À revoir → Validé. Les bruts récupérés SORTENT du tableau (le montage en cours ne regarde personne).
- **Multi-fichiers (podcast/vlog)** : sous-dossiers libres dans Rushs, la récupération est par LOT. Pas de bouton template supplémentaire (décision : le plus simple = rien, « Nouveau dossier » suffit).
- Statut par défaut à l'upload selon le dossier (livraisons → a_revoir, sinon a_recuperer). Coche de dossier par nature (Rushs = tout récupéré, Livraisons = tout validé).
- **Audit UI 01/08** : CSS pipeline sur les vrais tokens --rush-* (bug corrigé : fallbacks clairs = cartes blanches en sombre), placeholders 55 %, état vide cliquable (ouvre l'import), labels partout (grille, asset, page invité /v/[token]).


## Correction finale 01/08 (retour Jonathan « trop de confusion », commit e24c7a59, LIVE + migration v4)
- **Pipeline = TOUT le trajet, rien ne disparaît** : À récupérer → En cours (rushs récupérés = montage en cours, ils restaient invisibles avant, corrigé) → À revoir → Validé.
- **Récupération AUTOMATIQUE au téléchargement, AUCUN bouton manuel** : télécharger un rush « à récupérer » le passe « récupéré » tout seul (page asset via onDownloaded, lot « Tout télécharger » de la pipeline, lien invité via markDownloadedViaShare). Le pop-up de rappel a été REJETÉ (« on se prend pas la tête »).
- **Strictement les RUSHS** : nature à 3 états avec héritage des sous-dossiers (rush = dossier Rushs + descendants, flag `rushs` + détection nom ; livraison = flag/nom ; matière neutre = B-rolls/Éléments graphiques SANS AUCUN statut, ni vignette ni menu). Racine du projet = rush. Statut jamais nul : a_recuperer d'office dans Rushs, a_revoir d'office en livraison.
- Vue Dossiers : chip statut + menu par nature sur chaque vidéo (rush : à récupérer/récupéré ; livraison : à revoir/validé).
