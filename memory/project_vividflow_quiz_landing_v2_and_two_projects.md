---
name: project_vividflow_quiz_landing_v2_and_two_projects
description: Première page du quiz refondue et scellée (2026-08-05) + piège des DEUX projets Vercel qui servent quiz.vividflow.co et quiz2.vividflow.co.
metadata: 
  node_type: memory
  type: project
  originSessionId: 897a047c-a993-43fa-8237-0d40d02cfcac
  modified: 2026-08-10T13:50:24.120Z
---

## Première page quiz scellée (déployée le 2026-08-05)

Copie validée par Jonathan, ne pas rejouer :
- Pill : « Diagnostic gratuit · 1 minute » (le titre est la pastille, variante B)
- Phrase : « Dites-nous juste qui vous êtes, avant de lancer le diagnostic. »
- Champs : Prénom et nom (UN seul champ, coupé au premier espace pour le webhook) / Téléphone / Email / Entreprise
- CTA : « Démarrer » (bouton plein orange, flèche en bord droit), sortie fluide `.vfl.exit` vers Q1
- Preuve : « +120 dirigeants audités en Suisse romande » (le 4,9/5 et les étoiles sont SUPPRIMÉS, la frise 7 jours aussi)
- L'écran « Vos coordonnées » (gate) est prérempli depuis la première page, préfixe téléphone déduit.
- Téléphone : sélecteur d'indicatif à drapeaux RONDS (SVG inline, zéro image externe), 12 pays validés par Jonathan : CH, FR, BE, LU, DE, IT, ES, PT, GB (libellé « Angleterre »), US, CA, AE. PAS de pays africains (retirés sur sa demande le 05/08). Suisse en tête, pays présélectionné selon le visiteur (fuseau horaire puis langue navigateur, repli CH). Même liste dans le select de l'écran coordonnées. Le numéro part au webhook avec l'indicatif (« +41 79 ... »). Piège CSS : le menu doit passer au-dessus du CTA animé, d'où .vfl-form{position:relative;z-index:6}.

## PIÈGE : deux projets Vercel pour le quiz

**RÈGLE (10/08)** : pour Jonathan, LE quiz = quiz.vividflow.co, seul domaine à citer et à vérifier. quiz2.vividflow.co ne devrait pas exister à ses yeux : ne jamais le mentionner dans les comptes-rendus. Le repo git vividflow-quiz2 sert uniquement de source de code versionnée.

- **quiz.vividflow.co** (l'officiel, celui des pubs Meta) = projet Vercel `vividflow-quiz` (prj_VOEKATH5oU6zPtCtivJNtZpcZ16G), dossier local `~/dev/vividflow-quiz` (pas de git).
- **quiz2.vividflow.co** = projet `vividflow-quiz2`, dossier `~/dev/vividflow-quiz2` (repo git jonathanzekhe/vividflow-quiz2).
- Déployer vividflow-quiz2 ne touche PAS quiz.vividflow.co. Pour l'officiel : synchroniser les fichiers dans `~/dev/vividflow-quiz` puis `vercel --prod --yes` depuis ce dossier.
- Règle : travailler dans le repo git vividflow-quiz2 (source de vérité versionnée), puis copier index.html + api/ + vercel.json + .vercelignore vers vividflow-quiz et déployer les DEUX.
- Le 2026-08-05, la prod avait perdu `api/meta-lead.js` (CAPI lead en 404 silencieux) : restauré depuis le repo. `api/quiz-lead.js` n'existait que dans la prod : téléchargé via l'API Vercel (v7 deployment files) et versionné.
- Attention zsh : ne jamais nommer une variable shell `path` (écrase $PATH).

Voir [[project_meta_ads_quiz_campagne_etat]] et [[project_vividflow_repos_et_tracking_meta]].
