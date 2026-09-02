---
name: Pas d'override CSS global pour le dark mode
description: Ne jamais ajouter une couche `[data-theme="dark"] .bg-X { ... }` globale dans globals.css pour patcher le dark mode en bulk. Migration page par page uniquement, avec validation visuelle.
type: feedback
originSessionId: f1f3c685-a9e8-4d3e-a97b-a934c6629003
---
Règle absolue 2026-05-09 après tentative ratée d'override layer dark mode dans globals.css.

**À ne jamais faire** :
- Ajouter dans globals.css un bloc `[data-theme="dark"] .bg-{color}-50 { background-color: ... }` qui patche en cascade tous les bg/text/shadow Tailwind
- Migrer un INTENT_CONFIG de hex inline vers CSS vars sans tester chaque consommateur
- Toucher 12 page titles d'un coup sans relancer visuellement chaque page
- Considérer qu'un override CSS donne "80% du résultat" : ça ne marche pas, le rendu visuel est dégueulasse en pratique

**Why** : Une seule passe d'override globale a cassé l'esthétique générale (le rendu réel ne correspondait pas au modèle mental). Le dark mode est un chantier qui ne tolère pas les raccourcis. Chaque section doit être migrée et VUE en dark.

**How to apply** :
- Migration dark mode = obligatoirement page par page, avec capture d'écran ou Playwright pour valider chaque écran avant de passer au suivant
- Toute modification typographique d'un h1/h2 = revoir le rendu de la page concernée AVANT de passer à la suivante
- Pour des refactors de plus de 3 fichiers en parallèle, splitter en plusieurs passes courtes avec validation visuelle entre chaque
- "Less is more" prime sur toute envie d'industrialiser un fix UX

**Incident référence** : déploiement `dpl_HgDche5XyYLG6fDK7czBE1Sm5sMT` (2026-05-09 10:30) reverté, retour sur `dpl_BjX2kwBKqdQfRZyzDrtW8xC2fzpM` (radius standardization). Causes : (1) override CSS layer trop ambitieux, (2) zéro validation visuelle pendant l'exécution, (3) migration de configs inline-style sans relancer la page.
