---
name: project_brvndlab_module_order_rank_lock
description: "Brand OS — ordre logique des modules + verrou par rang (l'après ne touche jamais l'avant)"
metadata: 
  node_type: memory
  type: project
  originSessionId: 85669be3-5f8f-465a-b4ca-9c318860b9c4
  modified: 2026-07-26T13:14:57.425Z
---

Brand OS, sealed 26/07/2026. Règle produit (Jonathan) : **chaque module ne dépend que de ce qui vient AVANT lui ; l'après ne touche jamais l'avant.** C'est une chaîne logique (comme les personas en dernier = résultat de tout).

**Ordre canonique** (source de vérité = `convex/seedBrandOsFull.ts` MODULES, `order = index` ; miroir front `_bos.tsx` BOS_MODULES, doivent rester identiques) :
1 Personnalité (LA BASE, découplée) → 2 Histoire → 3 Audience → 4 Positionnement → 5 Offre → 6 Problématiques (APRÈS l'offre : la solution est connue, réglait le cas Jonathan) → 7 Mission → 8 Valeurs → 9 Voix → 10 Personas (synthèse finale).

**Personnalité découplée** : elle était synthétisée depuis Mission (objectifs) + Audience (ICP). Maintenant 1re et autonome, elle capte tout à froid en conversation. Fixé dans `_interview.ts` (hunt objectifs) + `interview/route.ts` (branche isPersonnalite, lignes ~969-972).

**Verrou par rang** (`convex/brandDna.ts`) : `MODULE_RANK` construit depuis `CANONICAL_MODULE_SLUGS`. `getBrandDna` prend un arg optionnel `upToModule` → ne garde que les réponses de rang STRICTEMENT inférieur (l'amont réel COMPLET, pas un résumé = "intelligence unie" sur l'amont). Interview de Lya passe `upToModule: moduleSlug` ; page problèmes query `upToModule: "problemes"` ; personas passe `{}` (voit tout, dernier). Tous les autres consommateurs (scripts, stories, linkedin, qa...) passent `{}` → comportement historique inchangé.

**Piège corrigé (tribunal)** : `style` et `message` sont hors seed mais ont encore des réponses en base (style/page.tsx vit encore, porte tons/débit/mots-signature). Sans rang, mon filtre `rank==null` les gardait TOUJOURS → la voix fuyait dans les modules amont. Fix : rang explicite `MODULE_RANK["style"]=rang voix`, `MODULE_RANK["message"]=rang offre`.

**DÉPLOIEMENT — action critique** : le seed EST la migration (patche `order` sur lignes existantes) mais un deploy Convex NE le lance PAS. Il FAUT `npx convex@1.42.1 run seedBrandOsFull:seed` en prod après deploy, sinon le hub affiche l'ancien ordre (DB) alors que le verrou utilise le nouveau (code). Fait le 26/07 : résultat `updated:10, deactivated:0`. Validé par tribunal 3 agents (rank-lock / découplage / migration). Voir [[project_brvndlab_audience_sync_regen]] [[feedback_convex_cli_1341_lies_use_1421]].
