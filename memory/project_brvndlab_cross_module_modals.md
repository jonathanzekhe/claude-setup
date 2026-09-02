---
name: Création cross-module via modal contextuelle
description: Principe d'interaction Brvndlab, la création d'entités depuis un module qui n'en a pas la responsabilité se fait via un pop-up modal du module propriétaire, jamais par une duplication de formulaire.
type: project
---

Quand un module A a besoin de créer une entité qui appartient au module B, on ouvre un **pop-up modal du module B** par-dessus le module A, sans quitter le contexte. Le formulaire du module B est le même composant dans les deux contextes (plein écran quand l'utilisateur est directement dans B, modal quand B est appelé depuis A).

**Why:** Jonathan a validé ce principe le 2026-04-08 pendant la conception croisée des modules Veille et Radar. Le besoin était d'ajouter un concurrent depuis Veille, alors que Radar est le module propriétaire des concurrents (avec forces, faiblesses, pourquoi on les a choisis). Au lieu de dupliquer le formulaire dans Veille (qui casserait le principe "une intention par module"), on appelle Radar en modal. Ça respecte la séparation stricte des responsabilités, ça évite toute confusion sur "où sont stockées les données", et ça garde l'utilisateur dans sa tâche en cours. C'est le pattern utilisé par Linear, Notion, Airtable.

**How to apply:**
- Dès qu'un bouton d'action "Ajouter X" apparaît dans un module qui n'est pas propriétaire de X, il ouvre le formulaire de création du module propriétaire en pop-up modal.
- Le formulaire est un composant React unique, rendu soit en plein écran (depuis son module propriétaire), soit en modal (depuis un autre module).
- La source de vérité reste le module propriétaire, les autres modules lisent depuis lui.
- Exemple canonique validé: ajouter un concurrent depuis Veille ouvre la modal Radar avec tout le flow (nom, plateforme, URL, forces, faiblesses, pourquoi). Une fois validé, le concurrent est stocké dans Radar et apparaît dans Veille automatiquement.
- S'applique aussi par extension: ajouter un sujet de veille depuis Recherche, ajouter une publication depuis Dashboard, ajouter un client depuis Fiche membre, etc.
- Le lien textuel "Gérer dans [Module] →" reste disponible pour accéder au module propriétaire en plein écran si besoin.
