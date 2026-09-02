---
name: feedback_no_visible_scrollbar
description: Aucune scrollbar visible nulle part dans le SaaS - masquer tout en gardant le scroll
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 03adbfc3-e0b4-4f12-87ce-d3de3ed326f9
---

Aucune barre de défilement visible nulle part dans le produit Brvndlab. Le scroll reste fonctionnel mais la scrollbar est masquée.

**Why:** Jonathan trouve la scrollbar (ex: colonne Publié du Pipeline dépliée) moche et non premium. Cohérent avec [[feedback_less_is_more_premium]].

**How to apply:** Dans chaque écran/mockup, ajouter `*{scrollbar-width:none;-ms-overflow-style:none}*::-webkit-scrollbar{display:none}`. À mettre par défaut dans tout nouveau screen.
