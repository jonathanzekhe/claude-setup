---
name: Mots-béquilles interdits dans tout contenu IA Brvndlab
description: Scellé 2026-04-24. "Truc", "chose", "machin", "bidule" interdits dans tous les outputs IA. Raccourcis paresseux qui signalent un manque de précision.
type: feedback
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
**"Truc", "chose", "machin", "bidule" sont interdits dans tout contenu généré par l'IA de Brvndlab (scripts, posts, brainstorms, chat, carrousels, QA, stories).**

**Why :** 2026-04-24, Jonathan a repéré qu'un script utilisait "truc" 6 fois (*Premier truc / Deuxième truc / Troisième truc / fait partie du truc / des trucs qu'ils aiment / des trucs qu'ils détestent / tes vieux trucs sur eBay*). Son diagnostic : "On dirait qu'il trouve des raccourcis pour dire des choses pertinentes au lieu d'aller jusqu'au bout. C'est trop facile. C'est pas des formes de communication, on ne communique pas comme ça même les IA."

Les mots-béquilles signalent que l'IA renonce à trouver le mot juste. C'est un tic de paresse qui tire n'importe quel script vers le bas, même quand le contenu est bon.

**How to apply :**

Dans TOUS les prompts IA qui génèrent du texte (generate-script, brainstorm, brainstorm-explore, generate-carousel, generate-qa, generate-story, chat de révision) :

**Interdits absolus (zéro tolérance) :**
- "truc" sous TOUTES ses formes : comme nom ("un truc"), comme séparateur structurel ("Premier truc"), comme conjonction orale ("le truc c'est que"). Aucune exception.
- "chose" en tant que filler. Acceptable UNIQUEMENT dans les expressions figées irremplaçables ("peu de chose", "quelque chose ne va pas" en situation dramatique précise).
- "machin"
- "bidule"
- "un je-ne-sais-quoi"

**Remplacements pour "le truc c'est que" (conjonction orale) :**
- "En vrai"
- "Le point c'est que"
- "Concrètement"
- "Du coup"
- "Bref"
- "À vrai dire"
- "La vraie question c'est"

**Structure listicle interdite** :
- "Premier truc / Deuxième truc / Troisième truc" ❌
- "La première chose / La deuxième chose / La troisième chose" ❌

**Remplacements disponibles selon le contexte** :
- "truc" → geste, signal, règle, moment, détail, mécanisme, levier, indice, objet, preuve, pattern, marque, pièce, post, habitude, principe
- "chose" → préciser systématiquement (idée, fait, exemple, comportement, réflexe, erreur, astuce, etc.)
- Structure listicle : "Premier signal. Deuxième preuve. Troisième leçon." ou mieux, transition narrative qui NOMME ce qui suit.

**Exemples bad → good :**

❌ "Premier truc. Harley-Davidson, c'est pas la meilleure moto du monde."
✅ "Premier signal. Harley-Davidson, c'est pas la meilleure moto du monde."

❌ "Des trucs qu'ils aiment, des trucs qu'ils détestent."
✅ "Les marques qu'ils vénèrent, celles qu'ils crachent dessus."

❌ "Ce mépris fait partie du truc."
✅ "Ce mépris fait partie du code. / Ce mépris fait partie de la marque. / Ce mépris fait partie du contrat."

❌ "Est-ce que quelqu'un revendrait tes vieux trucs 10 fois le prix sur eBay ?"
✅ "Est-ce que quelqu'un revendrait tes vieux posts 10 fois le prix sur eBay ?"

**Exception sémantique** :
Si "chose" apparaît dans une expression figée irremplaçable ("peu de chose", "quelque chose ne va pas" en situation dramatique), acceptable. Mais le test par défaut = remplacer.

**Lien avec :**
- `feedback_communication_chirurgicale_humaine.md` : la chirurgie commence par la précision lexicale
- `feedback_respect_ma_propre_proposition.md` : ne pas trouver de raccourcis, aller jusqu'au bout
