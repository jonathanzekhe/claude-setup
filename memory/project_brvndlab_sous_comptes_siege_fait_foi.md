---
name: project_brvndlab_sous_comptes_siege_fait_foi
description: Sous-comptes Brvndlab — un siège collaborators accepté fait foi ; la trappe ownContent est supprimée (19/08). Pièges de diagnostic associés.
metadata:
  type: project
---

Sur Brvndlab, la résolution du compte de travail d'un sous-compte passe par `resolveEffectiveContext` (convex/collaborators.ts). **Un siège `collaborators` accepté fait foi, point.**

## Ce qui a été retiré (19/08/2026)

Il y avait une trappe en fin de fonction : « si l'user a déjà ses propres `contentItems`, il redevient owner de lui-même ». Elle datait d'avant les sous-comptes. Effet : à la PREMIÈRE ligne `contentItems` écrite sous son propre clerkUserId, un sous-compte basculait sur SON espace vide. Conséquences simultanées et **sans aucune erreur visible** :
- Brand OS, Inspiration, Pipeline, Calendrier, to do list se vidaient d'un coup
- ses écritures partaient dans une partition privée invisible de l'owner
- `requireProprietaire` (team.ts) le laissait créer ses propres sous-comptes

**Why:** deux vérités sur « qui suis-je » = panne silencieuse. Rush y échappait uniquement parce qu'il relit la ligne `collaborators` à chaque appel au lieu de faire confiance au scalaire renvoyé par `resolveOwnerClerkUserId`.

## Pièges de diagnostic vérifiés en prod

1. **Un déploiement Convex cassé ne dit rien côté app.** Des `api.xxx` pointant des `internalAction` font échouer `npx convex deploy`, donc plus RIEN de neuf n'est en ligne alors que GitHub et Vercel sont à jour. Toujours lancer `npx convex deploy` et lire la sortie avant de conclure quoi que ce soit.
2. **Un champ hors schema bloque tout push.** Une ligne prod portant un champ absent du validateur fait échouer la validation de schema pour l'ensemble du déploiement. Message : « Object contains extra field ». Nettoyer la donnée (ou rajouter le champ en optional temporairement, migrer, puis retirer).
3. **Vérifier QUI est l'owner avant d'accuser le code.** Un sous-compte de test peut avoir été créé depuis le compte de Thomas et non celui de Jonathan : il montre alors les données de Thomas, ce qui est CORRECT. Lire `collaborators.ownerClerkUserId` puis résoudre l'email avant de conclure.

**How to apply:** toute query/mutation scopée doit passer par `resolveOwnerClerkUserId` / `requireWriteAccess`. Ne jamais réintroduire de condition qui fait dépendre l'identité du contenu possédé. Voir [[feedback_toujours_verifier_le_live_avec_un_agent]] et [[feedback_never_overwrite_thomas_work]].

## Gate serveur des modules (19/08/2026)

`myAccessScope` renvoyait l'allocation de l'OWNER. Le middleware (`src/proxy.ts`) laissait donc un sous-compte atteindre n'importe quel module de son createur en tapant l'URL a la main : seul `useRouteGuard` (client) le restreignait.

`computeEffectiveAllowedModules` (convex/collaborators.ts) intersecte maintenant **allocation du compte ∩ modules accordes au siege**. Points a connaitre :
- `customAllowedPages` existe en DEUX formats en base : cles de modules (`pipeline`, `brand-os`) ecrites par l'ecran Equipe, et anciens libelles (`Brand OS`, `Dashboard`). Les deux sont lus.
- Une fiche SANS personnalisation retombe sur le defaut de son role (`MODULES_PAR_ROLE`, miroir serveur de `COLLABORATOR_ALLOWED_ROUTES`).
- Un founder n'est jamais concerne : `resolveEffectiveContext` le rend `owner` avant d'arriver la.
- `/settings`, `/integrations`, `/home`, `/messaging` ne sont pas des modules allouables (`moduleKeyForPath` renvoie null) : jamais gates, donc aucun risque d'enfermer quelqu'un.

**Regle :** tout garde cote client doit avoir son miroir serveur. Un `useRouteGuard` seul est un confort d'affichage, pas un rempart.

## Temps reel compte principal <-> sous-comptes (19/08/2026)

Exigence Jonathan : **aucune latence**. Toute action d'un cote est vue immediatement de l'autre.

