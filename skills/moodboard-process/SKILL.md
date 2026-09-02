---
name: moodboard-process
description: Process complet A→Z de création d'une direction visuelle + mood board Vercel pour un client ou un produit, méthode validée sur Brvndlab. Utiliser ce skill DÈS que Jonathan veut créer une DA, une charte graphique, un mood board, des mockups pour un nouveau client, un nouveau logo, une nouvelle identité visuelle, ou refaire la direction visuelle d'un produit existant. Déclenche aussi sur "nouveau client", "sa DA", "sa charte", "mood board", "direction visuelle", "identité visuelle", "comme on a fait pour Brvndlab", "même process que le moodboard". Couvre tout : brainstorm territoire, références, palette, typo, langage visuel, imagerie, composants, logo, production des mockups 3 variantes sombre+clair, tribunal de cohérence, et livrable Vercel unique à onglets.
---

# Mood Board Process — de la page blanche au livrable Vercel

Méthode complète validée sur Brvndlab (juin 2026) : partir d'un client avec (ou sans) logo, couleurs, charte — et arriver à un mood board Vercel vivant qui contient la DA scellée + tous les mockups validés. Le process a 5 phases, dans l'ordre. On ne saute jamais une phase.

**Pourquoi cet ordre :** chaque phase produit les contraintes de la suivante. Le territoire contraint la palette, la palette contraint les composants, la DA scellée contraint les mockups. Travailler dans le désordre = itérations infinies et dérive visuelle.

## Vue d'ensemble

```
Phase 0  Cadrage           → filtre permanent (produit, ICP, promesse)
Phase 1  Direction visuelle → 8 étapes abstrait→concret, scellées une par une
Phase 2  DA scellée         → tokens.css + guardrail non négociable
Phase 3  Mockups            → section par section, 3 variantes, sombre+clair
Phase 4  Livrable Vercel    → UN projet, onglets, coherence-check, zéro brouillon
Phase 5  Après validation   → validé = fait, illustrations en lot, implémentation silencieuse
```

## Phase 0 — Cadrage (le filtre permanent)

Avant tout choix visuel, établir avec le client un filtre en 3 lignes qui sera appliqué à CHAQUE décision des phases suivantes :

1. **Produit** : qu'est-ce que c'est, en une phrase concrète (pas de pitch marketing).
2. **ICP** : qui l'utilise au quotidien. Le niveau de sophistication visuelle doit parler à CETTE audience (ex. Brvndlab : premium "première classe", épuré, boomer-friendly, pas gamin).
3. **Promesse émotionnelle** : ce que l'utilisateur doit ressentir en ouvrant le produit.

**Inventaire de l'existant** : logo actuel, couleurs actuelles, sites/produits déjà en ligne, préférences déjà exprimées. Règle Brvndlab qui a tout changé : **rien n'est sacré par défaut** — l'orange "historique" du logo a fini abandonné parce que la couleur doit découler du territoire, pas de l'héritage. Demander explicitement au client ce qui est négociable et ce qui ne l'est pas.

## Phase 1 — Direction visuelle : les 8 étapes

Lire `references/direction-visuelle-8-etapes.md` pour le détail de chaque étape (questions à poser, format des livrables, exemples Brvndlab).

L'ordre est abstrait → concret :

