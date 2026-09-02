---
name: project_brvndlab_seconde_brain_optimisation
description: "Modèle de la seconde brain Brvndlab (le \"comment j'écris\") : elle optimise et converge, elle n'efface pas"
metadata: 
  node_type: memory
  type: project
  originSessionId: 429ff311-7ceb-4dfb-8ddc-eb51181af3ad
---

Décisions de fond scellées avec Jonathan sur la seconde brain (le "comment j'écris", distinct du Brand OS qui porte le qui/quoi). Voir [[project_brvndlab_seconde_brain_comment_ecrire]].

**Le modèle central : la brain OPTIMISE, elle n'efface pas.**
Elle affine ses notes pour qu'elles soient plus justes (pas les jeter), converge vers le cadre d'écriture du client et le stabilise. Une mémoire qui se resserre vers le vrai, pas qui gonfle à l'infini. Reste centrée sur la création de contenu, jamais le "deep perso / la vie".

**Le mot "supprimer" est banni.** Jonathan est contre la suppression, pour l'optimisation/réajustement. Optimiser = remplacer une compréhension approximative par une plus juste (ex "il aime les phrases courtes" devient "il coupe court sur les accroches, plus ample dans le développement"). La note ne disparaît pas, elle devient plus précise.

**L'image de la maison (garde-fou moral).** Ce qui serait mal, ce n'est pas de corriger une note, c'est d'apprendre du client dans son dos sans qu'il le sache. Le vrai enjeu = consentement + visibilité, pas "qui supprime". Le client doit savoir que sa brain apprend et pouvoir la voir.

**Ce que la brain N'EST PAS.** Ni un Obsidian (rangement manuel par l'humain), ni une boîte noire (IA décide seule et invisible). C'est le modèle des mémoires IA modernes (memory ChatGPT) : l'IA écrit en background, l'humain regarde. Leçon à voler d'Obsidian : les LIENS entre notes (une note en pointe une autre), pas le rangement manuel.

**Déclencheur d'apprentissage (déjà en prod).** La brain apprend quand un contenu part dans la pipeline (n'importe quelle colonne active : Post validé, Production, Montage, Prêt). Archive/suppression n'apprennent rien. "Post validé" (status draft) ou une refonte = signal fort ; autres colonnes = signal plus faible. Route `/api/brain-validate`, branchée sur les 3 formats (script/carousel/story).

**Ordre des chantiers scellé :**
1. PROCHAIN = le moteur d'optimisation (le fond). Aujourd'hui `convex/brain.ts` addNotes ne fait qu'AJOUTER (dédup texte exact) puis JETER les plus anciennes au-delà de 80. Il faut qu'à l'arrivée d'une note, l'IA relise l'existant sur le même sujet et RÉÉCRIVE la note en version plus juste (confirme/affine/contredit), au lieu d'empiler. C'est ça converger vers le cadre.
2. APRÈS = la page visible dans le SaaS (à côté du Brand OS) où le client voit sa brain grandir/s'affiner.

**Reste ouvert (pas encore tranché) :** qui corrige (client seul vs IA aussi) — remplacé par le modèle "optimiser", à re-cadrer ; le but de la page visible (contrôle vs vitrine vs les deux) ; capture du diff avant/après (l'IA n'apprend pas encore de ce que le client CHANGE vs ce qu'elle avait produit).