Convex est nativement temps reel (`useQuery` = souscription WebSocket, toute mutation re-pousse aux abonnes). Le risque n'est donc JAMAIS Convex, mais ce qui le court-circuite. Deux pieges trouves dans `ObjectivesBoard.tsx` :

1. **Debounce de 800 ms** avant l'ecriture en base. Supprime : l'ecriture part immediatement.
2. **Le pire** : l'hydratation ne se faisait qu'UNE fois par compte (`hydratedFor.current === currentOwner` -> return). Les versions suivantes arrivaient du serveur mais etaient ignorees. Le compte principal ne voyait donc jamais la coche de son sous-compte **sans recharger la page**. Un effet de synchronisation adopte desormais chaque version recue.

Garde-fous indispensables quand on rend un champ temps reel :
- ne pas re-appliquer l'echo de sa PROPRE ecriture (`dernierEnvoye`), sinon le curseur saute en pleine saisie ;
- mettre de cote une version distante pendant un glisser-depose ou une saisie (`document.activeElement` contentEditable/INPUT/TEXTAREA), puis la reprendre au blur via un compteur de reveil (`focusout` / `pointerup`) — sinon la frappe est perdue ;
- remettre le marqueur a zero au changement de compte.

**Regle generale :** chercher `setTimeout` autour des sauvegardes, et tout `useState` local hydrate une seule fois. C'est la que la latence se cache, pas dans Convex.

## Role vs modules : ce sont les MODULES qui tranchent (19/08/2026)

