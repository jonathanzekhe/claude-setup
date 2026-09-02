---
name: project_brvndlab_personas_regen_audience_problemes
description: "Brand OS — personas régénérés quand audience OU problèmes changent, minimum 3 garanti"
metadata: 
  node_type: memory
  type: project
  originSessionId: 85669be3-5f8f-465a-b4ca-9c318860b9c4
  modified: 2026-07-27T21:06:59.899Z
---

Bug (27/07/2026, Jonathan) : modifier les PROBLÈMES ne régénérait pas les personas → il gardait les anciens. Cause : la signature de régénération (`audienceSig` dans personas/page.tsx) surveillait le module `audience` mais OUBLIAIT `probleme-principal` (module `problemes`). Le module problemes avait déjà ce mécanisme pour lui-même, pas les personas.

**Fix déployé :**
- Signature inclut `mainProblem: norm(pmap["probleme-principal"])` + nouvelle query `problemesResponses`. Régénération quand audience OU problème change. Hook attend `problemesResponses !== undefined` avant de comparer.
- Cible 2 → 3 personas (auto-génération `for i<3` + sync `Math.max(3, ...)`).
- GARANTIE minimum 3 : effet dédié qui complète jusqu'à 3 si length entre 1 et 2 (garde les existants). Anti-course : refs synchrones (autoGenRef, hasSavedRef, regenBusyRef, completeBusyRef), domaines de personas.length disjoints, anti-boucle guard<5.
- MIGRATION anti-écrasement (CRITIQUE, tribunal l'a attrapé) : les comptes existants ont une ancienne `audience-sig` SANS `mainProblem`. La lire déclencherait une régén-écrasement surprise de TOUTE la base + salve d'appels IA au 1er chargement. Fix : si `!storedSig.includes("mainProblem")` → on ré-enregistre la nouvelle sig SANS régénérer. Régen au prochain VRAI changement seulement.

**Stockage :** personas dans `brandOsResponses` (moduleSlug="personas", questionId="personas-data", JSON array). `saveResponse` écrase (patch), versioning Convex snapshotte avant (undo à vie, cf [[project_brvndlab_brandos_versioning_memory]]).

**Faiblesses connues (non bloquantes) :** min-3 non garanti si l'IA échoue 5x (guard<5, retente au reload) ; complete remonte à 3 même après suppression manuelle (comportement VOULU : Jonathan veut toujours 3). Voir [[project_brvndlab_audience_sync_regen]] (précédent : problèmes régénérés sur signature audience).
