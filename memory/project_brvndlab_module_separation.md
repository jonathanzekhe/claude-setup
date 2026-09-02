---
name: Séparation stricte des modules, une intention par module
description: Principe d'architecture produit Brvndlab, chaque module a une intention unique et ne la dépasse pas, pas d'actions transverses au mauvais endroit.
type: project
---

Chaque module de Brvndlab a une **intention unique** et ne la dépasse pas. Les actions ne peuvent être effectuées que dans le module qui leur est dédié. Le passage entre modules se fait uniquement par **navigation discrète** (liens, redirections), jamais par des boutons d'action déguisés posés au mauvais endroit.

**Why:** Jonathan a explicitement posé ce principe le 2026-04-08 pendant la conception du module Veille. Il compare ça au Calendrier, où l'on ne peut pas créer du contenu depuis le calendrier, on ne peut que visualiser et planifier, la création se fait dans le module Contenu. Cette règle évite que les écrans deviennent surchargés d'options, que l'utilisateur se perde sur "où faire quoi", et que les modules se mélangent. Les meilleurs produits SaaS premium (Linear, Notion, Superhuman) suivent ce principe religieusement.

**Intentions par module:**
- **Veille**: observer, rien d'autre. On voit ce que les autres font, on ne crée rien, on ne brainstorme rien depuis là.
- **Recherche**: chercher activement, analyser en profondeur. Le coach tape un sujet, creuse des vidéos, comprend des patterns.
- **Contenu / Brainstorm**: créer. C'est ici et nulle part ailleurs qu'on transforme une idée en script, plan, publication.
- **Calendrier**: planifier et visualiser. Pas de création depuis le calendrier.
- **Analytics**: mesurer et comprendre. Pas de création d'action depuis Analytics.
- **Brand OS**: définir l'identité stratégique. Pas de publication depuis le Brand OS.
- **Fiche Membre (coach)**: suivre un client. Pas d'édition de son Brand OS depuis là.

**How to apply:**
- Avant d'ajouter un bouton d'action quelque part, vérifier que l'action appartient au scope du module. Si non, remplacer par un lien de navigation discret vers le bon module ("Voir dans Recherche", "Ouvrir dans Contenu").
- Les redirections pré-chargent le contexte (ex: cliquer sur "Voir dans Recherche" depuis une vidéo de Veille ouvre Recherche avec cette vidéo déjà analysée).
- Cette règle s'applique aussi aux futurs modules et aux futurs produits de l'écosystème Jonathan (Performance OS, futur SaaS setting DM).
- Quand on hésite, le test mental est: "Si je retire ce bouton d'action, est-ce que l'utilisateur peut quand même faire ce qu'il veut en passant par le bon module ?". Si oui, on retire le bouton.
