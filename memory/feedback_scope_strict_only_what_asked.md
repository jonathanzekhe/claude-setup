---
name: feedback_scope_strict_only_what_asked
description: "Quand Jonathan demande une modif précise, ne toucher QUE ce périmètre, jamais réécrire/supprimer le reste"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: a031b1fe-aa29-46e1-a07a-0ab4e51b0896
---

Quand Jonathan demande une modification SPÉCIFIQUE et étroite, ne toucher que le strict périmètre demandé. Ne pas refactorer, supprimer, réécrire ou "améliorer" le code autour, même si ça semble justifié.

**Why:** Le 2026-07-01, il a demandé uniquement de "brancher la clé API derrière" pour le module Problématiques du Brand OS. J'ai réécrit le frontend, supprimé les pools statiques, ajouté une route, déployé. Réaction : "c'est de la merde, fallback tout, je t'ai juste demandé d'implémenter la clé API derrière". Le sur-périmètre l'énerve autant qu'un bug, parce qu'il perd le contrôle de ce qui change et que ça réintroduit/écrase des choses. Aggravé par la désync de branches (voir [[feedback_verify_deploy_lineage_before_prod]]).

**How to apply:**
- Faire le MINIMUM qui répond exactement à la demande. Le backend et le code existant font foi ([[feedback_mockup_visual_only_respect_backend]], [[feedback_never_modify_existing]]).
- Si une amélioration plus large semble utile, la PROPOSER après, ne pas la faire d'office ([[feedback_ne_pas_prendre_initiatives]]).
- En cas de doute sur l'étendue, viser l'interprétation la plus étroite.
- Ne jamais déployer en prod un changement qui dépasse ce qui a été demandé sans validation explicite.
