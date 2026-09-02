---
name: correction-saas
description: La méthode de Jonathan pour passer un SaaS au peigne fin et corriger tous ses défauts, section par section. Il parcourt son produit en vocal, signale ce qui cloche (visuel, interaction, état vide, chargement, logique, incohérence), et chaque point devient une correction codée, déployée en prod, puis vérifiée sur le live avant d'être cochée. À utiliser DÈS qu'une session enchaîne des retours produit sur Brvndlab, VividFlow ou tout autre app. Contient la boucle corrective : liste de tâches observables, agents sur fichiers disjoints, superviseur qui remesure, critère d'arrêt chiffré. Déclenche sur "règle-moi ça", "corrige ça", "règle tout ça", "boucle jusqu'à ce que ce soit propre", "j'aime pas", "il faut que", "c'est pas beau", "session design", "on passe section par section", "audite-moi", /loop, /goal, ou toute suite de retours qui décrivent des défauts à réparer. C'est le mode de travail par défaut de Jonathan sur son produit.
---

# Correction SaaS

Le travail : **rendre un produit irréprochable, défaut par défaut**. Jonathan parcourt son SaaS, signale ce qui cloche, et chaque point devient une correction réelle, déployée, vérifiée. On ne construit pas de la feature ici : on **répare, on harmonise, on finit**.

Un point signalé n'est pas une suggestion. C'est un défaut à faire disparaître, avec la preuve qu'il a disparu.

## Le mouvement, pour chaque point

