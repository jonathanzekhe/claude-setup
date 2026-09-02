---
name: Respecter à la lettre ses propres propositions visuelles
description: Scellé 2026-04-24. Quand Jonathan choisit une variante que J'AI proposée, je dois la reproduire pixel par pixel, pas une approximation.
type: feedback
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
**Quand Jonathan choisit une variante issue d'un mockup que j'ai moi-même construit, l'implémentation doit correspondre à la lettre au mockup. Pas "l'esprit", pas "l'idée". Exact.**

**Why :** 2026-04-24 j'ai livré un mockup à 3 variantes d'affichage d'angles. Jonathan a choisi la A (accordéon avec headline + tagline + tag à droite en pill + description qui se déplie). J'ai implémenté en app un truc qui gardait juste la logique d'expand mais ne reprenait NI le sous-titre, NI le tag à droite, NI la pill, NI la structure données {headline, tagline, description}. Jonathan : "C'est pas du tout la même chose. Quand tu me donnes un exemple, je choisis le type A, je vais exactement comme il y avait le type A. J'ai presque l'impression que t'as pas une mémoire argentique."

**How to apply :**

Avant de coder une variante choisie par Jonathan :
1. **Relire le mockup** — ouvrir le fichier HTML/mockup de la variante, noter chaque élément visuel (structure, spacing, couleurs, data requise, interactions).
2. **Mapper chaque élément** — pour chaque élément du mockup, vérifier qu'il existe dans mon implémentation target. Exemples : tag à gauche vs à droite, pill vs carré, headline seul vs headline + tagline, chevron qui rotate, description qui s'affiche où.
3. **Adapter la data si nécessaire** — si le mockup suppose `{headline, tagline, description}` et que le backend renvoie juste `string[]`, mettre à jour le backend AUSSI. Sinon mon frontend sera contraint à ignorer la moitié du mockup.
4. **Comparer visuellement avant de pusher** — ouvrir la page live côté navigateur (ou screenshot du mockup) et vérifier : quelles différences avec le mockup ? Chaque différence non-justifiée = à corriger avant de rendre la main.
5. **Ne jamais dire "c'est prêt" sans que l'écran live matche le mockup**.

**Règle dérivée :**
Si Jonathan doit me demander "pourquoi ce n'est pas comme la variante A", la faute est à 100% sur moi, pas sur lui. Son rôle n'est pas de contrôler la conformité, mais de valider le fond.

**Lien avec d'autres mémoires :**
- `feedback_ne_pas_prendre_initiatives.md` : ne pas rebuild les modules validés
- `feedback_verify_until_live.md` : vérifier de bout en bout jusqu'à app.brvndlab.com
- Celle-ci complète les deux : non seulement ne pas dévier, mais aussi ne pas sous-livrer sa propre proposition.
