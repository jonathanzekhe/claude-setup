---
name: feedback_toujours_verifier_le_live_avec_un_agent
description: "Jonathan exige un vérificateur automatique qui relit le travail DEUX FOIS, y compris en production, avant toute annonce de livraison"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 40a072e9-246c-4d6a-bd30-8dcfbed7bd3f
  modified: 2026-08-06T04:46:30.733Z
---

Ne jamais annoncer qu'un travail est livré sur la base du build local ou d'un échantillon. Il faut un **vérificateur automatique** qui relit le résultat réel, et qui tourne **deux fois** : une fois après le build, une fois sur ce que la production sert vraiment.

**Why:** Sur le deck outbound (06/08/2026), j'ai annoncé les vrais outils métier livrés après avoir vérifié quelques decks par échantillon. Jonathan a ouvert ses decks et voyait partout la même liste générique (bexio, Salesforce). Cause : une autre session avait déployé depuis le VPS et écrasé ma production, avec un `niches.json` où les 9 familles avaient une liste identique. Mon build local était correct, la prod servait autre chose, et mes contrôles curl étaient faussés par le cache CDN et par le bac à sable qui coupe les requêtes en boucle. Un travail juste en local mais faux en ligne est un travail non livré.

**How to apply:**
- Écrire un script de vérification qui contrôle le RÉSULTAT (pas les intentions) et sort en code 1 au moindre écart. Le brancher dans `npm run build` pour qu'un build faux ne rende jamais la main.
- Toujours lancer la vérification **sur la production** après déploiement, sur TOUS les éléments, pas un échantillon (`npm run verifier:live` dans vividflow-outbound).
- Le vérificateur doit détecter les listes identiques entre catégories : c'est le signal d'un preset écrasé ou jamais appliqué.
- Vérifier aussi qui a déployé en dernier (`vercel inspect`, champ `meta.actor`) quand la prod ne correspond pas au build : plusieurs sessions Claude peuvent travailler sur le même projet.
- Pour les logos et visuels, la vérification automatique ne suffit pas : **regarder l'image** avant de l'intégrer. Voir [[project_vividflow_outbound_deck_refonte]].
