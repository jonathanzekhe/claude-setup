# Barèmes

## Contenu

- Le barème du superviseur, 10 points
- Ce que « remesurer » veut dire
- Le critère de qualité par domaine

## Le barème du superviseur

Une note sans barème est une impression. Un point par ligne :

1. La preuve d'exécution est fournie : sortie de commande, capture, requête
2. Le superviseur a remesuré lui-même, il n'a pas cru le rapport
3. Le résultat attendu était écrit AVANT l'exécution, et il est atteint
4. Aucune régression ailleurs
5. Le périmètre est respecté
6. Un seul changement significatif
7. Ce qui n'a pas pu être vérifié est explicitement listé
8. Aucune donnée inventée, aucun chiffre repris sans mesure
9. Le travail est réversible ou sauvegardé
10. Un humain comprendrait le compte rendu sans explication

Sous 8, on repart avec une nouvelle hypothèse.

## Ce que « remesurer » veut dire

Le point 2 est celui qui tient tout le reste. Concrètement, selon le domaine :

| Le rapport dit | Le superviseur fait |
|---|---|
| « le total est passé à 9 700 » | relance la requête et lit le nombre |
| « l'écran est propre en sombre » | rouvre la page, bascule le thème, regarde la capture |
| « le bouton ferme le menu » | clique réellement, dans un navigateur |
| « les tests passent » | relance la commande de test et lit la sortie |
| « la ligne a disparu de la liste » | recompte les lignes |
| « le message est parti » | ouvre le canal et lit le message |

Un rapport qui affirme sans que le superviseur ait pu refaire la mesure vaut 0 sur ce point, quelle que soit sa qualité rédactionnelle.

## Le critère de qualité par domaine

C'est ce qui rend la boucle réutilisable hors du code.

| Domaine | Critère à vérifier |
|---|---|
| Interface | charte graphique, thèmes clair et sombre, responsive aux largeurs réelles, aucune couleur de texte en dur |
| Donnée | la source de vérité désignée prime, aucun chiffre inventé, deux vues d'un même nombre concordent |
| Infrastructure | idempotent, réversible, une panne ne se manifeste pas par du silence |
| Contenu | ton et vocabulaire de la personne visée, aucun jargon, un état vide dit quoi faire |
| Sécurité | le chemin refusé est testé autant que le chemin autorisé |

Choisis le critère au démarrage, avec la personne. Sur un chantier mixte, retiens les deux lignes concernées plutôt que de tout cocher.