Piege majeur trouve en testant en navigateur reel. Le siege `jonathanzekhe.business` portait `collaboratorRole: "rush_member"` (heritage de l'ancien flux Rush, `convex/rush.ts` cree les sieges en `role: "viewer"` + `rush_member`), MAIS avait cinq modules accordes.

`resolveOwnerClerkUserId` renvoyait `null` pour `rush_member` -> tout module passant par ce helper lisait VIDE (Brand OS 0/9, Inspiration, Pipeline, Calendrier). Rush marchait car il a sa propre resolution (`resolveRushContext`).

Corrige par `estRushUniquement()` (convex/collaborators.ts) : la liste `customAllowedPages` fait foi quand elle existe ; le role ne sert de repli que si la liste est vide. Applique dans `resolveOwnerClerkUserId`, `requireWriteAccess`, `inspirations.list/getByIds`, `brandDna`.

**Regle :** ne jamais faire dependre un droit du seul libelle de role quand une liste de modules explicite existe. Les deux se contredisent tot ou tard.

## Suppression du compte Clerk au retrait (19/08/2026)

`team.retirerSousCompte` supprime desormais le compte Clerk, mais SEULEMENT si :
- plus aucun siege actif ailleurs (une personne peut travailler pour deux createurs) ;
- pas d'acces client a elle ;
- **pas super admin**.

Ce dernier point vient d'une simulation sur donnees reelles : sans lui, retirer le siege qu'un fondateur occupe chez un autre SUPPRIMAIT son propre compte. Les founders sont dans `FOUNDER_EMAILS` (superAdmins.ts), pas dans `clientAccess` — un test `getClientAccessByEmail` seul ne les voit pas.

## Verification en navigateur : la methode qui marche

Se connecter en prod sans mot de passe : `sign_in_tokens` via l'API Clerk (les `sessions` sont dev-only), puis dans la page `window.Clerk.client.signIn.create({strategy:'ticket', ticket})` + `setActive`. Sauvegarder `storageState` pour rejouer les sessions.

Mesures obtenues (deux sessions ouvertes, aucun rechargement) : propagation ~410-420 ms dans les deux sens.

**Toujours capturer les trames WebSocket** (`page.on('websocket')`) : elles disent si le serveur a pousse la donnee. Si elle arrive et que l'ecran ne bouge pas, le bug est cote React, pas cote Convex. C'est ainsi qu'a ete trouve le `cols` fige par la closure.

## Une table lue par PLUSIEURS modules factures (20/08/2026)

`contentItems` est lu par trois modules factures separement : Brainstorming (`content`), Pipeline (`pipeline`), Calendrier (`calendar`). Quand le cloisonnement des DONNEES a ete branche sur les modules du siege, le garde exigeait la seule cle `content` : un sous-compte a qui on donne Pipeline + Calendrier SANS Brainstorming faisait LEVER `contentItems.listByWeek` -> « Cette page rencontre un souci ».

Corrige par `assertAnyModuleAllowed` / `isAnyModuleAllowed` (convex/collaborators.ts) : autorise des qu'UN des modules cites est accorde.

**Regle :** avant de poser un data-gate, verifier QUELS modules ouvrent cette table. Un gate mono-cle sur une table partagee casse les ecrans voisins. Et un `assert*` LEVE (ecran en erreur) la ou un `is*` degrade a vide — choisir selon que l'ecran doit crasher ou s'afficher vide.

## Identite d'un sous-compte : jamais celle de son compte Clerk (20/08/2026)

Un compte Clerk cree depuis l'espace du proprietaire porte SON prenom et SA photo. La fiche `users` du sous-compte etant vide, l'affichage retombait dessus : « Bonjour Jonathan » et la photo de Jonathan sur l'ecran d'un monteur.

L'en-tete (`AppHeader.tsx`) et l'accueil (`home/page.tsx`) lisent desormais l'identite du SIEGE (`displayFirstName` / `displayLastName` via `getActiveContext`) et ne se rabattent JAMAIS sur `clerkUser` pour un sous-compte. Sans photo propre : initiales.

**Regle :** mieux vaut n'afficher aucun nom que celui de quelqu'un d'autre. L'ecran Equipe exige prenom+nom a la creation ; l'ancien flux Rush (`convex/rush.ts`) inserait des sieges SANS identite — c'est de la que viennent les fiches vides.

## L'identite d'un sous-compte lui appartient (20/08/2026, recadrage Jonathan)

**Erreur commise :** j'ai ecrit « Monteur / Vividflow » dans `displayFirstName` / `displayLastName` du siege de Jonathan pour « lui donner une identite ». C'etait une correction de DONNEES abusive : ce compte s'appelle Jonathan Zekhe, c'est son second compte. On ne renomme pas quelqu'un.

**Deux regles qui en decoulent :**

1. **Ordre de priorite : la fiche de la PERSONNE d'abord.** `me.firstName` (Reglages -> Profil), PUIS `displayFirstName` du siege en secours, PUIS Clerk. L'ordre inverse ecrasait ce que la personne venait de saisir : elle changeait son nom et rien ne bougeait a l'ecran.

2. **Le coupable de la photo empruntee n'est PAS Clerk.** Le compte Clerk d'un sous-compte est le SIEN, sa photo aussi. Le vrai coupable est `resolveAvatarUrl` (src/lib/avatar.ts) qui se rabat sur un CACHE d'avatar partage entre comptes (cookie/localStorage pose par le dernier compte affiche). Ne jamais l'appeler dans une branche sous-compte.

**Brand OS = la marque du PROPRIETAIRE.** `brand-os/personnalite/page.tsx` affichait l'identite du visiteur (`api.users.getMe`) : un monteur voyait son nom et sa photo au-dessus des reponses du createur, comme si c'etait sa personnalite. Utiliser `api.users.getAccountProfile` (le proprietaire), jamais `getMe`.

## La garantie : des tests derives des SOURCES (20/08/2026)

`tests/acces/` contient deux tests qui ne relisent aucune liste ecrite a la main : ils DERIVENT tout du code.

- `cloisonnementModules.test.ts` : lit les gardes reellement poses dans `convex/*.ts` (assert/isModuleAllowed, assert/isAnyModuleAllowed) + les requetes reellement appelees par chaque ecran de `src/app/(app)/*`, et croise. Pour chaque module facturable, simule un siege n'ayant QUE ce module et verifie qu'aucune requete de son ecran ne leve. A trouve 2 bugs latents en plus du calendrier : `/reseaux` cassait via `analytics.getDashboardAnalytics` (exigeait `tracking`) et `angles.list` (exigeait `content`).
- `identiteSousCompte.test.ts` : interdit `resolveAvatarUrl` dans une branche sous-compte, interdit que le nom du siege passe avant celui du profil, verifie que Brand OS n'utilise pas l'identite du visiteur, et que l'ecran Equipe exige toujours prenom+nom.

Branches dans `check.sh` (le filet de Thomas, lance avant chaque livraison). **Verifie par sabotage** : en reintroduisant le bug du calendrier, `check.sh` sort en code 1. C'est ca la garantie, pas une promesse.
