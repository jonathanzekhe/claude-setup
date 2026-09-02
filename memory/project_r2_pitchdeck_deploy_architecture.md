---
name: project_r2_pitchdeck_deploy_architecture
description: "Comment les decks R2 prospects sont servis : projet Vercel vividflow-pitchdeck-r2, rewrites /p/:slug par sous-domaine, aliases par prospect"
metadata: 
  node_type: memory
  type: project
  originSessionId: 67140454-59d4-4218-a6b4-3aeaf57ba10f
  modified: 2026-08-10T10:49:57.190Z
---

Les decks R2 prospects (`<slug>.vividflow.co`) sont servis par le projet Vercel **vividflow-pitchdeck-r2** (scope jonathanzekhe-4288s-projects). Un seul déploiement sert plusieurs prospects : `vercel.json` réécrit `/` → `/p/:slug` selon le host (`(?<slug>[^.]+).vividflow.co`). Aliases connus au 10/08/2026 : jpf.vividflow.co, template-r2.vividflow.co, schmid-signature.vividflow.co, jorge-santos.vividflow.co (+ vividflow-presentation.vercel.app).

Le dossier source de ce projet hub n'existe PAS sur le Mac (déployé depuis ailleurs). Le 10/08/2026, le deck Jorge corrigé a été déployé en projet séparé `jorge-santos-r2` (dossier local `VividFlow/bouquet-supreme-r2/jorge-santos-r2/`, source = rendu live corrigé) et le domaine `jorge-santos.vividflow.co` ré-aliasé vers ce projet.

**RISQUE** : si quelqu'un redéploie vividflow-pitchdeck-r2 et repasse ses aliases, jorge-santos.vividflow.co peut repointer vers la copie PÉRIMÉE (contaminée immobilier) restée dans le hub sous /p/jorge-santos. Si on retrouve le repo du hub : y reporter les corrections ou supprimer /p/jorge-santos. Voir [[project_r2_template_system]] [[feedback_r2_transcript_complet_et_anticontamination]].
