---
name: project_brvndlab_journal_validated
description: "Journal Brvndlab validé (design scellé) - dernier module client du MVP"
metadata:
  node_type: memory
  type: project
  originSessionId: 03adbfc3-e0b4-4f12-87ce-d3de3ed326f9
---

Module **Journal** validé et scellé (moodboard `screens/journal-desktop.html`). C'est le dernier module client quotidien du MVP à designer.

Design retenu (variante A) :
- **Couleur par type** via icône + pastille légère + label : Win vert, Leçon bleu, Inspiration ambre, Idée violet. Tons mûrs/désaturés en sombre, plus vifs en clair (mélangés sur du **blanc**, jamais sur le beige, sinon ça devient boueux).
- **Chips "Type"** = même grammaire que les pills "Filtrer" : fond carte + contour fin, neutres ; **seule la chip sélectionnée** prend la teinte de sa couleur. (Chips beiges sur carte blanche = rejeté.)
- **Icône Idée = éclair** (l'étoile/sparkle était mal centrée, rejetée deux fois).
- Bouton "Ajouter une note" = neutre crème(sombre)/noir(clair), pas de doré.
- Capture en haut (placeholder réel + voix + Cmd+Enter), filtres, liste récent d'abord + suppression au survol.

Fidèle au vrai code (4 types win/lesson/inspiration/idea, voix `fr-FR`, contexte injecté au brainstorm). Voir [[feedback_mockup_visual_only_respect_backend]], [[feedback_moodboard_sync_rule]].

**Prochaine étape MVP** (Carte MVP) : Réglages complets (apparence/thème, mot de passe, bibliothèque de liens, offres) + Intégrations (hub + détails + modales OAuth).
