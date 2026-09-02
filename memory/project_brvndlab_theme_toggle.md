---
name: Toggle mode sombre / mode clair dans l'app
description: Feature validée à implémenter dans l'app Brvndlab, permettre à l'utilisateur de choisir entre mode clair (défaut) et mode sombre.
type: project
---

Jonathan a validé le 2026-04-09 que l'app Brvndlab doit proposer un **toggle mode clair / mode sombre** dans les réglages utilisateur. Le **mode clair** est le mode par défaut (cohérent avec le design-system.md "Frosted Bento Light Mode"). L'utilisateur peut basculer en mode sombre s'il préfère.

**Why:** Dans les mockups, certaines pages étaient en mode sombre (Story et Journal notamment) parce que leur code Next.js existant utilisait ce thème. Jonathan a trouvé l'incohérence gênante : tous les écrans doivent être en mode clair par défaut pour respecter l'esthétique cohérente de la démo. Mais il a ajouté qu'il veut laisser le choix à l'utilisateur final, d'où le toggle.

**How to apply:**
- **Mode par défaut** : clair (frosted bento, #EEF0F4 background, white cards).
- **Mode alternatif** : sombre (#0a0a0a background, #1a1a22 cards).
- **Position du toggle** : dans les paramètres utilisateur (Settings) et idéalement aussi accessible depuis une icône lune/soleil dans la topbar.
- **Persistance** : le choix est stocké par utilisateur (dans Convex users table, champ `theme: "light" | "dark"`) et appliqué à toute l'app.
- **Implémentation technique** : utiliser next-themes ou une stratégie CSS class-based `<html class="dark">` avec des variantes Tailwind `dark:bg-*`.
- **Couverture** : tous les écrans doivent supporter les deux modes. Les nouveaux composants sont codés avec les deux variantes dès le départ.
- **À faire au Chantier B** : la palette mode sombre existe déjà dans les fichiers Story et Journal, on peut s'en inspirer pour décliner les autres écrans en dark.
