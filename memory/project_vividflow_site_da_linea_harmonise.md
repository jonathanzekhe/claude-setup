---
name: vividflow-site-da-linea-harmonise
description: "vividflow.co entièrement harmonisé sur la DA Linea le 2026-07-18 (Satoshi + Instrument Serif, orange"
metadata: 
  node_type: memory
  type: project
  originSessionId: b02d387f-20f9-41f0-b113-574588bcf4fb
---

Le 2026-07-18, tout `~/dev/site-mockups/index.html` (servi sur vividflow.co) a été basculé sur la DA Linea qui n'existait avant que sur navbar + hero :

- **Typo** : Fraunces supprimé partout (16 usages + le link Google Fonts). Titres et display en **Satoshi 500/600** (Fontshare), accents italiques des titres (`em`, `.bridge`) en **Instrument Serif italic**. Inter (body) et IBM Plex Mono (micro-labels) conservés.
- **Couleurs** : `--orange` #E26137 → **#E34400**, hover/deep → #C93D00, `--noir` #231F20 → **#121212**, rgba(35,31,32,x) → rgba(18,18,18,x). Illustrations non touchées (panelColor #D85A3C des agents, logos plateformes, avatars).
- Sauvegarde avant modif : scratchpad session `index-backup-avant-harmonisation.html`.
- Piège outillage : les captures Playwright MCP sur cette page bloquent (animations infinies deck/ticker + attente de stabilité) ; utiliser **Chrome headless CLI** (`--headless=new --screenshot --window-size=1440,8100`) puis découper avec `sips`. Préexistant, pas lié à la DA.

Lié : [[vividflow-r1-direction-source-of-truth]], [[scraping-refs-da-linea-spec]]
