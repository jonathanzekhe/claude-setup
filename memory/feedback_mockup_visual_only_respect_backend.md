---
name: feedback_mockup_visual_only_respect_backend
description: "Dans les maquettes, ne changer QUE le visuel - jamais le sens/logique de la section, le backend fait foi"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 03adbfc3-e0b4-4f12-87ce-d3de3ed326f9
---

Quand je refais une maquette d'un écran existant, je m'occupe UNIQUEMENT de la partie visuelle. Je ne dois jamais retirer une vraie feature, en inventer une, ni changer le sens/la logique de la section. Le backend réel fait foi et doit être lu et pris en compte AVANT de toucher quoi que ce soit.

**Why:** Jonathan a été ferme : en réduisant la "surcharge" du carousel j'ai supprimé de vrais boutons (+/− slides, Développer/Condenser...) et inventé un flux "Ajouter une preuve", ce qui abîmait la section. Réduire le bruit visuel ≠ supprimer des fonctions.

**How to apply:**
- Lire le vrai code (`~/dev/brvndlab-claude/brvndlab-app`) avant de maquetter, lister TOUS les éléments réels à conserver.
- Pour alléger sans rien retirer : jouer sur le visuel (révéler les actions au survol, espacement, hiérarchie, monochrome), pas sur les features.
- Si le code et l'attente du fondateur divergent (ex : la preuve devrait venir du brainstorming mais `proofImageIds` est du code mort, seul "Ajouter une image" de l'éditeur marche), le SIGNALER et le laisser décider. Ne pas trancher une logique backend dans une maquette.
- Un tribunal d'audit peut recommander de couper des éléments : ne pas appliquer aveuglément si ça retire du vrai backend. Voir [[feedback_brvndlab_brandos_no_invent_real_backend]], [[feedback_never_modify_existing]], [[feedback_never_invent_features]].
