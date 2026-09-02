---
name: feedback_push_live_deploy_full
description: "« push live » / « live » = push GitHub ET déployer Convex + Vercel, jamais juste push"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: a37a3368-7eda-407d-8bf9-980db1db3c7c
  modified: 2026-07-29T12:43:53.611Z
---

Quand Jonathan dit « push live », « live », « pousse-le », « mets-le en ligne » sur Brvndlab : ça veut dire **push GitHub ET déployer** (Convex si backend touché + Vercel), sans redemander. « Push GitHub » seul ne suffit JAMAIS : le code sur GitHub ne s'active pas dans l'app tant qu'il n'est pas déployé.

**Why:** Jonathan a été frustré parce que j'ai dit « oui poussé » après un simple push GitHub, alors que rien n'était visible en live (l'app tournait sur l'ancien déploiement). Pour lui « push » = le changement doit être VISIBLE dans l'app. Il en a marre de répéter « déploie aussi ».

**How to apply:** à « push live » → 1) commit + push GitHub, 2) `npx convex deploy` avec CLI 1.42.1 si convex/ touché (voir [[feedback_convex_cli_1341_lies_use_1421.md]], prod partagé [[feedback_brvndlab_convex_shared_deploy_rule.md]]), 3) déployer Vercel (voir [[feedback_always_push_to_vercel.md]], [[project_brvndlab_vercel_no_autodeploy.md]]), 4) vérifier jusqu'au live ([[feedback_verify_until_live.md]]). Toujours respecter la règle Thomas ([[feedback_never_overwrite_thomas_work.md]]) et preview-first pour gros chantiers ([[feedback_brvndlab_preview_first_mode_loupe.md]]). NE PAS dire « fait » avant que ce soit réellement déployé et vérifié.
