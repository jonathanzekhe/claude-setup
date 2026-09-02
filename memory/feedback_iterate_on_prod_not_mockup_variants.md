---
name: Itérer directement sur prod après choix d'une variante
description: Quand Jonathan a déjà validé une variante de design, ne plus produire de mockups multi-variantes pour l'ajuster — l'implémenter directement sur le site prod et itérer là
type: feedback
originSessionId: a2c42846-2818-48ec-913c-83d5a5d73568
---
Quand Jonathan a validé une variante (ex: bulle V01 sur la page de variantes), STOP les mockups parallèles pour l'ajuster.

**Why:** 28/05 sur l'intégration du speech bubble Isaiah (card 3 Bras droit), j'ai itéré 3 fois sur `brasdroit-bubble-variants.html` au lieu d'aller directement sur `site-mockups/index.html`. Jonathan : "arrête de me faire des mock-up de plusieurs trucs, on a choisi la bulle, travaille directement sur le site". Sa frustration vient du fait que les variantes parallèles font perdre du temps et augmentent le risque de divergence entre le mockup et la prod.

**How to apply:**
- Si la décision design est déjà prise → patcher directement `index.html` prod + déployer
- Calculer les positions précisément avec les vraies mesures DOM (Playwright `getBoundingClientRect`), pas avec des estimations
- Si plusieurs hypothèses de placement sont possibles, en proposer une seule (la plus fondée) et itérer dessus en live
- Les mockups multi-variantes sont pour la PHASE DE CHOIX initiale uniquement, pas pour le polish
