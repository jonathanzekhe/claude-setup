---
name: project_vividflow_deck_r1_page1
description: "Deck R1 VividFlow — trame macro 12 pages (Répondre/Exécuter/Coordonner), live sur vividflow.co/r1-page1..12"
metadata: 
  node_type: memory
  type: project
  originSessionId: 46b45fe9-c3aa-4433-a626-5c03987fd5d4
---

Deck R1 VividFlow = présentation d'éducation/cadrage pour un patron, avant le R2/audit. Refonte 08/06 en **trame macro 12 pages** qui part du **fonctionnement réel de l'entreprise**, pas de l'IA. L'IA n'entre qu'à la P7.

Grande idée : une entreprise avance quand 3 choses tiennent ensemble — **Répondre · Exécuter · Coordonner**. Message stratégique : pas « un outil IA de plus », mais **relier le travail qui existe déjà**.

Trame (1 idée forte/page) : 1 Ouverture (triade) · 2 Répondre · 3 Exécuter · 4 Coordonner · 5 Les outils existent déjà (relier, pas ajouter) · 6 Le plafond (capacité d'absorption) · 7 L'IA au 1er niveau (logos minuscules note de contexte) · 8 La bascule (triade : Répondre grisé, Exécuter/Coordonner orange) · 9 La couche qui relie · 10 La mémoire d'entreprise · 11 Le corps vivant · 12 Audit + CTA « Continuer l'audit ».

Implémentation (`VividFlow/site-mockups/`, servies via rewrites vercel.json) :
- **r1-page1.html … r1-page12.html** → vividflow.co/r1-page1 … /r1-page12.
- **deck-r1.css** = système partagé : tokens (crème #FAF9F6, ink #16130F, gris mature, orange profond #BF4F28, Spectral serif + sans light) + 4 patterns réutilisables `.title` / `.word` / `.triad` / `.chips` + `.cta` + motion lente. Polish centralisé ici.
- **deck-r1.js** = nav : jauge de points (tableau `PAGES` = 12 URLs) + flèche suivant (bas-droite) + flèche retour (bas-gauche, dès page 2) + clavier ←/→. Chaque page pose `window.DECK_INDEX` + `<script src="/deck-r1.js">`.

État = **v1 structure/narration/rythme**, pas la DA finale. Prochaine étape : polish page par page. CTA P12 href="#audit" à brancher (booking R2). Anciennes explorations Page 1 conservées : r1-page1-final/-scene/-mirror/-premium/-bold/-polish/-opener/-sobre/-variants/-wow/-typo. QA via Chrome headless `--screenshot` (le MCP playwright timeoutait). Voir [[project_vividflow_client_projection_url]].
