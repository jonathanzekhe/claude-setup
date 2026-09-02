---
name: Brainstorm, toujours partir de l'existant
description: Méthode de brainstorming validée 2026-04-22. Ne jamais brainstormer une page from scratch, toujours partir des mockups ou pages déjà créées et validées.
type: feedback
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
Quand on brainstorme une page / module de Brvndlab, on NE PART JAMAIS d'une feuille blanche. On part TOUJOURS de ce qui existe déjà (mockup validé dans /tmp/, page live dans brvndlab-app/src/app/, ou même ancienne version dans l'historique).

**Why:** Jonathan a vécu plusieurs fois le cas où j'ai "brainstormé" une page de zéro, il a rejeté ma proposition, et on a fini par revenir à ce qu'on avait avant. Donc brainstormer from scratch = perdre du temps et ignorer le travail déjà validé. Si une section existe, c'est qu'on avait déjà brainstormé et aligné dessus.

**How to apply:**
Pour chaque nouvelle page / module à brainstormer :

1. **Inventaire d'abord** : chercher ce qui existe déjà
   - Mockups dans /tmp/brvndlab-*.html
   - Pages live dans ~/Documents/Claude AI/brvndlab-app/src/app/
   - Références en mémoire (project_brvndlab_*.md)
   - Anciens prototypes ou échanges

2. **Montrer l'existant** à Jonathan avant toute question conceptuelle

3. **Poser les 3 vraies questions** :
   - Qu'est-ce qui marche dans ce qu'on a ?
   - Qu'est-ce qui ne marche pas / qui manque ?
   - Où on veut aller (évolution, pas révolution) ?

4. **Partir des gaps**, pas de la feuille blanche. Les questions hypothétiques type "quand tu ouvres la page tu viens chercher quoi" sont à ÉVITER si on a déjà une page qui répond implicitement.

5. **Évolution > Révolution** : par défaut on améliore l'existant. On ne reconstruit from scratch que si Jonathan explicitement demande un redesign complet.

Cette méthode respecte aussi les règles :
- "Never modify existing code" sans demande explicite
- "Validated = done" (mockups validés ne sont pas à redébattre)
- "Pas de back and forth" (on avance vite en s'appuyant sur le réel)
