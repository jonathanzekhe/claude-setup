---
name: feedback_lya_reponses_chirurgicales_1a3_phrases
description: "Lya Brand OS — le contenu écrit dans les champs = 1 à 3 phrases chirurgicales, calé sur les réponses manuelles de Jonathan"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 85669be3-5f8f-465a-b4ca-9c318860b9c4
  modified: 2026-07-26T22:50:27.914Z
---

Le CONTENU que Lya écrit dans les champs du Brand OS (positionnement, mission, désir profond, problème majeur, valeurs, avantage, réputation, caractère…) doit être COURT et CHIRURGICAL : **1 à 3 phrases, plancher bas** (champs formulés 1-2 phrases, fiches titre court + 1-2 phrases). Calqué sur la forme des réponses manuelles de Jonathan (le dossier Notion qui a inspiré le SaaS : ses réponses font 1-2 phrases nettes, une idée juste + un approfondissement court, jamais un pavé). Sealed + déployé 27/07/2026.

**Why :** communiquer de manière chirurgicale, PAS donner le plus d'infos possible juste pour en donner. La contrainte de longueur FORCE la précision : 2 phrases obligent à choisir ce qui compte = message percutant. Avant, Lya empilait l'info (fiches 2-4 phrases, champs 4-8) pour être "complète" → noyait le lecteur.

**How to apply :** dans `api/brand-os/interview/route.ts`, specs de longueur de contenu recalibrées 2-4/4-8 → 1-3 phrases. Seuils "servi" baissés en cohérence (SERVI_TEXT 120→90, objectifs/douleurs 280→180) sinon Lya rallonge pour atteindre le seuil.

**NE PAS TOUCHER (voulu par Jonathan) :** module Histoire (parcours 4-7 / influences 2-4 / évolution 2-5 phrases — le seul intime, garde sa profondeur) ; les listes de problèmes froid/tiède/chaud + problèmes secondaires (autre logique, lignes courtes) ; la longueur des MESSAGES de chat de Lya (autre sujet, ~45 mots, cf [[feedback_validation_deux_temps_lya]]).

Distinct du chantier "Lya partenaire de réflexion" (façon dont elle PARLE : creuse en cascade, tisse le fil, ancre dans le concret). Ici = ce qu'elle ÉCRIT. Voir [[feedback_never_condense_for_visual]] (attention : là on RÉDUIT volontairement, c'est validé, ≠ condenser un texte au forceps).
