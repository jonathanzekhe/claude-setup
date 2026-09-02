---
name: feedback_brvndlab_prelaunch_ship_direct
description: "Brvndlab en pré-lancement — on livre direct en prod, pas de phase mockup-puis-validation"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 891eaab9-8ef6-4fcf-a347-420863b4ac39
---

Brvndlab n'est encore envoyé à **personne** (pré-lancement). Donc « on est toujours en production » : chaque modif part **directement en prod**, sans attendre une validation explicite séparée.

**Pourquoi :** pas d'utilisateurs réels à protéger d'une régression visible. Le coût d'un aller-retour mockup→validation→prod n'est pas justifié tant que l'app n'est pas livrée.

**How to apply :** quand Jonathan valide une direction (ex. Color Lanes), implémenter dans le vrai composant et déployer `vercel --prod --yes` dans la foulée, puis vérifier le live. Ne plus demander « je mets en prod ? » pour Brvndlab tant qu'on est en pré-lancement.

Nuance : reproduire la variante validée **au pixel près** ([[feedback_schmid_template_strict]]). Cette règle assouplit [[feedback_never_deploy_prod_without_explicit_validation]] **uniquement** pour la phase pré-lancement Brvndlab — la réactiver dès que l'app a de vrais clients. Toujours vérifier le live après push ([[feedback_verify_until_live]], [[feedback_always_push_to_vercel]]).
