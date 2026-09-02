---
name: project_brvndlab_audience_seconde_ligne
description: "Brand OS Audience — seconde ligne (segments secondaires), contexte pas cible activable"
metadata: 
  node_type: memory
  type: project
  originSessionId: 85669be3-5f8f-465a-b4ca-9c318860b9c4
  modified: 2026-07-26T08:20:48.556Z
---

Brand OS module Audience, sealed 26/07/2026. Ajout d'une **seconde ligne d'audience** : une audience principale (coeur de cible) + jusqu'à **4 segments secondaires** qui vivent le même problème sous un autre visage (ex : principale « entrepreneurs », segments « dirigeants de PME », « directeurs d'agence », « infopreneurs »).

**But (décision Jonathan)** : que le back-end comprenne le contexte en profondeur SANS l'enfermer dans une seule case quand il génère scripts/brainstorm. C'est du CONTEXTE, PAS une cible activable — aucun bouton de switch, aucun mini-Brand-OS par segment. Les segments enrichissent problèmes/personas/scripts.

**Se remplit surtout par le brainstorm avec Lya** (le manuel reste possible mais secondaire ; Jonathan : « c'est toujours mieux via brainstorm »). Champ manuel = libre (pas de bouton IA sur le champ).

Implémentation (questionId `audience-segments`, stocké `||`-joined) :
- `_interview.ts` : purpose mis à jour (principale + constellation, capter-pas-forcer) ; nouveau bloc `audience-segments` avec `optional: true`.
- `interview/route.ts` : flag `optional` sur BlockSpec ; `isServed()` retourne true pour un bloc optional → ne bloque JAMAIS la clôture du module, jamais choisi comme focus (Lya ne force pas). Si l'user dit « c'est eux, point », bloc reste vide.
- `_bos.tsx` TagField : prop `max` (input désactivé à 4).
- `audience/page.tsx` : section « Aussi concernés » (TagField max=4) ; `audience-segments` ajouté à OPTION_BLOCKS (stockage `||`).
- `convex/brandDna.ts` : segments repliés DANS `brandDna.audience` (« Aussi concernés : ... ») → tous les générateurs les reçoivent sans changer leur signature.
- Signature audience (problèmes + personas) inclut `segments` → ajouter/changer un segment régénère, cohérent avec [[project_brvndlab_audience_sync_regen]].
