---
name: Script references, insertion d'éléments visuels dans le script
description: Feature validée à ajouter dans le module Contenu/Script, permettre d'insérer des références visuelles (liens, PDF, dossiers) attachées au script, idéalement timestampées.
type: project
---

Jonathan a demandé le 2026-04-09 d'ajouter une **fonctionnalité spécifique** dans le module Contenu/Script : la possibilité d'**insérer des éléments de référence** attachés au script, idéalement **timestampés à des secondes précises**.

**Why:** Une fois que le script est écrit, Jonathan veut pouvoir enrichir son script avec les références qui ont inspiré ou structuré son contenu. Ça permet à son monteur ou à lui-même de comprendre **pourquoi** il a choisi ces références et **où** les insérer dans la vidéo. C'est aussi un outil de mémoire pour ne pas perdre les sources. Le timestamp à la seconde est un bonus de précision, pas obligatoire.

**How to apply (quand on codera le module Contenu/Script) :**

- **Types de références supportées** : liens URL, PDFs, dossiers (Google Drive, Dropbox), images, vidéos, documents Notion, tout type de fichier attachable.
- **Interaction** : dans l'éditeur de script, possibilité d'ajouter une référence via un bouton "Ajouter une référence" ou un drag and drop direct sur le texte.
- **Timestamp optionnel** : la référence peut être liée à une seconde précise du script (ex: 00:42) ou attachée globalement au script entier.
- **Affichage** : chaque référence apparaît comme une petite card sur le côté du script avec son type (icône PDF/URL/folder/etc.), son titre, son URL ou chemin, et un champ "Pourquoi cette référence ?" pour que Jonathan note sa justification.
- **Visibilité** : les références sont visibles par Jonathan, ses collaborateurs qui ont accès au script (monteur, assistant), mais pas par les autres clients.
- **Persistance** : stockées dans Convex lié à l'entité script, supportent les types fichier via Vercel Blob ou Convex file storage.
- **Scope** : cette feature n'est PAS à mocker maintenant, c'est une demande à implémenter directement au Chantier B dans le module Contenu/Script.
- **Priorité** : MVP v1 si possible (feature à valeur perçue élevée pour Jonathan), sinon v1.1.
