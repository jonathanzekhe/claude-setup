---
name: vividflow-5-icones
description: "Toute page servie sur le domaine vividflow.co doit porter les 5 icônes VividFlow (set favicon complet), sans exception"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 953ca4f5-4db3-4bb3-9158-0a87f30f8a96
---

Chaque page HTML servie sur vividflow.co (landing, decks clients, R1, mockups, booking) doit inclure les 5 icônes VividFlow dans le head.

**Why:** Règle posée par Jonathan le 2026-06-12 après le deck CC Concept (onglets sans favicon = 404 console + onglet vide, rendu non premium face à un prospect).

**How to apply:** Bloc à insérer après le meta robots de chaque nouvelle page du projet site-mockups :
```html
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="192x192" href="/android-chrome-192x192.png">
<link rel="icon" type="image/png" sizes="512x512" href="/android-chrome-512x512.png">
<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
```
Les 5 fichiers existent à la racine de site-mockups (générés depuis `vividflow-icon.png`). Les 205 pages existantes sont conformes depuis le 2026-06-12. S'applique aussi aux futurs decks dupliqués depuis [[schmid-template-strict]].
