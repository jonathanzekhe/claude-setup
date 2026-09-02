---
name: project_brvndlab_funnel_classification_ia
description: "Brvndlab — la température TOFU/MOFU/BOFU est classée par l'IA qui LIT le contenu généré (fin du bug tout-TOFU)"
metadata: 
  node_type: memory
  type: project
  originSessionId: 85669be3-5f8f-465a-b4ca-9c318860b9c4
  modified: 2026-07-27T00:29:10.239Z
---

Bug (27/07/2026) : une cliente (Raffaella) avait 13 contenus TOUS classés TOFU. Cause racine : la température (funnel) n'était JAMAIS déduite du contenu — elle était héritée de l'amont (brainstorm de l'angle), biaisée vers TOFU par un exemple hardcodé `"funnel":"TOFU"` dans le prompt brainstorm-explore, + fallbacks TOFU en dur à chaque maillon. Aucune classification ne lisait le script/carrousel/story fini.

**Fix déployé (script + carrousel + story) :**
- Helper partagé `src/lib/ai/classifyFunnel.ts` : l'IA LIT le contenu généré (sections/slides) et le classe TOFU (pas conscient du problème) / MOFU (cherche à comprendre, compare) / BOFU (prêt à agir, évalue une solution). Fallback = funnel amont si l'IA échoue ou renvoie un JSON invalide (jamais de crash, jamais de valeur hors des 3).
- `generate-script` (fonction locale, déployée en 1er), `generate-story` (feature story_light), `generate-carousel` (carousel_premium) classent leur contenu fini avant de renvoyer `finalFunnel`.
- **Choix manuel PRIORITAIRE** : si `funnelLocked === true` (l'user a choisi une problématique froid/tiède/chaud), pas de reclassement. Chaîne : `angle.funnelLocked` → recap (script_context/carousel_context/story_context) → ctx → body → route.
- `withCTA` reste basé sur l'intention de génération, pas la reclassif (un CTA déjà écrit n'est pas retiré rétroactivement).
- Biais du prompt brainstorm-explore supprimé (placeholder au lieu de "TOFU", consigne « les 3 également probables »).

**Limites connues :** corrige les FUTURS contenus ; les 13 anciens restent TOFU tant que non régénérés (reclassement rétroactif PAS fait, Jonathan a dit pas ce soir — à proposer s'il redemande). Vérifié tribunal à chaque étape, 0 régression. Voir [[project_brvndlab_script_length_cta_funnel_fix]], [[feedback_funnel_colors]].
