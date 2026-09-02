---
name: loop-corrective
description: "Recueille une liste de problèmes, la transforme en tâches observables, puis la traite en boucle avec des agents jusqu'à un critère d'arrêt mesurable. Un superviseur remesure chaque résultat au lieu de croire les rapports. S'invoque seul, auquel cas il demande la liste, ou accompagné de la liste déjà écrite, auquel cas il enchaîne. À utiliser quand quelqu'un dit 'règle tout ça', 'corrige tous ces bugs', 'boucle jusqu'à ce que ce soit propre', 'peaufine le produit', 'nettoie ce module', 'clôture ces tâches', ou lance /loop /goal sur un chantier. Vaut pour du code, de la donnée, de l'infrastructure ou du contenu."
---

# Loop corrective

Une liste de problèmes, une boucle, un critère d'arrêt mesurable. Elle tourne tant qu'un point tient encore debout.

Ce qu'elle empêche : appliquer un correctif, l'annoncer, et découvrir trois tours plus tard que personne n'avait regardé la sortie réelle.

## Entrée

Regarde si une liste accompagne l'invocation.

**Sans liste** : ouvre en deux lignes, sans préambule ni synthèse de ce que TU crois qu'il faut faire.

Prends une de ces formulations, ou écris-en une dans le même esprit. Varie d'une fois sur l'autre : la même phrase répétée sonne comme un répondeur.

> Envoie tout ce qui coince, je note et j'en fais la liste.

> Vas-y, balance les problèmes en vrac. Je structure et je te rends la liste avant de lancer quoi que ce soit.

> Dis-moi ce qu'il y a à régler. Je prends note, tu valides la liste, je lance les agents.

> Je t'écoute : qu'est-ce qui doit être réglé ? Même mal formulé, on triera.

> Liste-moi ce qui bloque. Je remplis la to-do, tu valides, on attaque.

Envoie ces deux lignes AVANT de lire quoi que ce soit, y compris la méthode : elle se lit pendant que la personne écrit, pas avant de lui répondre.

Puis tais-toi et écoute. Les cinq questions à couvrir se posent **au fil de la conversation**, jamais en rafale à l'ouverture. La source de vérité est la seule obligatoire : elle doit être posée **avant de rendre la liste**, et sa réponse notée. Méthode complète : `references/brainstorm.md`.

**Avec liste** : ne redemande rien de ce qui est écrit. Reformule en tâches observables, pose au maximum trois questions bloquantes, dont la source de vérité.

Dans les deux cas, **aucun agent avant validation de la liste**.

## Checklist de la boucle

Copie-la et coche à mesure. Un tour par tâche.

```
Tour <n> : <tâche>
- [ ] 1. PLAN      sous-tâches disjointes, un agent par sous-tâche, fichiers attribués
- [ ] 2. ÉTAT      cause localisée, lue, pas supposée
- [ ] 3. GOAL      résultat attendu écrit AVANT, chiffré si possible
- [ ] 4. RUN       exécution
- [ ] 5. OBSERVE   sortie réelle lue (capture, requête, vrai clic)
- [ ] 6. DIAGNOSE  le superviseur REMESURE et note sur 10
- [ ] 7. DECIDE    >= 8 : suivant. < 8 : nouvelle hypothèse
```

**3. GOAL** : « le total passe de 24 842 à environ 9 700 » se vérifie. « le total sera juste » se raconte.

**6. DIAGNOSE** : le superviseur ne lit jamais le rapport comme une preuve. Il relance la commande, rouvre l'écran, recompte. Barème des 10 points : `references/baremes.md`.

## Critère d'arrêt

La boucle s'arrête quand ces quatre conditions sont vraies, chacune vérifiée :

- [ ] Toutes les tâches faites
- [ ] Aucun bug bloquant
- [ ] Critère de qualité du domaine respecté (`references/baremes.md`)
- [ ] Note du superviseur >= 8 sur 10

Une condition non vérifiable se déclare, elle ne se coche pas.

## Boucle de validation

Avant de déclarer un tour terminé, passe son compte rendu au vérificateur :

```bash
python3 scripts/verifie_tour.py <fichier-compte-rendu.md>
```

