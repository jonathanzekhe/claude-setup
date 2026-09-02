---
name: feedback-versions-meme-titre-numerotation
description: "Quand Jonathan garde plusieurs versions d'un contenu sans changer le titre, suffixer \"(version 1)\", \"(version 2)\", \"(version 3)\"... dans l'ordre chronologique"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: c99c1a5f-8ac2-4c26-aa2c-c338404e736f
  modified: 2026-08-17T22:21:55.845Z
---

Quand Jonathan veut conserver plusieurs versions d'un même contenu (script, carrousel, etc.) SANS changer le titre, la convention est : titre identique + suffixe "(version 1)", "(version 2)", "(version 3)"..., numérotées dans l'ordre chronologique (version 1 = la plus ancienne). Appliquer ce suffixe au titre de l'item ET au titre dans le JSON de description (sinon l'éditeur réaffiche l'autre titre).

**Why:** Le 18/08, la récupération de sa version écrasée de "Un bon client n'est pas convaincu en appel" a été créée en second brouillon "(version 1)" ; il a validé ce format et demandé qu'il devienne la règle permanente.

**How to apply:** À chaque récupération, duplication ou conservation multi-versions d'un contenu Brvndlab (via [[project-brvndlab-audit-chaine-scripts-2026-08-17]] : mutations contentItems:adminDuplicateAsDraft / adminInsertVersion), ne jamais inventer un autre libellé ("ancienne version", "copie", "backup") : toujours "(version N)". Rappel : deux brouillons sur un même angle restent une exception au design anti-doublon, à signaler à chaque fois.
