---
name: feedback_moodboard_sync_rule
description: Règle systématique - chaque maquette validée va dans le moodboard ET dans la Carte MVP
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 03adbfc3-e0b4-4f12-87ce-d3de3ed326f9
---

Règle permanente : dès qu'une maquette est validée/poussée, deux actions obligatoires à chaque fois, sans redemander :
1. L'intégrer dans le moodboard officiel (screens/ + onglet Maquettes) et redeploy prod.
2. Mettre à jour la **Carte MVP** (statut de l'écran : validé / en code / à concevoir + état mobile).

**Why:** Jonathan veut une source unique toujours à jour, "ne plus jamais être perdu". Le moodboard et la Carte MVP doivent refléter l'état réel en continu.

**How to apply:** Après validation d'un écran, patcher GROUPS (moodboard) + INV (Carte MVP) dans le même index.html, vérifier em-dash=0 + JS OK, `vercel --prod --yes`, confirmer HTTP 200. Voir [[feedback_brvndlab_one_vercel_moodboard]] et [[feedback_validated_is_done]].

**Zéro brouillon dans le moodboard :** une fois un choix validé, supprimer les pages de propositions A/B/C (retirer du GROUPS + rm le fichier). Le moodboard ne contient QUE des mockups retenus/définitifs, jamais de variantes ni de brouillons. Les propositions sont éphémères, le temps du choix.