1. **Intention / territoire** — mots-clés ressenti, personne incarnée, triade de marques, promesse dominante
2. **Références visuelles** — 2 directions comparées en versus (A vs B), décision explicite
3. **Palette de couleurs** — découle du territoire ; oser le radical (monochrome strict, etc.)
4. **Typographie** — titre + texte + accent données
5. **Langage visuel** — arrondis, ombres, espacements, règles de boutons
6. **Imagerie & iconographie** — ADN illustration + carte des placements (génération EN LOT à la fin, jamais au fil de l'eau)
7. **Composants UI clés** — bouton, carte, champ, badge, pill
8. **Logo & marques** — variantes + favicon (souvent : garder le mark, changer le traitement)

**Règles transverses non négociables :**
- **Une étape à la fois.** On ne passe à la suivante qu'une fois l'étape VALIDÉE explicitement par le client. Pas de validation = on reste.
- **Chaque proposition = un visuel.** Le client ne se projette pas sur du texte. Palette → nuancier HTML. Typo → spécimen HTML. Langage visuel → mini-mockup login+accueil. Jamais "tu valides cette direction ?" sans visuel à côté.
- **Décision scellée = scellée.** On note la décision avec sa date et son pourquoi, et on ne la rouvre JAMAIS sauf demande explicite du client. C'est ce qui permet d'avancer vite ensuite.
- **Passer chaque choix au filtre Phase 0.** "Est-ce que ça parle à l'ICP ?" tue 80% des mauvaises idées.

## Phase 2 — Sceller la DA (le guardrail)

Une fois les 8 étapes validées, la DA devient un **guardrail non négociable** :

1. **Créer `screens/tokens.css`** — LA source de vérité unique : couleurs (sombre + clair), radius ladder, typo. Tous les mockups l'importent. Template dans `assets/tokens-template.css`.
2. **Rédiger le bloc "DA scellée"** — un résumé d'une page : typo exacte, hex exacts, règles de langage (ex. "un seul bouton plein par écran"), traitement logo. Ce bloc se colle en tête de chaque brief de mockup.
3. **Règle des exemples externes** : quand le client partage une inspiration trouvée sur Internet, c'est pour la **structure/fonction/layout SEULEMENT**. Jamais reprendre la typo, les couleurs ou les codes de l'exemple. C'est LA dérive n°1 observée sur Brvndlab — tenir la ligne.

## Phase 3 — Production des mockups, section par section

Lire `references/production-mockups.md` pour les règles complètes (variantes, mobile, tribunal, shell).

Le flow par section, toujours le même :

1. **Inventaire d'abord** — ne JAMAIS partir d'une feuille blanche. Montrer ce qui existe (ancien écran, mockup précédent, page live). Poser 3 questions : qu'est-ce qui marche ? qu'est-ce qui manque ? où on va ? Évolution > révolution.
2. **Brainstorm court → mockup direct** — le brainstorm peut être texte, la conclusion est TOUJOURS un mockup HTML livré avec lien cliquable. Ajustements en mots = client qui perd patience.
3. **3 variantes par section** (jamais une seule), chacune en **sombre + clair**.
4. **Shell officiel scellé** — dès qu'un shell app (sidebar/nav) est validé, tous les écrans suivants l'utilisent tel quel. Ne jamais rebricoler la nav écran par écran.
5. **Le client choisit** — présenter les variantes côte à côte avec l'URL en tête de message, poser UNE question.
6. **Audit tribunal pour les écrans structurants** — 4-5 agents en parallèle avec des angles différents (cohérence, contraste/WCAG, redondance, maturité) + 1 juge qui synthétise. Réservé aux écrans canoniques (home, shell, overview), pas à chaque petit écran.

## Phase 4 — Livrable Vercel (le mood board vivant)

Lire `references/livrable-vercel.md` pour la structure du projet, l'index à onglets et le script de cohérence.

Les règles système :

- **UN SEUL projet Vercel** pour tout le client, URL prod stable. Jamais un projet par mockup (leçon Brvndlab : 44 projets créés puis supprimés). Itérer = éditer les fichiers du même projet et redéployer.
- **Structure** : `index.html` (onglets par section, iframes) + `screens/*.html` (un fichier par écran) + `screens/tokens.css` + `scripts/coherence-check.sh`.
- **Gate avant chaque deploy** : `bash scripts/coherence-check.sh` — échoue si un écran dérive des tokens (hex interdits, valeurs divergentes). Template dans `assets/coherence-check-template.sh`.
- **Zéro brouillon** : une fois une variante validée, SUPPRIMER les variantes A/B/C non retenues (retirer de l'index + rm le fichier). Le mood board ne contient QUE du définitif. Les propositions sont éphémères, le temps du choix.
- **Chaque validation = intégration immédiate** : mockup validé → screens/ + onglet + coherence-check + `vercel --prod --yes` + vérifier HTTP 200. Sans redemander.
- **Lien cliquable en tête** de chaque message qui présente un visuel, avant toute question.

## Phase 5 — Après validation

- **Validé = fait.** Un mockup validé sort des TODO du client. La conversion en code réel se gère silencieusement.
- **Illustrations en lot** : générer toutes les illustrations d'un coup à la fin (mêmes verrous de style dans chaque prompt), jamais au fil de l'eau — sinon dérive stylistique.
- Si un doc de suivi existe (Carte MVP, doc stack), le mettre à jour à chaque écran validé, sans redemander.

## Règles de copy dans les mockups

S'appliquent à tout texte visible dans les mockups, quel que soit le client :
- Jamais d'em-dash. Accents français corrects partout.
- Libellés d'action courts ("Affiner", pas "Affiner cette section").
- Zéro redondance : aucune info répétée deux fois sur un écran.
- Less is more : maximum une phrase entre un titre et son bouton.
- Zéro phrase de coaching/encouragement dans les UI ("tu progresses bien" = interdit).
- Ton adapté à l'ICP du client (B2B dirigeants = vouvoiement mature type Linear/Notion).

## Anti-patterns (vécus sur Brvndlab, à ne pas reproduire)

| Anti-pattern | À la place |
|---|---|
| Un projet Vercel par mockup | Un seul projet, redéployé |
| Copier la typo/couleur d'une inspiration client | Structure seulement, DA scellée intacte |
| Brainstormer from scratch une section qui existe | Inventaire d'abord, évolution > révolution |
| Proposer une seule variante | Toujours 3 |
| Livrer le sombre, "le clair viendra après" | Les deux d'un coup |
| Mode clair = inversion mécanique du sombre | Palette clair pensée (crème mature, pas un negative) |
| Valider une direction par texte | Toujours un visuel HTML |
| Garder les variantes rejetées dans le moodboard | Zéro brouillon, supprimer |
| Rebricoler la sidebar à chaque écran | Shell officiel scellé, réutilisé tel quel |
| Générer les illustrations au fil de l'eau | Carte des placements, génération en lot à la fin |