---
name: design-max
description: Use for ANY design, UI, UX, frontend, mockup, deck, layout, typography, color, motion, animation, micro-interaction, visual polish, design-system, redesign, or copy-craft work on VividFlow, Brvndlab, or any project. Triggers on building/reviewing components, pages, decks, landing pages, dashboards, "make it premium", "polish this", "UI review", "redesign", "anti-slop". ALSO the master trigger phrase "active le skills de design" / "active les skills de design" / "active design" loads the full bundled design stack at once.
---

# Design Max : stack de design consolidé

Une seule skill qui réunit 7 sources de craft design + les 2 profils de marque de Jonathan. Objectif : du frontend production-grade, distinctif, **zéro look « IA générique »**.

## Protocole d'activation

Quand Jonathan dit **« active le skills de design »** (ou design work explicite) :

1. **Identifie la marque** → lis `references/brand-vividflow.md` OU `references/brand-brvndlab.md` (jamais confondre les deux). Hors VividFlow/Brvndlab : saute cette étape.
2. **Charge le craft** selon le besoin (table ci-dessous). Sur un « active le skills de design » sec sans tâche précise, lis au minimum `impeccable.md` + `taste.md` + `motion-emil.md` (le cœur anti-slop + motion), puis annonce que la stack est armée et demande la cible.
3. **Applique la doctrine fusionnée** ci-dessous à tout ce que tu produis.

## Références bundlées

