---
name: project_brvndlab_brandos_redondances_recadrees
description: Brand OS — redondances de forme entre modules recadrées (le « refus » 3x + différence éclatée Positionnement/Offre)
metadata: 
  node_type: memory
  type: project
  originSessionId: 85669be3-5f8f-465a-b4ca-9c318860b9c4
  modified: 2026-07-27T10:05:48.967Z
---

Audit (27/07/2026, 2 agents) : Jonathan sentait des questions redondantes dans le Brand OS, surtout Positionnement↔Offre. Confirmé + réglé (recadrage, AUCUNE suppression de champ).

**Redondance 1 — le « refus qui coûte » demandé 3 fois → 3 registres distincts :**
- `valeurs / selected-values` = INCHANGÉ, lieu canonique de la VALEUR MORALE.
- `personnalite / valeurs-socle` (« Ton socle ») = recadré en TRAITS DE CARACTÈRE / tempérament (comment il EST : entier, direct, exigeant…), 1-3 mots. Question « en trois mots, ton tempérament ? ». Plus « ce que tu as refusé ».
- `mission / mission-q4` (« Tes limites ») = recadré en LIMITES STRATÉGIQUES/business (décisions de croissance refusées : lever des fonds, scaler dans le chaos, diluer la qualité, dépendre d'une plateforme). Plus les valeurs morales.

**Redondance 2 — différence éclatée Positionnement/Offre :**
- `positionnement / piliers_differenciateurs` = recadré en RÈGLES DE MÉTHODE internes (comment il bosse, ce qu'il s'impose), JAMAIS une comparaison à un concurrent nommé.
- `offre / vs_concurrents` = c'est LE lieu de la comparaison à un concurrent nommé ; s'appuie sur les piliers déjà captés sans les redemander. Les deux hunts se citent en miroir.

**Faux positifs (NON touchés, nuances légitimes) :** douleurs créateur ≠ douleurs audience ; voix/perception ≠ caractère ; ennemi fédéral ≠ message (négatif vs positif, on veut les deux) ; activité ≠ valeur ajoutée ; avantage_competitif ≠ vs_concurrents (absolu vs relatif).

**PIÈGE (rôle tribunal) :** les recadrages doivent être faits DANS LES DEUX fichiers — `_interview.ts` (specs des blocs) ET `route.ts` (prompt système « FORME EXACTE »). Le tribunal a attrapé que route.ts poussait encore l'ancien registre moral sur mission-q4 (L957) et le socle (L1038) → corrigé, sinon Lya reçoit 2 consignes opposées et retombe dans la redite.

Note infra : un `npm install` a été nécessaire (dep `isbot` d'un commit Thomas Smart Links manquante en local, pas un bug). Voir [[project_brvndlab_module_order_rank_lock]], [[feedback_never_overwrite_thomas_work]].
