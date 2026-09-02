---
name: project_brvndlab_titres_ab_10
description: "Scripts : 10 titres A/B (plus 5), tous forts, garde-fous anti-remplissage dans generate-script + generate-titles"
metadata: 
  node_type: memory
  type: project
  originSessionId: ae04f13a-bd9c-4480-afc1-e11e3b5436e9
  modified: 2026-07-30T16:09:25.298Z
---

Règle Jonathan (30/07/2026) : chaque script propose **10 titres A/B** (avant 3, puis 5). Exigence : les 10 doivent être aussi bons les uns que les autres, zéro titre de remplissage pour faire le nombre.

Garde-fous mis en place (commit 33b9b17e, déployé prod) :
- **Taxonomie de 10 familles d'angles** imposée dans les prompts (un titre par famille) : tension/problème, promesse/résultat, curiosité/contre-pied, erreur, coût réel, preuve/chiffre du script, croyance à casser, question au spectateur, avant/après, mécanisme.
- **Ancrage contenu réel** : titres tirés des exemples/chiffres du script, pas de généralités.
- **Auto-audit** : le modèle relit les 10, réécrit le plus faible, en boucle.
- **Dédup quasi-doublon** (minuscules, sans accents/ponctuation) côté serveur dans les 2 routes ; fini le padding par copies du titre principal (mieux vaut 8 distincts que 10 avec doublons).
- **Backfill éditeur** : à l'ouverture d'un script avec < 10 variantes, /api/generate-titles complète en préservant l'existant (même mécanisme que le 3→5). maxTokens 500→900 sur cette route.
- Fichiers : src/app/api/generate-script/route.ts, src/app/api/generate-titles/route.ts, src/app/(app)/brainstorming/script/page.tsx (guard >= 10, libellés « 10 titres »).

Lié : [[project_brvndlab_hook_rules_hardened]] (varier l'angle d'attaque), [[project_brvndlab_brouillon_vs_pipeline]].
