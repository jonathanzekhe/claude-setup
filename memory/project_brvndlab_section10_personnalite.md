---
name: project_brvndlab_section10_personnalite
description: "Brique 2 Brvndlab — section 10 \"Personnalité\" du Brand OS, fiche de personnage générée + décisions design validées"
metadata: 
  node_type: memory
  type: project
  originSessionId: 690eb7d8-2923-4173-8286-b8161cb92e15
---

Section 10 "Personnalité" du Brand OS Brvndlab (brainstormé et maquetté le 2026-07-20/21, layout "Focus Voix" validé, pas encore codé). Le persona passe en section 9, la personnalité devient la section 10 (la dernière).

**Nature.** Pas une fiche de tonalité : une FICHE DE PERSONNAGE / avatar de l'utilisateur. Générée, en lecture seule (sauf voix + curseurs de caractère ajustables). Contenu : photo (synchro auto avec l'avatar Brvndlab, initiales en fallback) + nom, une SYNTHÈSE forte en tête ("Tu es quelqu'un qui...", cœur émotionnel validé), 4 axes de caractère en curseurs, objectifs, points de douleur, voix.

**Comment ça capte (le brainstorm).** Lya capte le CARACTÈRE par 4 axes entre extrêmes (rapport à la vérité, moteur rationnel/instinctif, rapport aux idées, rapport à l'autre) + socle de valeurs non négociables. Elle observe le COMMENT autant que le quoi (longueur des réponses = donnée). Elle porte l'effort, jamais le client. Test par l'exemple : montre des phrases générées à partir du portrait deviné et demande "ça te ressemble ou pas". Un seul feu vert (main tendue). Voir [[project_brvndlab_brainstorm_style_communication_agent]].

**CRITIQUE — le brainstorm DOIT capter les tournures détestées.** Sinon on retombe sur le problème de Raphaela. Lya demande ce que la personne aime et déteste dans la FAÇON DE FORMER LES PHRASES (pas juste des mots). Ces tournures vivent dans le BACKEND, jamais affichées dans la fiche.

**Design validé (Focus Voix).** Layout "Focus Voix" : caractère/objectifs/douleurs compacts en haut, VOIX en grande zone dédiée en dessous. Thème CLAIR par défaut (tokens brand-os : --base #F3EEE4, --mark #1C1A16, amber #9A6314 rare, corail #DD7C6C interdits). Titre "Personnalité" en grand (aimé, "c'est fort"). Flux DEUX ÉCRANS jamais simultanés (chat plein cadre PUIS fiche seule, comme voix/page.tsx spec && ivOpen). Pattern réel : BosModule + ivbtn + BosInterview wide.

**Règles UI dures.** JAMAIS afficher le mot "Lya" à l'écran (Jonathan déteste, l'IA le lit à voix haute). Bouton = "Reprendre" sans "Lya". Zone VOIX extensible SANS LIMITE (ajout de mots interdits/signature à l'infini, scroll interne, "aucune limite ressentie"). Objectifs/douleurs en LECTURE SEULE (pas optimisés au quotidien). Peu de texte, zéro label bavard, less is more radical. Fiche floutée pendant le brainstorm, révélée quand l'IA a assez de matière.

**Sécurité anti-Thomas.** Capte et stocke la voix, ne la FORCE JAMAIS dans le rendu (le Brand OS forcé a rendu les scripts décalés, revert du 2026-07-20). Utiliser le portrait pour écrire = brique ultérieure, avec précaution.

**Règle système déjà en place.** L'antithèse "c'est pas parce que X, c'est parce que Y" et l'anaphore staccato sont DÉJÀ interdites dans generate-script/carousel/story (détecteurs regex + correction forcée, demande explicite de Jonathan). Voir [[feedback_no_em_dash]], [[feedback_mots_bequilles_interdits]].

**Brique 3 (à faire).** Brancher la correction de script sur la loupe d'auto-apprentissage (distillToBrain) : quand l'utilisateur corrige "j'aime pas cette tournure", ça nourrit le backend. Aujourd'hui distillToBrain n'est appelé que depuis brainstorm-explore. Voir [[feedback_skill_brainstorm_loop_default]].
