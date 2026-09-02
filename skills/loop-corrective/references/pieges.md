# Les trois pièges

## Contenu

- Le correctif élégant qui écrase la donnée réelle
- Le chiffre relayé sans être remesuré
- Le silence pris pour un succès

Chacun a été observé en production. Chacun a coûté des heures.

## 1. Le correctif élégant qui écrase la donnée réelle

**Ce qui se passe.** Une personne a déjà saisi ses valeurs quelque part. Le modèle, plus élégant, les recalcule à partir d'autres champs. Il produit des valeurs qui n'existent nulle part : ni chez elle, ni dans le système source. Plus rien ne se rapproche, et les écarts deviennent illisibles.

**Cas réel.** Un fichier de suivi contenait « 11 mensualités de 187,50 ». Le modèle a déduit 6 échéances de 328,52 à partir de la durée du contrat. Les prélèvements réels étaient de 187,50. Résultat : 19 clientes avec zéro paiement rapproché et une dette affichée trois fois trop grosse, dont 15 000 d'artefact pur.

**La parade.** Quand une source de vérité est désignée, elle prime sur toute déduction. La déduction ne sert que si la case est vide. Écris-le explicitement dans le brief de l'agent, sinon il recalculera par réflexe.

**Le signal d'alerte.** Un rapprochement qui échoue massivement ne dit pas « les données sont sales », il dit souvent « je compare aux mauvaises valeurs ».

## 2. Le chiffre relayé sans être remesuré

**Ce qui se passe.** Un agent annonce un résultat. L'orchestrateur le transmet. La personne le découvre faux. La confiance dans tout le reste s'effondre, y compris dans ce qui était juste.

**Cas réels.** Trois dans une seule nuit : une cliente déclarée impayée alors que son rapprochement avait simplement échoué sur un prénom, un montant d'arriérés annoncé à 10 200 qui valait en réalité moins de la moitié après dédoublonnage, et un total encaissé faux de 11 000 parce qu'une fenêtre de rattrapage par défaut coupait l'historique.

**La parade.** Qui transmet un chiffre l'a mesuré. Pas lu dans un rapport, pas déduit d'un commentaire : mesuré, par une commande relancée au moment de transmettre.

**Le signal d'alerte.** Un chiffre rond, un chiffre qui confirme trop bien l'hypothèse, un chiffre dont personne ne sait dire d'où il sort.

## 3. Le silence pris pour un succès

**Ce qui se passe.** Dans un système conçu pour se taire quand tout va bien, une panne produit exactement le même signal qu'un fonctionnement normal : rien.

**Cas réels.** Une surveillance dont le journal ne consignait qu'un passage sur deux, parce que la rotation du fichier remplaçait l'inode sous le descripteur ouvert : le service tournait, la trace disparaissait. Et une commande de vérification qui, en s'exécutant, consommait le curseur qu'elle devait contrôler, rendant muette l'alerte du lendemain.

**La parade.** Vérifie l'état, jamais l'absence de symptôme. Et traite tes propres contrôles comme du code : un contrôle qui modifie ce qu'il observe détruit sa propre preuve.

**Le signal d'alerte.** « Ça n'a rien envoyé, donc il n'y avait rien à envoyer. » Cette phrase mérite toujours une vérification d'état.
