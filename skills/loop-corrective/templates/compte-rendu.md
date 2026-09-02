# Gabarit de compte rendu de tour

Un tour se rend dans ce format. Passe-le au vérificateur avant de le déclarer terminé :

```bash
python3 scripts/verifie_tour.py compte-rendu.md
```

---

```
--- Équipe <nom de l'équipe ou de la tâche> ---

Plan        : <la correction visée, en une phrase>

Action      : <ce qui a été fait, sans enrobage>

Résultat    : <la sortie réelle, chiffrée>
              AVANT : <valeur mesurée>
              APRÈS : <valeur mesurée>
              Preuve : <commande relancée, capture, requête>

Non vérifié : <ce que personne n'a pu observer, et pourquoi>
              (« aucun » est une réponse valable, mais elle doit être écrite)

Diagnostic  : <note>/10
              Points manquants : <numéros du barème et raison>
```

---

## Exemple accepté

```
--- Équipe rapprochement ---

Plan        : le montant restant dû doit refléter les paiements réellement encaissés

Action      : rapprochement par cumul au lieu d'une égalité au centime, et unification
              des deux fonctions qui calculaient le même nombre séparément

Résultat    : AVANT : 24 842 dans le tableau, 15 500 sur la carte
              APRÈS : 12 815 dans les deux vues
              Preuve : deux requêtes relancées par le superviseur, sorties identiques
              Clientes sans aucun paiement rapproché : 19 avant, 9 après

Non vérifié : le chemin depuis le navigateur, la session administrateur n'étant pas
              disponible en local. La fonction serveur a été appelée avec les mêmes
              arguments que ceux envoyés par l'interface.

Diagnostic  : 9/10
              Point 2 partiel : le superviseur a remesuré les totaux mais pas le clic réel
```

## Exemple refusé

```
Plan     : corriger le calcul
Action   : corrigé
Résultat : ça marche maintenant, les tests passent
```

Trois défauts : aucun chiffre, aucune preuve relancée, aucune ligne « non vérifié ». Le vérificateur le rejette, et il a raison : rien là-dedans ne distingue un travail fait d'un travail raconté.
