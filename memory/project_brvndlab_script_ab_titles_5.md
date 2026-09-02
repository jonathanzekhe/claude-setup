---
name: project_brvndlab_script_ab_titles_5
description: "Scripts Brvndlab — 5 titres A/B (plus 3), tous forts, règle produit scellée"
metadata: 
  node_type: memory
  type: project
  originSessionId: 1e887e56-6927-4730-9751-962961b5df89
  modified: 2026-07-29T06:51:21.190Z
---

Feature titres A/B des scripts (éditeur `/brainstorming/script`) : **5 titres A/B testables pour le hook**, plus 3 (changé le 29/07/2026, déployé prod app.brvndlab.com, commit `ddb86dde`).

Règle : les 5 suivent la même règle, 5 angles d'attaque DISTINCTS (tension/problème, promesse/résultat, curiosité/contre-pied, l'erreur qu'on croit pas faire, l'enjeu caché/ce que ça coûte). **Tous FORTS, aucun titre de remplissage pour faire le nombre.** Consigne écrite dans les deux prompts IA.

3 fichiers : `api/generate-script/route.ts` (génère titleVariants avec le script), `api/generate-titles/route.ts` (backfill anciens scripts, maxTokens 500), `(app)/brainstorming/script/page.tsx` (UI + backfill client, logique déjà agnostique au nombre via Set/`> 1`).

Limite connue : le backfill ne se déclenche que si le script n'a PAS de variantes. Les scripts déjà backfillés à 3 gardent 3 tant qu'aucune migration n'est lancée.

Lié : [[project_brvndlab_script_video_flow]] [[feedback_brvndlab_work_directly_on_prod]] [[project_brvndlab_generation_base_neutre_solide]]
