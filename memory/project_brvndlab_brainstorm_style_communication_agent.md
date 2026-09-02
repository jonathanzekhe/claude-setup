---
name: project_brvndlab_brainstorm_style_communication_agent
description: "Brique 2 Brvndlab — brainstorm profond du style de communication (section 9 Brand OS) pour capter l'identité de voix de CHAQUE client"
metadata: 
  node_type: memory
  type: project
  originSessionId: 690eb7d8-2923-4173-8286-b8161cb92e15
---

Sujet de fond à brainstormer (décidé le 2026-07-20, pas encore construit) : le vrai problème de voix dans Brvndlab.

**Le constat de Jonathan.** Lya lui ressemble une fois le Brand OS retiré, mais UNIQUEMENT parce qu'il a créé Brvndlab (l'outil parle comme lui par défaut). Pour un client qui ne parle PAS comme lui, l'outil n'est pas chirurgical sur SON identité de communication. La brique 1 (main tendue, comment, longueur) ne règle pas ça.

**Contexte critique.** Le CTO Thomas (commits GitHub sous "ninorio12") avait poussé un chantier "ancrage de marque / Brand OS forcé dans le FOND des contenus" (commit 624de9b0). Jonathan l'a fait ANNULER (revert db4b0957) car les scripts générés parlaient "pas assez comme lui", décalés dans le caractère. Le Brand OS forcé dans le rendu = mauvaise approche. Voir [[feedback_brvndlab_brandos_no_invent_real_backend.md]].

**La direction voulue (à brainstormer, options ouvertes).** Un vrai brainstorm sur le STYLE DE COMMUNICATION = section 9 du Brand OS (module "style" : debit, mots-interdits, mots-signature, tons). Un agent qui pose des questions PROFONDES sur la personne, sa manière de parler, ses tournures, ce qui la gêne dans la communication, ce qu'elle déteste. Le but : capter l'identité de voix du client avec ses propres mots, pas juste remplir des cases (Jonathan : "juste mettre des mots, des fois les gens ne comprennent pas, il faut plus"). Option évoquée : soit intégré au Brand OS, soit un agent séparé dédié à la formulation (une bulle à part). À trancher en brainstorm.

**Lien avec les tournures interdites ignorées.** Raphaela a eu des tournures explicitement interdites qui sont quand même sorties. C'est le même chantier : le style de communication doit être capté en profondeur par brainstorm, pas par un simple champ. Voir [[feedback_mots_bequilles_interdits]], [[feedback_no_em_dash]].

**Leçon clé pour l'implémentation.** Ne JAMAIS forcer l'identité dans le rendu final (erreur de Thomas). Le contrôle reste au client, l'IA DEMANDE, ne force pas. Méthode de travail : [[feedback_skill_brainstorm_loop_default]].
