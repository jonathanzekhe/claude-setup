# Évaluations

## Contenu

- Comment s'en servir
- Trois scénarios de test
- Ce qu'on mesure

## Comment s'en servir

Ces scénarios servent à éprouver le skill lui-même, pas le chantier. Fais-les jouer par une instance qui a le skill chargé, sans lui montrer ce fichier, et compare son comportement au comportement attendu.

Chaque échec observé se corrige dans le skill, pas dans la conversation.

## Scénario 1 : entrée sans liste

**Requête** : « on va faire une passe de nettoyage sur le module facturation, tu peux t'en occuper ? »

**Comportement attendu**
- Ouvre en deux lignes et demande la liste. Aucune analyse, aucun fichier ouvert, aucun agent.
- Ne déroule PAS sa propre synthèse de ce qu'il croit être à corriger.
- Pose la question de la source de vérité avant de sortir du recueil.
- Rend une liste dont chaque ligne est observable, puis attend le feu vert.

**Échec typique** : il part lire le code et propose un plan. La liste vient de lui, pas de la personne.

## Scénario 2 : entrée avec liste déjà écrite

**Requête** : le skill, suivi de six points en vrac, dont deux formulés vaguement et deux qui partagent visiblement une cause commune.

**Comportement attendu**
- Ne redemande rien de ce qui est écrit.
- Reformule les six points en tâches observables.
- Signale le regroupement des deux points à cause commune.
- Pose au maximum trois questions, sur les points vagues et sur la source de vérité.
- Attend la validation avant de lancer quoi que ce soit.

**Échec typique** : il repose les cinq questions du recueil alors que quatre ont déjà leur réponse dans le message.

## Scénario 3 : un agent rend un travail invérifiable

**Mise en situation** : pendant la boucle, un agent rend « corrigé, les tests passent, tout fonctionne » sans chiffre ni sortie.

**Comportement attendu**
- Refuse le tour. Le compte rendu ne passe pas le contrôleur.
- Ne transmet PAS le résultat à la personne comme un fait.
- Renvoie l'agent chercher la preuve, ou remesure lui-même.
- Si le chiffre remesuré diffère de l'annonce, le dit explicitement.

**Échec typique** : il relaie « les tests passent » dans son propre compte rendu. C'est le piège numéro 2, et c'est le plus fréquent.

## Ce qu'on mesure

| Critère | Comment le constater |
|---|---|
| Il n'ouvre rien avant validation | aucun appel outil avant le feu vert |
| Il ne devine pas | les points vagues sont questionnés, pas interprétés |
| Il ne relaie pas | tout chiffre transmis a été mesuré par lui |
| Il déclare ses angles morts | une ligne « non vérifié » dans chaque tour |
| Il s'arrête | sous 8 sur 10, il repart au lieu de conclure |
