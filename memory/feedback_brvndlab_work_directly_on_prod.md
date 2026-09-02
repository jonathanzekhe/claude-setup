---
name: feedback_brvndlab_work_directly_on_prod
description: "Phase pré-lancement Brvndlab — quand Jonathan demande une suppression/modif, l'appliquer ET déployer en prod directement, sans cérémonie PR ni mockup d'abord."
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 26a6f39e-8a8d-4598-9f9f-c40e275656ec
---

Brvndlab n'est pas encore lancé : personne ne voit le site. Donc quand Jonathan dit « supprime X » ou « fais Y », on applique le changement et on **déploie directement en prod** dans la foulée. Pas de mockup parallèle, pas d'attente de validation pour des suppressions/finitions qu'il a explicitement demandées.

**Why** : tant que ce n'est pas lancé, itérer sur la prod = boucle de feedback la plus courte. Le risque utilisateur est nul. Ça assouplit (pour cette phase) [[feedback_never_deploy_prod_without_explicit_validation]] : son instruction directe EST la validation.

**How to apply** : 1) faire le changement, 2) le poser sur la **lignée que la prod sert réellement** (cf. [[feedback_verify_deploy_lineage_before_prod]] — sinon on régresse dark mode/pipeline), 3) `vercel deploy --prod --yes --scope team_GTs1MknPmT57qmmhxdVCv0sl` depuis `~/dev/brvndlab-claude/brvndlab-app`, 4) confirmer l'alias app.brvndlab.com + ouvrir dans Chrome. Le repo Vercel ne déploie PAS sur push, le `vercel --prod` manuel reste obligatoire ([[project_brvndlab_vercel_no_autodeploy]]).
