# Gabarit de brief d'agent

Remplis chaque section. N'en retire aucune : celles qui paraissent superflues sont précisément celles qui manquent quand un agent rend un travail invérifiable.

Remplace tout ce qui est entre chevrons. Supprime les commentaires entre parenthèses.

---

Tu travailles dans `<chemin du dépôt ou du système>`. `<Une phrase sur le contexte métier réel, pas technique : qui s'en sert et pour quoi.>`

## CONTEXTE DÉJÀ VÉRIFIÉ

(Ce qui est établi, pour qu'il ne le redécouvre pas. Chiffré. Précise ce qui reste à confirmer.)

- `<fait mesuré, avec sa valeur>`
- `<fichier ou fonction concernée, avec son rôle>`
- `<ce qui a déjà été tenté et a échoué, pour ne pas le rejouer>`

## CE QUE TU CONSTRUIS

(Une seule tâche. Si tu en écris trois, tu obtiendras trois demi-travaux.)

`<Le résultat attendu, formulé comme un état observable.>`

## LA RÈGLE QUI PRIME

(La source de vérité. Sans elle, l'agent recalculera par élégance.)

`<Quelle donnée fait foi quand deux se contredisent. Ce qui ne doit jamais être recalculé.>`

## CONTRAINTES DURES

- Périmètre : `<fichiers autorisés>`. Ne touche à rien d'autre.
- Dépôt partagé : commit immédiatement, jamais de remise de côté, ne reviens jamais sur le travail d'un autre.
- Données réelles : lecture seule, ou objet jetable créé puis supprimé. Sauvegarde avant toute écriture. Prouve la restauration.
- `<Déploiement autorisé ou non, et sur quoi.>`
- Langue et style : `<français, pas de tiret cadratin, pas de jargon>`.
- `<Commande de contrôle qui doit passer, avec les erreurs préexistantes à ignorer.>`

## VÉRIFICATION EXIGÉE

(Sans cette section, tu recevras une affirmation. Avec, tu recevras une preuve.)

- Montre l'état AVANT et APRÈS, chiffré.
- Prouve nommément : `<cas précis à vérifier, choisis parce qu'ils échouaient>`.
- `<Capture d'écran, sortie de commande, requête : dis lequel.>`
- Ne conclus jamais « ça marche » sans la sortie qui le montre.
- Si une correction se révèle plus risquée que le défaut, dis-le et ne la fais pas.

## COMPTE RENDU ATTENDU

Court et factuel : ce que tu as fait, les preuves, ce qui reste ouvert, et **ce que tu n'as pas pu vérifier**.

N'invente aucun résultat. Si quelque chose bloque, dis-le franchement plutôt que de contourner.
