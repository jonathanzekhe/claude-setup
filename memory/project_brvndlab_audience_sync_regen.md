---
name: project_brvndlab_audience_sync_regen
description: "Brand OS — sync audience→problèmes+personas, 50 auto par axe, signature anti-boucle"
metadata: 
  node_type: memory
  type: project
  originSessionId: 85669be3-5f8f-465a-b4ca-9c318860b9c4
  modified: 2026-07-26T07:25:53.918Z
---

Brand OS, sealed 26/07/2026. Quand la page **Audience** change, les **problèmes IA** et les **personas** se régénèrent et ÉCRASENT l'existant (décision Jonathan : tout écraser, même l'édité main — y compris les personas "Créer le mien"). Déclenchement AUTO, indicateur discret.

**Mécanique anti-boucle (critique)** : chaque page downstream calcule une `audienceSig` = JSON normalisé des 5 champs audience (audience-cible, desir-profond, solutions-testees, tranche-age+plateformes triés). Stockée comme réponse Convex `questionId:"audience-sig"` (moduleSlug de la page). L'effet de régénération se déclenche UNIQUEMENT sur la signature : `firstFill` (sig jamais enregistrée) ou `sigChanged` (sig différente). JAMAIS sur le compte de problèmes/personas — sinon boucle d'appels IA payants (le "50" peut ne jamais être atteint après déduplication). Deps de l'effet volontairement SANS activiteProblems/investissementProblems (sinon chaque setState de batch re-déclenchait). Verrou `autoBusyRef`/`regenBusyRef` + `audienceSigRef` (miroir lu dans l'async) pour ne pas stamper une sig périmée si l'audience rechange pendant la génération.

**Problèmes** (`brand-os/problemes/page.tsx`) : 50 par axe AUTO (activite + investissement, froid/tiède/chaud, lots de 25) dès que audience-cible + probleme-principal remplis. Bouton "+25" SUPPRIMÉ. `fillAxisTo50(category, seed, fromScratch, setState)`. API `/api/content/problemes` (cap serveur 25/appel).

**Personas** (`brand-os/personas/page.tsx`) : régénère `max(2, personas.length)` personas sur changement d'audience (1 appel IA par persona, séquentiel). Bypasse volontairement `hasSavedRef`/`autoGenRef` (les gardes anti-écrasement du flux normal). Audience lue via query directe `getResponses({moduleSlug:"audience"})`.

Validé par tribunal 3 agents (loop / race / features cassées+coût) : 3 bugs trouvés et corrigés avant deploy. Voir [[project_brvndlab_ai_daily_limit_admin_bypass]] (Convex accurate-cormorant-297) et [[feedback_backend_three_tests_rule]].
