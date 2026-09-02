---
name: feedback_brvndlab_preview_first_mode_loupe
description: "Brvndlab gros chantiers = déployer en PREVIEW d'abord (mode loupe), jamais un palier isolé direct en prod. Promouvoir en prod seulement après validation visuelle de Jonathan."
metadata: 
  node_type: memory
  type: feedback
  originSessionId: bb724bd8-efb2-432a-86b3-2c6f054670da
---

Pour les **chantiers structurels Brvndlab** (refonte de flow, nouveaux écrans, migration assistant-first), déployer en **PREVIEW d'abord** (le « mode loupe » de Thomas pour ne pas faire d'erreur), donner le lien preview, et **promouvoir en prod seulement après validation** de Jonathan.

**Why:** le 2026-06-23 j'ai poussé le palier 1 (Home immersive) seul en prod alors que le flow downstream (story, récap) était encore l'ancien → prod incohérente (entrée neuve, vieux écrans). Jonathan : « la prod est mauvaise, regarde ce que tu as pushé ». J'ai dû rollback (git revert + redeploy). Un palier isolé en prod casse la cohérence du parcours.

**How to apply:**
- Preview front : depuis `brvndlab-app/`, `vercel deploy --yes` (SANS `--prod`) → URL preview. Donner le lien cliquable.
- Prod seulement après "ok valide" : `./deploy-brvndlab.sh vercel` (ou promote la preview).
- Finir le flow COMPLET (mockup validé en entier) avant de toucher la prod, pas palier par palier en prod.
- Nuance : un petit fix isolé non-cassant peut encore aller direct (cf. [[feedback_brvndlab_work_directly_on_prod]]), mais une refonte de parcours = preview-first.
- Voir [[project_brvndlab_assistant_first_direction]], [[feedback_verify_deploy_lineage_before_prod]].
