---
name: Principes UI/UX core Brvndlab (6 valeurs fondamentales)
description: Les 6 valeurs UX qui guident toutes les décisions d'interface. À appliquer partout sans exception.
type: feedback
originSessionId: e37cd837-5455-4560-bcc5-81b6b082a9c8
---
Les 6 principes UI/UX fondamentaux Brvndlab à appliquer sur chaque écran, chaque card, chaque interaction.

## Les 6 valeurs

1. **Dynamique à l'arrivée** — chaque carte / élément doit arriver de manière dynamique. Pas de mur de contenu qui apparaît d'un bloc. Animation d'entrée fluide (stagger, fade-up, slide-in subtil).
2. **Intuitif** — l'utilisateur sait quoi faire au premier regard. Aucune ambiguïté sur l'action principale.
3. **Épuré** — pas de bruit visuel. Espace blanc respecté. Less is more religion.
4. **Minimaliste** — chaque élément qui ne sert pas à comprendre ou à agir est retiré. Test Jony Ive systématique.
5. **Dynamique en interaction** — toute action a un retour visuel immédiat (hover, transition, loading state). Pas d'écran figé.
6. **Skeleton loading systématique** — chaque carte qui charge de la donnée affiche un skeleton dynamique pendant le fetch. Pas de spinner muet, pas de saut de layout.

**Why:** Ces 6 principes sont la signature de Brvndlab. Sans eux, l'app dérive vers du SaaS générique. Avec eux, l'app a la sensation premium Linear / Notion / Vercel en français.

**How to apply:**
- Avant de livrer un écran : checklist mentale 6/6.
- Skeleton loading obligatoire sur chaque `useQuery` qui peut être `undefined`.
- Animation d'arrivée : Framer Motion `whileInView` ou stagger sur les listes / grids.
- Aucun écran figé pendant le chargement (pas de spinner muet en plein milieu de l'écran).
- Pas d'élément décoratif sans fonction.
