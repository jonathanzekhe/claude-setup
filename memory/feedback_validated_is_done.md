---
name: Mockups validés = considérés comme faits, ne pas les lister
description: Jonathan considère tout mockup validé comme "fait" — ne pas l'inclure dans les listes de TODO, gérer l'implémentation en silence
type: feedback
---

Quand Jonathan demande "ce qui reste à faire", il veut voir UNIQUEMENT ce qui n'a pas encore été designé/validé. Tout ce qui a été vu et validé ensemble (même si c'est juste un mockup HTML statique) compte comme **fait** de son point de vue, et ne doit pas apparaître dans une TODO list.

**Why:** Charge mentale. Lui montrer des dizaines de tickets pour "convertir le mockup X en React + créer le schéma Convex Y + brancher l'API Z" alors qu'il a déjà validé le design = surcharge inutile. C'est mon job de gérer la conversion mockup → code en amont, pas le sien de la suivre.

**How to apply:**
- Liste de "ce qui reste" = uniquement les choses **jamais vues** ou les **décisions stratégiques** qui requièrent son input
- Ne PAS lister : conversion mockup → React, migration de schémas, refacto Convex, câblage d'API, génération de prompts IA — c'est mon travail d'implémentation, à gérer silencieusement
- Quand on parle "phases" ou "backlog", regrouper l'implémentation des mockups validés sous une seule ligne "Implémentation des mockups validés" sans la décomposer
- Privilégier les listes courtes et focalisées plutôt que les listes exhaustives qui mélangent design et tech