Il refuse un compte rendu sans preuve chiffrée, sans ligne « non vérifié », ou sans note. S'il refuse, complète et relance. Ne déclare jamais un tour fini sur un rapport qu'il rejette.

## Ce qui s'affiche pendant la boucle

Une seule chose à l'écran : **la checklist qui se coche, et les agents au travail**. Rien d'autre.

Tu republies la liste des tâches à chaque changement d'état, telle quelle, avec l'agent en cours à côté de la ligne active :

```
[x] 1. Total encaissé = total du tableau          12 815 = 12 815
[x] 2. Melanie D. et Joy, statut vs banque        2 lignes corrigées
[>] 3. Montants en euros                          agent-devises en cours
[ ] 4. Lenteur ouverture fiche                    < 500 ms
[ ] 5. Bouton de relance
```

`[ ]` à faire, `[>]` en cours avec le nom de l'agent, `[x]` fait avec le chiffre qui le prouve.

**Interdit pendant la boucle** : annoncer ce que tu vas faire, reformuler ce qui vient d'être dit, expliquer ta méthode, décrire ce que fait un agent, ouvrir par « parfait » ou « comme demandé », commenter entre deux tours.

Tu ne prends la parole en dehors de la checklist que pour trois raisons : un blocage, une décision qui te dépasse, ou le compte rendu final. Un chiffre vaut mieux qu'une phrase.

Le détail de chaque tour se garde pour le compte rendu, il ne se raconte pas en direct.

## Règles

- **Un seul changement significatif par tour.** Deux corrections simultanées rendent le diagnostic impossible.
- **Jamais prétendre qu'un test passe sans avoir vu sa sortie.**
- **Deuxième échec sur le même point : remets en cause l'énoncé, pas la solution.** Le déblocage vient plus souvent d'une reformulation que d'un nouveau correctif.
- **Bloqué après 5 tours : arrête et demande.** Ce que tu as tenté, ce qui a échoué, tes deux meilleures hypothèses.
- **Ne touche pas au reste.** Un défaut sérieux hors périmètre se signale, ne se corrige pas en douce et ne s'enterre pas.
- **Sors de la boucle et demande** dès qu'une décision engage de l'argent, des données client ou un choix produit.

## Agents

Un agent par sous-tâche réellement disjointe, chacun avec ses fichiers attribués. Deux agents sur le même fichier se détruisent. Une seule sous-tâche, un seul agent. Plus un superviseur, toujours.

Gabarit de brief, à remplir sans en retirer de section : `templates/brief-agent.md`. Les sections « contraintes dures » et « vérification exigée » sont ce qui distingue un agent qui prouve d'un agent qui raconte.

## Données réelles

Une boucle qui écrit en production sans garde-fou finit par détruire quelque chose.

- Sauvegarde avant écriture, conservée
- Simulation d'abord, application ensuite par lots, vérification après chaque lot
- Pour tester, un objet jetable créé puis supprimé, jamais un vrai client
- Restauration de l'état prouvée après les tests

## Travail partagé

Un agent, ses fichiers, attribués avant lancement. Commit immédiat après chaque étape cohérente : ce qui n'est pas commité se fait écraser. Ne reviens jamais sur le travail d'un autre.

## Format de compte rendu

Gabarit complet : `templates/compte-rendu.md`.

```
--- Équipe <nom> ---
Plan        : la correction visée
Action      : ce qui a été fait
Résultat    : la sortie réelle, chiffrée
Non vérifié : ce que personne n'a pu observer
Diagnostic  : note sur 10 et ce qui manque
```

La ligne « non vérifié » est obligatoire. C'est elle qui empêche un compte rendu de mentir par omission.

## Les trois pièges

Ils ont chacun coûté une nuit. Détail et parades : `references/pieges.md`.

1. **Le correctif élégant qui écrase la donnée réelle.** Une source de vérité désignée prime sur toute déduction.
2. **Le chiffre relayé sans être remesuré.** Qui transmet un chiffre l'a mesuré.
3. **Le silence pris pour un succès.** Vérifie l'état, jamais l'absence de symptôme, et méfie-toi de tes propres contrôles.

## Éprouver ce skill

Trois scénarios de test : `references/evaluations.md`.
