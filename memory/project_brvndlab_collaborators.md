---
name: Brvndlab Collaborators Access
description: Partage granulaire par section façon Notion. Chaque section partageable a un bouton Partager en haut à droite, avec magic link par email et 2 niveaux (Lecture/Modification).
type: project
---

Modèle de partage validé avec Jonathan le 2026-04-08 : **partage granulaire par section, façon Notion**. Pas de rôle global "collaborateur".

## Le mécanisme

Dans chaque section partageable, un bouton "Partager" en haut à droite. Le coach clique, entre l'email du collaborateur, choisit **Lecture** ou **Modification**, valide. Le collaborateur reçoit un **magic link** par email et atterrit directement sur la section partagée, rien d'autre.

## Sections partageables

- **Brand OS** : granulaire (modules internes, modules externes, vidéos, pas forcément le Brand OS entier d'un coup)
- **Création de contenu** : Kanban + fiches contenu
- **Calendrier** : en même temps que Création de contenu, ça va ensemble
- **Analytics / Statistiques** : plus tard, phase 2

## Principe d'isolation

Une même personne peut cumuler des accès à plusieurs sections, mais chaque partage est **ajouté séparément**. Ex: un monteur a accès à Création de contenu + Calendrier en Modification, rien d'autre. Un community manager a accès au module "ton de voix" du Brand OS en Lecture, rien d'autre. Ils ne se voient pas entre eux.

## Flow collaborateur (pas de signup, pas d'onboarding)

1. Coach clique "Partager" sur la section, entre l'email, choisit Lecture ou Modification
2. Compte invité créé en silence en arrière-plan (Clerk, auth passwordless)
3. Collaborateur reçoit un email "Jonathan t'a invité à voir X. Clique ici"
4. Il clique, il atterrit directement sur la section concernée
5. Zéro formulaire, zéro questionnaire, zéro onboarding client
6. Pour revenir plus tard : brvndlab.com → "Accès collaborateur" → email → nouveau magic link

## Ce qu'un collaborateur ne voit jamais

- Les autres sections non partagées
- Les autres collaborateurs
- La facturation, les paramètres du workspace
- L'onboarding client (vidéo, questionnaire, Brand OS setup)

## Why

Les ICP de Jonathan (coachs, consultants) travaillent avec des équipes (monteurs, community managers, assistants). Ces personnes externes ont besoin d'accéder à **certaines** sections uniquement, sans friction (pas de compte à créer), et sans exposer le reste du SaaS. Le modèle Notion est familier pour eux.

## How to apply

- Ne JAMAIS concevoir un rôle "collaborateur" global avec accès pré-défini
- Toujours concevoir le partage section par section
- Bouton "Partager" visible en haut à droite de chaque section partageable
- Magic link obligatoire, pas de création de compte classique
- L'onboarding client complet (vidéo, questionnaire 23 questions) est réservé aux vrais clients coachés, jamais aux collaborateurs externes
