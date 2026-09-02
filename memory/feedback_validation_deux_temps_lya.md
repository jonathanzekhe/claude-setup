---
name: feedback_validation_deux_temps_lya
description: "Lya (Brand OS + refonte) — validation en deux temps avant d'écrire, jamais foncer sans accord"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 85669be3-5f8f-465a-b4ca-9c318860b9c4
  modified: 2026-07-27T01:36:24.711Z
---

Lya remplissait le Brand OS / réécrivait les scripts TROP VITE, sans attendre validation, et enchaînait sur le sujet suivant. Jonathan : confus, pas eu son mot à dire. Sealed 26/07/2026.

**Comportement voulu (deux niveaux de validation), dans `api/brand-os/interview` ET `api/refonte-content` :**
- NIVEAU 1 (dans le chat, AVANT d'écrire) : sur un champ qui se FORMULE (positionnement, promesse, statement, valeur rédigée, position unique) et sur toute refonte, Lya PROPOSE d'abord, attend le feu vert. Elle N'ÉCRIT rien (patch/blocks=null) avant l'accord.
- NIVEAU 2 (après l'accord) : elle écrit PUIS re-vérifie (« c'est noté, ça te va comme ça ? ») et n'avance qu'au 2e feu vert. Comme la refonte le faisait déjà bien.
- EXCEPTION (fluidité, écriture directe) : fiches « Mon histoire » (parcours/influences/évolution — doivent apparaître EN DIRECT), cases à cocher, dictées mot-à-mot. Pas la cérémonie des deux niveaux.

**Why :** expérience premium (Linear/Notion), le créateur garde la main, zéro remplissage « n'importe comment », zéro redondance.

**Piège CRITIQUE (rôle du tribunal) :** le prompt était durci EXPRÈS avec ~10 règles « écris immédiatement / pas de patch = tour perdu » à cause d'un ancien bug (module restait VIDE). Bloquer toute écriture avant « oui » recassait ça. Résolu (2 tours de tribunal) : distinction fiches (direct) vs champs-formulés (proposition d'abord) ; PLANCHER anti-blocage (si l'user enchaîne avec de la matière sans refuser = feu vert implicite ; jamais finir un module avec un champ de fond vide ; jamais boucler en propositions) ; conclusion/generated-fiche EXEMPTÉE du niveau 2 (geste terminal, un seul feu vert). Voir [[feedback_zero_bug_chat]] [[feedback_scope_strict_only_what_asked]].

**RAFFINEMENT CRÉER vs MODIFIER (27/07/2026, sealed) :** la proposition-avant-écriture (NIVEAU 1) vaut UNIQUEMENT pour CRÉER un champ de fond de zéro. Pour MODIFIER un champ qui existe DÉJÀ (« condense », « raccourcis », « reformule », « change le ton ») : Lya applique DIRECT dans la fiche (Jonathan voit le changement à l'écran) et demande juste « ça te va ? », SANS recopier le texte dans le chat. Bug déclencheur : « condense les 3 sections » → Lya recopiait les 3 versions entières dans une bulle = pavé illisible, « dégueulasse ». Le contrôle reste (elle demande), mais VISUEL (fiche) au lieu de TEXTUEL (chat). Règles 12sexies (distinction) + 12octies (raccourcir applique direct). Ne JAMAIS recopier le contenu d'une fiche dans le chat.

**ZÉRO STOP APRÈS ÉCRITURE — VALIDÉ UNE FOIS = ÉCRIT + ENCHAÎNE (27/07/2026, sealed) :** le 2e feu vert post-écriture a été SUPPRIMÉ. Bug : après validation d'un champ, Lya écrivait puis disait « c'est noté, ça te va ? » et s'ARRÊTAIT → Jonathan devait écrire « continue » = stop qui casse le flow. Désormais : après validation de la DIRECTION (1 SEUL feu vert, niveau 1), Lya écrit ET enchaîne DIRECT sur le champ suivant dans le même message (« c'est noté. On enchaîne sur ta position unique : [question] »). Vaut pour TOUS les cas : champ de fond, fiches, modifs (condense/raccourcis), cases. Plus AUCUN « ça te va ? » qui oblige à relancer. Jonathan corrige de lui-même s'il veut. PRÉSERVÉ : le feu vert de DIRECTION AVANT écriture reste obligatoire (le contrôle essentiel) — Lya ne fonce jamais sans accord. Règle 12sexies renommée « valide la direction puis avance sans stop ». Principe Jonathan : « faut jamais qu'il y ait de stop, reste dans le flow ».

**NIVEAU 1 = LA DIRECTION, PAS LE TEXTE (27/07/2026, sealed) :** en CRÉATION, le NIVEAU 1 propose l'ANGLE / l'INTENTION en quelques mots, JAMAIS la phrase rédigée entre guillemets. Le texte rédigé n'apparaît qu'au NIVEAU 2, DANS LA FICHE. Calqué EXACTEMENT sur la refonte (refonte-content route ~L197 « tu proposes la direction en une ligne »). Bug déclencheur : sur Positionnement, Lya récitait « je partirais sur : "Je conçois des systèmes IA..." » = « il me dit ce que je vais dire », lourd. Modèle voulu : « je partirais sur l'angle X, ça te parle comme direction ? » → oui → écrit dans la fiche. Aligné dans 12sexies NIVEAU 1 + les 2 miroirs (OBLIGATION D'ÉCRITURE + QUAND ÉCRIRE). Jonathan veut le feeling refonte partout dans le Brand OS.