1. **Comprendre le vrai défaut.** Un vocal décrit un symptôme (« c'est moche », « ça bouge pas »). Le travail commence par trouver la cause dans le code réel : le fichier, la ligne, la règle CSS qui gagne. Jamais de supposition sur un fichier qu'on n'a pas ouvert.
2. **Corriger au plus court**, dans les conventions du fichier et la charte du produit. Avant d'inventer un composant, chercher s'il existe déjà et le réutiliser.
3. **Compiler et déployer jusqu'en prod.** Un correctif qui vit sur le disque n'existe pas.
4. **Vérifier sur le live, soi-même.** Pas le rapport d'un agent, pas « ça devrait marcher ».
5. **Rendre compte** : ce qui est fait, et surtout **où Jonathan doit regarder** pour le constater.

## Travailler pendant que Jonathan parle

C'est le cœur de la méthode : **Jonathan continue de parler pendant qu'on corrige**. Les vocaux arrivent en rafale, souvent au milieu d'une correction en cours. On ne s'arrête jamais pour accuser réception.

Ce qui se passe à chaque nouveau point qui tombe :

- On l'**ajoute à la todo** immédiatement, sans interrompre le travail en cours.
- On **finit le point en cours**, on le déploie, on le vérifie.
- On **annonce ce qui est fini** au fil de l'eau, dès que c'est prouvé. Jamais un seul gros compte rendu à la fin de tout.
- On **enchaîne** sur le point suivant de la liste.

Rien ne se perd, rien n'attend, et Jonathan voit avancer la liste pendant qu'il continue de parcourir son produit. C'est ça, être proactif ici : la todo vit en permanence, les livraisons tombent par paquets, et lui n'a jamais à répéter un point ni à demander où on en est.

Quand un point tombe pendant qu'un travail lourd tourne (agents, compilation, déploiement), on le prend quand même : on l'écrit dans la liste, et on l'attaque dès que la machine se libère.

La checklist se republie à chaque livraison :

```
- [x] point livré (une ligne : ce qui a changé)
- [>] point en cours
- [ ] point identifié, pas encore traité
```

C'est le contrat visible : Jonathan sait toujours ce qui est acquis et ce qui reste. Aucun point signalé ne doit se perdre entre deux vocaux.

## Le compte rendu

Court, structuré, orienté vérification :

```
✅ C'est fait et déployé. Tu peux vérifier.

**Checklist** (les points livrés)

**À vérifier :** où aller, quoi regarder.
```

Pas de récit du chemin parcouru, pas de « parfait ! », pas de reformulation de ce que Jonathan vient de dire. Ce qu'il veut savoir : c'est réparé, où je le constate.

Quand un point avait une **cause non évidente**, la dire en une phrase : elle apprend quelque chose sur le produit (« il y avait deux règles CSS concurrentes, l'ancienne gagnait »).

## Vérifier pour de vrai

Le déploiement n'est pas la preuve. La preuve, c'est le rendu.

- **Mesurer ce qu'on affirme** : couleur calculée, position en pixels, présence d'un élément dans le DOM. « C'est à droite » se prouve avec un `getBoundingClientRect()`, pas avec une intention.
- **Brvndlab** : navigateur Playwright isolé + compte robot `audit.robot+brvndlab@vividflow.co`, sign-in token Clerk consommé par programme (`window.Clerk.client.signIn.create({strategy:"ticket", ticket})`). Voir la mémoire `reference-e2e-robot-brvndlab`. Jamais le profil Playwright partagé : il porte les sessions de Jonathan.
- Toute écriture de test sur une prod partagée est **nettoyée immédiatement**.
- **« Je ne vois pas le changement »** : c'est presque toujours une règle concurrente qui gagne, un cache, ou une correction qui visait le mauvais élément. On cherche la cause, on ne réexplique pas.

## Écouter juste

- Un vocal mélange souvent plusieurs demandes, et parfois se corrige en route (« j'ai fait une erreur, je rectifie »). **La dernière version dite gagne**, et on la reformule en une ligne pour vérifier qu'on a compris pareil.
- Un vocal coupé : demander la fin en UNE phrase. Ne jamais deviner.
- Quand Jonathan laisse la main (« je te laisse trancher », « dis-moi ce qui fait le plus de sens »), on **tranche** et on dit pourquoi en une phrase. On ne lui renvoie pas la question.
- Quand une demande se heurte à une limite réelle (quota d'API, donnée inexistante, contrainte de plateforme), on le **dit dans le compte rendu**, chiffré, avec ce qu'on a fait à la place. Jamais de bluff, jamais de fausse donnée pour faire joli.

## La boucle corrective (quand la liste est longue)

Dès qu'un lot dépasse quelques points, ou quand Jonathan dit « règle tout ça »,
« boucle jusqu'à ce que ce soit propre », `/loop`, `/goal` : on ne traite plus au
fil de l'eau, on **boucle**. Une tâche, un tour, une preuve.

```
Tour <n> : <tâche>
- [ ] 1. PLAN      sous-tâches disjointes, un agent par sous-tâche, fichiers attribués
- [ ] 2. ÉTAT      cause localisée, LUE dans le code, jamais supposée
- [ ] 3. GOAL      résultat attendu écrit AVANT, chiffré si possible
- [ ] 4. RUN       exécution
- [ ] 5. OBSERVE   sortie réelle lue (build, rendu, vrai clic)
- [ ] 6. DIAGNOSE  le superviseur REMESURE et note sur 10
- [ ] 7. DECIDE    >= 8 : suivant. < 8 : nouvelle hypothèse
```

**GOAL** doit être vérifiable (« le compteur est à 1376px comme le bouton voisin »),
pas racontable (« ce sera bien aligné »).

**DIAGNOSE** est la règle qui tient tout : le superviseur ne lit jamais le rapport
d'un agent comme une preuve. Il relance la commande, rouvre l'écran, remesure
lui-même. Qui transmet un chiffre l'a mesuré.

### Les agents

- **Un agent par sous-tâche réellement disjointe**, avec ses fichiers attribués.
  **Deux agents sur le même fichier se détruisent** : on découpe par fichier
  partagé, pas seulement par thème.
- Sur un gros balayage : un agent d'**inventaire** d'abord (il ne modifie rien),
  puis les agents de **conversion**, puis le superviseur qui remesure.
- Brief d'agent avec deux sections obligatoires : **contraintes dures** et
  **vérification exigée**. C'est ce qui distingue un agent qui prouve d'un agent
  qui raconte.
- Chaque agent rend : Plan / Action / Résultat (sortie réelle) / **Non vérifié**
  (obligatoire) / Diagnostic.
- **Piège vécu** : un agent qui lance un `git stash` ou un `checkout` sur le repo
  partagé écrase le travail des autres. Interdire ces gestes dans le brief, et
  vérifier l'état des fichiers avant de committer.
- Un `tsc` par agent sature la machine : quand plusieurs tournent, on les tue et
  **un seul tsc de superviseur fait foi**.

### Critère d'arrêt (chacun vérifié)

- [ ] Toutes les tâches faites
- [ ] Aucun défaut introduit ailleurs
- [ ] Le rendu réel constaté, pas seulement le build
- [ ] Note du superviseur >= 8 sur 10

### Les trois pièges

1. **Le correctif élégant qui écrase la donnée réelle.** La source de vérité
   désignée prime sur toute déduction.
2. **Le chiffre relayé sans être remesuré.**
3. **Le silence pris pour un succès.** On vérifie l'état réel, jamais l'absence
   de symptôme.

### Les garde-fous de boucle

- **Un seul changement significatif par tour**, sinon le diagnostic est impossible.
- **Deuxième échec sur le même point : remettre en cause l'énoncé**, pas la solution.
- **Bloqué après 5 tours : arrêter et demander**, en disant ce qui a été tenté, ce
  qui a échoué, et les deux meilleures hypothèses.
- Pendant la boucle, on n'annonce pas ce qu'on va faire : on publie la liste qui
  se coche, `[ ]` à faire, `[>]` en cours, `[x]` fait avec le chiffre qui le prouve.

## Harmoniser, pas seulement réparer

Un défaut signalé à un endroit vit souvent à dix autres. Quand un point révèle un motif (une modale, un fond, un en-tête, une couleur), la bonne correction est **le composant partagé**, pas le rustine locale.

Le réflexe : corriger le point, puis chercher qui d'autre porte le même défaut, le signaler, et proposer la passe d'harmonisation. Sur un gros balayage, un agent d'inventaire d'abord, des agents de conversion ensuite sur des **fichiers disjoints** (deux agents sur un même fichier se détruisent), et un superviseur qui **remesure** au lieu de croire les rapports.

## Déployer

- Repo canonique Brvndlab : `~/dev/brvndlab-claude/brvndlab-app`. Jamais la copie iCloud.
- Ordre : `npx tsc --noEmit` → `npx convex deploy -y` (si le backend a bougé) → commit → push → `npx vercel --prod --yes` depuis `~/dev/brvndlab-claude`.
- Le push est régulièrement rejeté : Thomas travaille sur le même `main`. On `git pull --rebase`, on repousse. Jamais de force, jamais d'écrasement de son travail.
- Un deploy qui échoue sur une erreur réseau se **relance**, il ne se raconte pas.

## Les règles dures

- **Ne jamais dire fait sans avoir vu.** Un `tsc` vert n'est pas un rendu vérifié.
- **Ne rien inventer** : ni feature, ni chiffre, ni donnée. Si une donnée n'existe pas, l'écran le dit honnêtement.
- **Périmètre strict** : on corrige ce qui est demandé. Un défaut sérieux hors sujet se **signale** dans le compte rendu, il ne se corrige pas en douce.
- **Rien d'irréversible sans go explicite** : suppression de données, mutation sur une prod partagée, écrasement du travail d'un tiers.
- **Une décision scellée ne se rejoue pas.** Les choix déjà validés (DA, composants, couleurs, structures) sont en mémoire : on les respecte à la lettre.

## Le style

Français de France. Pas d'em-dash, jamais. Pas de mots-béquilles. Phrases courtes, ton mature, zéro jargon salesy.

## Le réflexe en une phrase

Trouve la vraie cause dans le vrai code, répare au plus court, déploie jusqu'en prod, va constater de tes yeux, puis dis ce qui est réparé et où le vérifier. Quand la liste est longue, boucle : un tour, une tâche, une preuve remesurée.
