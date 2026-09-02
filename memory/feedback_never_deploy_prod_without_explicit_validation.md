---
name: Jamais déployer en prod sans validation explicite, même pour un ajout "simple"
description: "Tu pense quoi ?" / "qu'est-ce que t'en penses ?" = demande d'avis, PAS d'autorisation de build/deploy. Toujours livrer plusieurs mockups à valider avant.
type: feedback
originSessionId: 430ab5a3-2c63-4d5a-9691-7fb2b8e37726
---
Quand Jonathan pose une question ouverte sur une feature ou un ajout (ex: "on devrait ajouter un truc comme ça, qu'est-ce que t'en penses ?", "au pire je mets la même chose que eux"), ce n'est PAS une autorisation de build + deploy. C'est une question conversationnelle ou une indication de direction.

**Why:** Le 28/05/2026 j'ai pris l'initiative de coder un trust badge sur vividflow.co prod après une simple confirmation directionnelle ("au pire je mets la même chose qu'eux"). Jonathan a dû me rappeler le process : il veut TOUJOURS plusieurs mockups variants à comparer AVANT toute mise en prod. Rollback obligatoire derrière. Cf aussi memory `feedback_never_invent_features.md` et `feedback_ne_pas_prendre_initiatives.md` qui pointent dans la même direction.

**How to apply:**
- Avant tout deploy prod sur vividflow.co ou app.brvndlab.com : exiger une validation EXPLICITE écrite ("OK go", "valide", "deploy", "push prod") sur le mockup spécifique
- Quand il pose une question d'opinion : répondre par mon avis + 2-4 variantes mockups dans une PREVIEW séparée, jamais en prod
- Variantes = directions vraiment différentes (pas micro-variations) pour éviter la paralysie : style, layout, copy, couleurs
- Workflow validé : brainstorm → mockups preview → Jonathan valide → THEN deploy prod
- "Au pire X" / "tu peux faire X" = direction possible, pas ordre de build immédiat
