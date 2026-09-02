---
name: ""
metadata: 
  node_type: memory
  originSessionId: 445fdd04-7aec-441e-9250-c18303792262
---

Quand Jonathan dit "condense le texte" / "il va trop loin" / "sur X lignes", il veut agir sur la **mise en forme** (largeur du bloc, `max-width` en ch, `text-wrap:balance`, taille), PAS supprimer du contenu.

**Why :** sur /offres étape 1 (2026-07-13), j'ai supprimé la 1re phrase de la lede pour raccourcir. Jonathan : "j'ai vu tu as supprimé une partie du texte. ne fais plus jamais cela." Puis "condense le texte sur 3 lignes" = il voulait le texte INTÉGRAL tenant sur 3 lignes, pas amputé.

**How to apply :**
- "Condenser sur N lignes" = ajuster `max-width` (en ch) + `text-wrap:balance` pour que le texte COMPLET occupe N lignes équilibrées. Jamais couper de mots.
- Ne JAMAIS retirer une phrase, un mot, une puce, un élément sans demander explicitement d'abord. Vaut pour copy ET structure.
- Si je pense qu'une phrase est en trop, je le PROPOSE et j'attends le go, je ne tranche pas seul.

Renforce [[feedback_never_modify_existing]], [[feedback_scope_strict_only_what_asked]], [[feedback_jamais_condenser_pour_le_visuel]] (valeur du sens avant esthétique : adapter le layout, pas le texte). Lié à [[project_vividflow_offres_etape1_sealed]].