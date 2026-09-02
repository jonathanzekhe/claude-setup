---
name: project_brvndlab_hook_rules_hardened
description: "Règles dures du HOOK dans la base de génération Brvndlab (anti-tics + varier l'angle d'attaque)"
metadata: 
  node_type: memory
  type: project
  originSessionId: e56c0628-4654-4874-95e6-25ea50f9dcf6
  modified: 2026-07-25T07:30:31.382Z
---

**Renforcement du HOOK dans CONTENT_RULES (src/lib/ai/chatRules.ts), 2026-07-25.** Partagé par script/carousel/story. Voir [[project_brvndlab_base_generation_validated_live]] (base scellée e73b03ee) et [[project_brvndlab_generation_base_neutre_solide]].

**Pourquoi :** la base scellée produisait des hooks à ~8/10 avec deux défauts SYSTÉMIQUES (pas de tir raté isolé, un défaut de règle) :
1. Anaphore "tu... tu... tu..." + énumération plate ("tu sacrifies ton temps, ton argent, ton énergie"). Hook détesté par Jonathan : "Tu travailles dur, tu sacrifies X, tu sacrifies Y".
2. Après correction 1, nouveau moule uniforme : 8/10 ouvraient sur "C'est quoi ton prochain levier de X ? un A, un B, un C" — le modèle déroulait mécaniquement la 1re "direction possible" du brainstorm.

**Règles ajoutées (règle 1 HOOK de CONTENT_RULES) :** interdit anaphore ; interdit énumération plate pour faire du rythme ; frapper par l'idée/tension pas la cadence ; pas de formule d'ouverture générique ; UNE idée dite une fois ; **CHOISIR l'angle d'attaque le plus fort de la matière** (diagnostic direct "cette semaine combien de temps as-tu...", paradoxe, contre-pied de croyance, constat qui dérange), ne pas dérouler la 1re piste ; **ne pas retomber sur "question générale + énumération"**, le hook doit tenir même sans "?".

**Méthode de validation employée (à réutiliser) :** harnais local scripts/gen-variants.mjs — génère N variantes avec le VRAI moteur prod (clé ANTHROPIC_API_KEY de .vercel/.env.production.local, ATTENTION la clé a un \n littéral à nettoyer, modèle claude-sonnet-4-6, lit CONTENT_RULES en direct depuis chatRules.ts). Base généraliste (brandBlock vide, pas de Brand OS/seconde brain). On juge la LOGIQUE sur 10 tirs, pas hook par hook — Jonathan reste neutre, la règle doit sortir du 9-10, pas lui qui valide au cas par cas. Résultat après fix : 10 tirs passent de 8/10 quasi identiques à un vrai éventail (diagnostic / réflexe-ajouter / constat). Commits e73b... puis 7f325965 (anti-tics) + 3ad632e6 (varier l'angle).

**Prochain chantier prévu :** même travail sur les STORIES (10 variantes), puis les CAROUSELS. On teste la FORME, funnel indifférent.
