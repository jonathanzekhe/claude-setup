---
name: brvndlab-instagram-ordre-lecture
description: "Ordre de lecture de la section Instagram (18/08) — Verdict, puis Tes contenus, puis l'audience. Rien n'est supprimé, tout est réordonné."
metadata: 
  node_type: memory
  type: project
  originSessionId: 100d0ff3-e583-486e-ade2-ef55a5f52457
  modified: 2026-08-18T12:51:03.789Z
---

Décidé et déployé le 2026-08-18, après analyse du rapport Instagram de SooWei Goh (captures fournies par Jonathan).

**RÈGLE D'ORDRE (validée, ne pas réinverser)** dans `src/app/(app)/reseaux/linkedin/instagram/InstagramContent.tsx` :
1. **Verdict** (`<Verdict>`, carte `.vcard`) — trois chiffres du compte (vues, abonnés nets + delta, interactions pour 100 vues) et UNE phrase qui nomme la tension entre eux.
2. **Tes contenus** (`<Contenu>`) — remonté depuis le bas : c'est la seule chose sur laquelle le client peut agir.
3. **Ton audience** (`<Overview>`) — abonnés, portée, démographie, lieux, horaires. Inchangé, rangé au fond.

**Rien n'a été supprimé.** Seule la carte « Performance » a fondu dans le Verdict (elle affichait vues + interactions, désormais en haut) ; ce qui restait — la répartition j'aime/commentaires/partages/enregistrements en donut — est devenu la carte « Détail des interactions ».

**Principe du Verdict** : aucune phrase sans chiffre derrière. Quand la matière manque, il dit « pas encore assez de matière sur cette période » au lieu d'inventer une tendance. « Abonnés par publication » (champ `follows` de `instagramMedia`, déjà capté) est notre équivalent HONNÊTE de son indicateur de prospects qualifiés — on ne fabrique aucune segmentation qu'on ne mesure pas.

**Reste à construire** (deck : https://claude.ai/code/artifact/930623d7-521c-468f-a9d2-d634c861b62c) : classement des contenus par taux d'abonnement + ligne « motif » (idée 02), colonnes ce qui marche / ne marche plus (idée 03), lecture des commentaires par nature (idée 04, demande de brancher la récolte des commentaires Instagram). Écarté volontairement : sa segmentation ICP (repose sur un humain), sa liste de reels à venir (notre Pipeline le fait), ses onglets multi-rapports (nos modules le font).

Voir [[brvndlab-linkedin-abonnes-extension-source]] pour les chaînes de données, [[brvndlab-resilience-chaines-externes]] pour la résilience.