| Fichier | Quand le lire |
|---|---|
| `references/brand-vividflow.md` | Tout travail VividFlow (positionnement, DA crème/terracotta/Fraunces, ton dirigeant) |
| `references/brand-brvndlab.md` | Tout travail Brvndlab (Frosted Bento, dark #0A0A09/orange, radius 28/16/8, voix « on ») |
| `references/impeccable.md` | **Le plus important.** Règles anti-slop déterministes, bans absolus, 23 commandes (`craft`/`critique`/`polish`/`bolder`/`quieter`/`animate`/`typeset`/`colorize`/`live`…) |
| `references/taste.md` | Choisir une direction esthétique depuis un brief (industrie/audience/mood), éviter les familles saturées, mapper vers un design framework |
| `references/motion-emil.md` | Toute animation/micro-interaction : framework de décision, easings forts, durées, springs, perf, prefers-reduced-motion |
| `references/frontend-design.md` | Engager une direction BOLD, typo distinctive, composition spatiale inattendue |
| `references/ui-ux-pro-max.md` | Hiérarchie visuelle, 8px grid, composants (cards/boutons/forms/modals), checklist de revue, a11y WCAG |
| `references/taste-minimalist.md` · `taste-brutalist.md` · `taste-soft.md` | Lentilles esthétiques spécialisées selon la DA visée |
| `references/taste-redesign.md` | Audit visuel + protocole de redesign d'un existant |
| `references/anthropic-canvas-design.md` | Art statique PNG/PDF (couverture de deck, poster, visuel d'ouverture) |
| `references/anthropic-brand-guidelines.md` · `anthropic-theme-factory.md` | Gabarits de référence (palette/typo). Marginaux : nos DA sont déjà figées |

## Doctrine fusionnée (le 20 % qui fait 80 %)

**Le test ultime : si quelqu'un peut dire « c'est une IA qui a fait ça » sans hésiter, c'est raté.**

### Direction avant pixels
- Engage **une** direction esthétique nette (minimalisme raffiné OU maximalisme assumé) et exécute-la avec précision. L'intentionnalité prime sur l'intensité.
- Écris une phrase de scène concrète (qui utilise ça, où, sous quelle lumière, quelle humeur) avant de choisir light/dark et la palette. Si la phrase ne force pas la réponse, elle n'est pas assez précise.
- **Category-reflex check** : si on peut deviner thème + palette depuis la catégorie seule, c'est le premier réflexe d'entraînement. Rebosse jusqu'à ce que ce ne soit pas évident.

### Typographie
- Fonts distinctives. **Bannir Inter / Roboto / Arial / system fonts** par défaut (ok seulement si c'est un système de marque assumé). Ne jamais converger sur le même choix (ex. Space Grotesk) d'un projet à l'autre.
- Pairing sur axe de contraste (serif + sans, geometric + humanist), max 3 familles. Hiérarchie par scale + poids (ratio ≥ 1.25).
- `text-wrap: balance` sur h1–h3. Pas d'ALL CAPS en body. Display clamp max ≤ ~6rem, letter-spacing ≥ -0.04em.

### Couleur
- Contraste body ≥ 4.5:1 (le gris clair « pour l'élégance » est la cause n°1 d'illisibilité IA). Placeholder aussi à 4.5:1.
- Couleurs dominantes + accents nets > palettes timides équiréparties. OKLCH. CSS variables.
- **Le crème/sand/beige near-white est le défaut IA saturé de 2026.** Si la DA n'impose pas le crème (VividFlow l'impose, lui), porte la chaleur par l'accent + la typo, pas par un fond beige-tinté.

### Layout
- Cards = la réponse paresseuse. Ne les utilise que si c'est vraiment la meilleure affordance. Cards imbriquées = toujours faux. Grilles de cards identiques = tell.
- Asymétrie, overlap, espace négatif généreux OU densité contrôlée. Flexbox 1D, Grid 2D. Z-index scale sémantique (jamais 9999).
- Une info ne se répète jamais sur une même page (zéro redondance).

### Motion (cf. motion-emil.md)
- D'abord : **est-ce que ça doit s'animer ?** Action clavier / vue 100×/jour → pas d'animation. Occasionnel (modal, toast) → standard. Rare → délice possible.
- Easings **forts custom** (`cubic-bezier(0.23,1,0.32,1)`), jamais `ease-in` sur de l'UI. Durées UI < 300ms. Jamais `transition: all`. Jamais `scale(0)` (partir de `scale(0.95)` + opacity).
- Anime seulement `transform`/`opacity`. Stagger 30–80ms. `prefers-reduced-motion` obligatoire (crossfade, pas zéro motion). Un reveal ne doit jamais gater la visibilité du contenu (sinon page blanche en prod).

### Bans absolus (réécrire si tu allais l'écrire)
- Side-stripe `border-left` coloré sur cards/alertes. Gradient text (`background-clip:text`). Glassmorphism décoratif par défaut. Hero-metric template (gros chiffre + stats + accent gradient). Eyebrow uppercase tracké au-dessus de chaque section. Marqueurs numérotés 01/02/03 par défaut. Texte qui déborde son conteneur.

### Copy (transverse aux deux marques)
- **Jamais d'em-dash** (`—` ni `--`). Pas de buzzwords (streamline/empower/supercharge/leverage/seamless/world-class/next-gen…). Pas de mots-béquilles. Français de France.
- Chaque mot gagne sa place, pas de titre reformulé. Labels boutons = verbe + objet (« Enregistrer les modifications » > « OK »). Liens au sens autonome.

### Exécution
- Production-grade, pas prototype. Match la complexité du code à la vision (maximaliste = code élaboré ; raffiné = retenue + précision). Vérifie au navigateur (screenshot) avant de rendre la main. **Don't hold back.**

## Garde-fous Jonathan
- Identifier **VividFlow vs Brvndlab** avant tout acte.
- Mockups d'abord, **jamais de deploy prod sans validation explicite**. Variante validée = reproduite pixel par pixel.
- Vérifier le **live** après push (push ≠ déployé). Lien preview cliquable en tête. Ouvrir dans **Chrome**.

> Skills d'origine conservées intactes (`ui-ux-pro-max`, plugin `frontend-design`). Celle-ci les fusionne et les étend. Pour repartir des sources : dossier `references/`.
