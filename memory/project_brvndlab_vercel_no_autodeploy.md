---
name: Brvndlab Vercel — auto-deploy Git RÉACTIVÉ (deploy via rail)
description: brvndlab-app auto-déploie désormais sur push main (constaté 2026-07-09). Le déploiement passe par ./deploy-brvndlab.sh qui pull/push ; le front build tout seul sur push. Ne plus lancer vercel --prod à la main depuis le sous-dossier.
type: project
originSessionId: 5f2c71e5-ba49-447e-b6aa-af7048d1c61a
---
**MISE À JOUR 2026-07-09** : l'auto-deploy Git EST maintenant actif sur `brvndlab-app`. Un `git push origin main` (commit `81a0f49`) a déclenché seul un nouveau déploiement prod `Ready` en ~2 min, sans aucun `vercel --prod` manuel. L'ancienne observation (2026-05-27, "pas d'autodeploy") est OBSOLÈTE : l'intégration Git a été reconnectée entre-temps.

**How to apply (état actuel)** :
- Rail officiel de déploiement : `bash ~/dev/brvndlab-claude/deploy-brvndlab.sh [all|convex|vercel]` depuis le PARENT `~/dev/brvndlab-claude` (voir [[feedback_brvndlab_repo_path_and_git_rules]]). Le script fait fetch→pull --rebase→push, puis pour `vercel` il constate juste que le push a lancé le build Git.
- Ne PAS lancer `vercel --prod` depuis `~/dev/brvndlab-claude/brvndlab-app` : le projet a un Root Directory = `brvndlab-app`, donc la CLI cherche `brvndlab-app/brvndlab-app` et échoue ("path does not exist"). Il faudrait `--cwd ~/dev/brvndlab-claude`, mais inutile puisque le push suffit.
- Le shell des outils Bash reset le cwd à chaque commande : `cd repo && vercel` ne persiste pas → toujours passer le path absolu ou le script.
- Vérifier le déploiement : `vercel ls brvndlab-app --prod` (le 1er = le plus récent, doit être `Ready`).

**Convex reste séparé** : `./deploy-brvndlab.sh convex` (ou `all`) déploie le backend Convex prod partagé `accurate-cormorant-297`. Ne jamais faire `convex deploy` direct (voir [[feedback_brvndlab_convex_shared_deploy_rule]]). Un changement purement front (aucune fonction Convex touchée) n'a pas besoin du deploy Convex → `./deploy-brvndlab.sh vercel` suffit.
