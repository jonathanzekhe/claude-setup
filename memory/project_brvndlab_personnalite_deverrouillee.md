---
name: project_brvndlab_personnalite_deverrouillee
description: "Brand OS — Personnalité (1er module) déverrouillée : accès ouvert à tous, plus de gating"
metadata: 
  node_type: memory
  type: project
  originSessionId: 85669be3-5f8f-465a-b4ca-9c318860b9c4
  modified: 2026-07-28T08:52:28.013Z
---

Bug (28/07/2026, client réel bloqué) : la page Personnalité affichait « Personnalité verrouillée / Termine d'abord les autres sections » et refusait l'accès. Cause : un gating frontend obsolète (`isLocked = gatingReady && !allModulesDone && !isCoach`) hérité de l'ANCIEN ordre, quand Personnalité était la SYNTHÈSE FINALE du Brand OS. Depuis, elle est le PREMIER module (la base autonome, cf [[project_brvndlab_module_order_rank_lock]]) → le verrou bloquait à tort les clients qui commencent par elle.

**Fix :** suppression totale du gating dans src/app/(app)/brand-os/personnalite/page.tsx (isLocked, allModulesDone, otherSlugs, queries moduleDefs/modulesWithResponses, isCoach, import Lock, bloc verrou « plocked »). Rend directement le contenu. Personnalité ouverte à tous.

**Vérifié (le blocage était 100% FRONT) :** le backend n'a AUCUN gate par module — `saveResponse`/`getResponses` (convex/brandOs.ts) passent par `requireWriteAccess` seul (ne regarde pas le moduleSlug). Le parcours guidé (journey.ts/journeyGraph.ts) ouvre toute la section `brand-os` au STEP 0 (le tout premier), jamais Personnalité individuellement. `assertModuleAllowed` = data-gate d'ABONNEMENT (ce que le compte a acheté), pas le verrou progressif. Donc rien à changer côté serveur.

**INCIDENT GIT (leçon) :** le 1er push a atterri sur une branche de travail (`fix/recap-flow-clarity`) au lieu de main → `Everything up-to-date` + Vercel a build main SANS le fix → client encore bloqué. Rattrapé : checkout main, cherry-pick du commit, push (59fe2b86..29f77488), redéploiement. TOUJOURS vérifier `git branch --show-current` = main avant de push/déployer, et lire les messages git (une mauvaise branche + « up-to-date » = le fix n'est pas parti). Voir [[feedback_brvndlab_repo_path_and_git_rules]], [[feedback_never_overwrite_thomas_work]].
