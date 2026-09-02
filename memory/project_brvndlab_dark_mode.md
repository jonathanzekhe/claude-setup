---
name: project_brvndlab_dark_mode
description: "Toggle mode clair/sombre Brvndlab — palette brainstorm-functional, tokens CSS, PR"
metadata: 
  node_type: memory
  type: project
  originSessionId: b5389008-ebc1-497f-9099-0755ff875315
---

Mode clair/sombre sur app.brvndlab.com. Livré sur **branche `feat/dark-mode` (PR #4)** basée sur `origin/main` (la vraie prod CTO — voir [[project_brvndlab_local_vs_github_divergence]]).

**Palette dark = "brainstorm-functional"** validée par Jonathan 05/06 : noir chaud `#0A0A09`, surfaces `#15140F`, texte `#F5F3EE`, accent orange `#f97316` (identique au light). Inspirée du mode brainstorm immersif (`.screen` glow), mais **fonctionnelle** : pas de serif, pas de glow sur chaque carte, lisible sur écrans data.

**Architecture :** tokens CSS sémantiques dans `globals.css` (`:root` light = valeurs hardcodées actuelles → **light strictement préservé** ; `[data-theme="dark"]` = palette dark). ThemeProvider (light défaut, persistance `localStorage` clé `brvndlab.theme`) + script anti-FOUC dans layout. Toggle dans **Réglages › Apparence**.

**Méthode = recolor only, sweep déterministe** (~5 360 littéraux → tokens, 91 fichiers, allow-list explicite). Frosted cards : `bg-white/80` → `bg-[var(--surface)]/80` (opacité préservée via color-mix Tailwind v4). **Préservés** : couleurs de marque (YouTube/TikTok/IG/Stripe/Calendly), gradients, text-white, overlays bg-black, onboarding dark.

Règle clé : pour rethémer une page, swap hex/named → token (`bg-white`→`bg-[var(--surface)]`, `text-[#1A1A2E]`→`text-[var(--text)]`). Une fois tokenisée, elle thème dans les 2 modes gratuitement.

À review CTO : contraste écrans data-denses (Leads/Analytics/Radar) + frosted cards en dark.
