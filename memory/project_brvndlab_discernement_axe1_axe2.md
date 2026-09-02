---
name: project-brvndlab-discernement-axe1-axe2
description: "Discernement de la matière (31/07 après-midi) — axe 1 LIVE (faits porteurs vs matière secondaire + clarification mot lâché), axe 2 (juge éditorial élargi) À FAIRE"
metadata: 
  node_type: memory
  type: project
  originSessionId: 333200f7-27e1-4e07-a73a-bad19f6323f8
  modified: 2026-07-31T10:56:44.136Z
---

Chantier « discernement » scellé le 31/07/2026 après-midi (suite de l'audit du script « Un soldat reconnaît toujours un soldat » : tout le brainstorm finissait dans le script, à plat, sans tri par rapport à l'image/ICP).

Décision de fond : « fait verrouillé » = fidèle TOUJOURS, obligatoire SEULEMENT si porteur.

**Axe 1 — LIVE (commits cdf50fe4 + 35bd3960, Convex accurate-cormorant-297 + Vercel déployés et vérifiés)**
- Lya trie à la conclusion : max 2-3 faits PORTEURS (critère : sert l'angle, l'audience, l'image), le reste en `matiereSecondaire` (nouveau champ angles, réservoir sacrifiable).
- Fiche récap : deux groupes affichés, bascule Porteur ↔ Secondaire (updateFaits étendu). Pas d'édition de texte (décision lecture seule du matin maintenue).
- Générations (script/carousel/story) : porteurs = règle dure inchangée ; secondaire = « utilise si ça sert le fil, sacrifie sinon, jamais déformée si utilisée » (buildMatiereBlock dans faitsLock.ts).
- Juge de couverture : absence fautive uniquement pour un porteur + nouveau motif « effet checklist » (matière casée qui dilue = à couper). findLockFaults (chiffres) reste porteurs only.

**Clarification mot lâché vs mot assumé — LIVE (même deploy)**
Règle Lya (brainstorm-explore) : un terme fort qui détonne avec le caractère du Brand OS ET candidat fait/formule → UNE question de clarification (« tu dis abattre, c'est vraiment ça ? »). La réponse fait foi et se verrouille. INTERDIT d'adoucir d'elle-même : confirmé ou non demandé = verbatim. Déclencheur : « abattre » sorti tel quel dans le script soldat, Jonathan : « il n'a pas de bienveillance ».

**Axe 2 — RETIRÉ le 31/07 15h45 (dégonflage, commit 686c5a5a)**
Le juge éditorial a été SUPPRIMÉ quelques heures après sa mise en ligne : scripts devenus médiocres/plats/creux. Cause diagnostiquée : jusqu'à 4 réécritures complètes (passe éditeur inconditionnelle + 3 rounds × 3 juges) avec ordres contradictoires (étoffe vs coupe vs garde tout). NE PAS RÉINTRODUIRE un juge de coupe en aval : le tri se fait chez Lya et sur la fiche, jamais aux ciseaux après génération.

**État final du pipeline génération (dégonflé, LIVE)**
Génération → round 0 : fautes déterministes + 2 juges (humain/IA, couverture fidélité) → UNE réécriture si fautes → round 1 : déterministe seul → une correction ciblée max. Un script propre au premier jet n'est JAMAIS réécrit. Matière secondaire = réservoir à EXPLOITER (enrichir, jamais « sacrifier »), « effet checklist » retiré, règle du fil sans pression « court ».

**Lya (LIVE, même commit)**
Registre business / CONVICTION (sa parole = matière, jamais de demande de preuve, on creuse le raisonnement) / vécu-identité. FREIN À LA PREUVE : une seule demande par conversation entière. BRAINSTORM COURT PAR DÉFAUT : 5-8 échanges, question nécessaire ou pas posée. Porteurs 2-4. Plafond clarté accepte la conviction argumentée. Preuve adaptée au registre. Zéro question méta. Clarification mot lâché conservée.

Reste : test runtime réel (un brainstorm complet : tri de Lya, bascule fiche, clarification mot fort, registre, les 3 juges). Voir [[project-brvndlab-audit-brainstorm-mode-2026-07-31]].
