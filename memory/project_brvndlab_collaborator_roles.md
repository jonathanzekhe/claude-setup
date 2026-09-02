---
name: Rôles collaborateurs Brvndlab
description: 7 rôles officiels (4 contenu + 3 commerciaux) avec accès configurables. Final 2026-04-30.
type: project
originSessionId: b89456e2-2692-4863-b103-66dec20d323d
---
Brvndlab a **7 rôles collaborateurs** : 4 côté contenu + 3 côté commercial. Chaque collaborateur a un rôle qui définit un *accès par défaut*, mais Jonathan peut **override page par page** via le drawer de la fiche.

## Les 7 rôles

### Côté contenu

| Label UI         | Valeur DB       | Couleur pastel  | Couleur texte | Icône (lucide) |
| ---------------- | --------------- | --------------- | ------------- | -------------- |
| Monteur          | `monteur`       | #EEF2FF         | #6366f1       | Scissors       |
| Clipeur          | `clippeur`      | #E0F2FE         | #0ea5e9       | Film           |
| Mini-Maker       | `minimaker`     | #EDE9FE         | #8b5cf6       | Sparkles       |
| Head of content  | `headofcontent` | #FFF7ED         | #f97316       | Crown          |

### Côté commercial

| Label UI         | Valeur DB       | Couleur pastel  | Couleur texte | Icône (lucide) |
| ---------------- | --------------- | --------------- | ------------- | -------------- |
| Setter           | `setter`        | #FCE7F3         | #ec4899       | PhoneCall      |
| Closer           | `closer`        | #DCFCE7         | #16a34a       | Headphones     |
| Triageur         | `triageur`      | #FEF3C7         | #d97706       | ListChecks     |

## Orthographe

- **Clipeur** (1 seul `p`) — pas Clippeur, pas Clip-eur.
- **Mini-Maker** (avec tiret en label, valeur DB = `minimaker` sans tiret).
- **Head of content** (en minuscules sauf le H, pas de tiret).
- **Setter / Closer / Triageur** (sans accent, lowercase en DB).
- Valeurs DB : tout en lowercase, pas de tiret.

## Accès par défaut (override possible par collaborateur)

- **Monteur / Clipeur / Mini-Maker** : Dashboard, Calendrier, Contenu, Messages
- **Head of content** : Dashboard, Brand OS, Calendrier, Contenu, Analytiques, Radar, Leads, Messages
- **Setter / Closer / Triageur** : Dashboard, Leads, Messages

## Override des accès (`customAllowedPages`)

Chaque fiche collaborateur peut avoir un champ `customAllowedPages: string[]` dans Convex qui **prend le pas** sur le défaut du rôle. Le drawer affiche des checkboxes pour cocher/décocher chaque page individuellement. Si Jonathan n'a rien personnalisé, le défaut s'applique. Bouton "Réinitialiser au défaut du rôle" pour effacer le custom.

Pages possibles (labels) : `Dashboard`, `Brand OS`, `Calendrier`, `Contenu`, `Analytiques`, `Radar`, `Messages`, `Leads`.

## Schema DB (rétrocompat)

Le schema Convex `collaboratorRole` accepte 9 valeurs au total :
- 7 valeurs actives (les 7 ci-dessus)
- 2 valeurs legacy : `graphiste`, `videographe` (plus exposées en UI mais les anciens enregistrements restent valides)

## Why

Confirmé par Jonathan le 30 avril 2026 (session collaborateurs) : on ajoute Setter, Closer, Triageur en plus des 4 rôles contenu. Tous les accès doivent être *modifiables par fiche* et pas seulement *figés par rôle*.

## How to apply

- Toute UI qui propose un rôle (modal d'invitation, drawer édition, filtres) utilise les 7 valeurs.
- Le label "Mini-Maker" s'écrit avec tiret partout (UI), mais la valeur DB reste `minimaker`.
- Quand on ouvre le drawer d'une fiche, charger `customAllowedPages` si présent, sinon utiliser le défaut du rôle. Sauvegarder uniquement `customAllowedPages` si Jonathan a touché les checkboxes (sinon laisser undefined pour rester sur le défaut).
- `useRouteGuard` lit `customAllowedPages` depuis `getActiveContext` et le mappe vers les routes (`Dashboard → /dashboard`, etc.).
- Les anciennes valeurs `graphiste` et `videographe` ne doivent plus être proposées dans aucun formulaire.
