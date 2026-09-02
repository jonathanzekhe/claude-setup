---
name: project-vividflow-deck-prospection-rh
description: "Maquette deck slides outbound cabinets RH/recrutement VividFlow — script 8 slides validé (hero perso [Cabinet]), structure figée, ne pas réécrire"
metadata: 
  node_type: memory
  type: project
  originSessionId: 5714743e-a245-477d-aa4c-79a3cae41b4c
---

Maquette personnalisée pour campagne outbound cabinets RH / recrutement / chasse de tête. **PAS une landing page** : expérience en slides horizontales, 1 slide = 1 écran sans scroll, navigation flèche droite/gauche. URL cible `vividflow.co/nom-du-cabinet` ou `/prenom-nom`, personnalisée par envoi (token `[Cabinet]`). Fichier : `VividFlow/site-mockups/prospection-recrutement.html`. Live : vividflow.co/prospection-recrutement.html.

Logique commerciale : Email = faire cliquer vers la maquette. Maquette = wow + expliquer le système + CTA RDV. Appel = vérifier réception/ouverture + booker. Le hook "Un bon candidat mal suivi peut coûter un placement" reste dans l'EMAIL, pas dans le deck.

ATTENTION : deux faux scripts ont été envoyés par Hermès avant le bon. Le SEUL valide est celui ci-dessous (hero perso `[Cabinet]`). Ne jamais réutiliser : (a) le mécanisme "suspense / 2 leviers gardés", (b) la version dont la slide 1 = "Un bon candidat mal suivi".

**Structure figée, copy validé, NE PAS réécrire les phrases ni ajouter de structure :**
1. (Hero) Projection VividFlow pour [Cabinet] / Comment [Cabinet] pourrait structurer son suivi candidats, clients et relances avec un système IA sur mesure. CTA discret : Voir la projection.
2. (Ce qu'on a compris) [Cabinet] accompagne des entreprises dans leurs recrutements / chasse de profils / conseil RH. / Votre valeur repose sur la qualité du matching, la réactivité et la précision du suivi entre candidats et clients.
3. (Le problème probable) Quand plusieurs missions avancent en parallèle, le risque n'est pas seulement de manquer de candidats. / Le vrai risque est de perdre le fil : candidat à relancer, client à tenir informé, retour à transmettre, dossier à préparer, opportunité à prioriser.
4. (Avant / Après) Avant : Infos dispersées, relances manuelles, suivi dépendant de la mémoire des consultants. Après : Un système IA sur mesure aide à préparer, suivre, relancer et prioriser les bonnes actions.
5. (La maquette système) Candidats / Clients / Emails / WhatsApp / CRM / Notes → Mémoire business du cabinet → Agents IA spécialisés (suivi candidat, suivi client, relances, préparation dossier, résumé échanges, priorisation opportunités) → Consultants RH.
6. (Ce que le système peut prendre en charge) résumer les échanges, préparer les points avant un appel, rappeler les relances importantes, centraliser les infos candidat/client, signaler les opportunités chaudes, préparer un suivi client plus clair.
7. (Ce que ça ne fait pas) Ce n'est pas un chatbot. Ce n'est pas un CRM de plus. Ce n'est pas un remplacement des consultants. / C'est une couche d'exécution intelligente autour de votre méthode actuelle.
8. (CTA) Si cette projection vous parle, on peut la parcourir ensemble 20 minutes. / Objectif : voir où ce système pourrait avoir du sens pour [Cabinet]. Bouton : Réserver un créneau.

Direction visuelle : PIVOT VALIDÉ vers l'identité du site vividflow.co (fond crème, PAS sombre). Tokens : --cream #F4F0EA / --soft-bg #FAF7F1 / --noir #231F20 / --orange #E26137 / --olive #5C8C5C / --beige #E9D7BF / --brun #614D27. Typo Fraunces (titres, weight 300) + Inter + JetBrains Mono (eyebrows/labels). Chrome deck : .brand (logo vividflow-icon.png 32px + "VividFlow" Inter 600), .progress NN/08, .rail (orange % : S5=62.5), .nav cercles ghost. Composants réutilisables : .tool (logos grisés persona/), .agent (avatar persona + .nm mono + .tk Fraunces + .badge cours/fait). Personas illustrés (AMANI/MEI/NIA/AKIRA/SORA/IMANI...) = LES AGENTS IA, jamais les consultants. Pas de robot, pas de dashboard générique, 1 idée par slide. Token `[Cabinet]` souligné pointillé orange.

État validé au 03/06 : S1 keynote centré, S2 valeur (matching/réactivité/précision candidats↔clients, dots verts), S3 "la pile", S4 "Vos agents IA au travail" (diptyque avant tools dispersés / après agents + badges En cours/Fait). 

Slide 5 = VALIDÉE sur **prospection-slide5-v19.html**. Layout horizontal 3 colonnes : Sources (Gmail · WhatsApp · Slack · CRM · Excel) → bloc central "Agents IA au travail, en continu" = notifs style iPhone (avatar persona + badge +N orange au coin + action + statut sobre : traité/prêt/à valider/transmis au consultant) → bloc droite "Le suivi est prêt." / "Vos consultants gardent le contrôle." Titre = "Vos consultants se concentrent sur la relation, pas sur le suivi." Animation calme (cascade lente + flux orange + petite flèche vers consultant). Itérations ABANDONNÉES (ne jamais reproposer) : maquette système 4 nœuds chargée (v8-v12), scène bureau réaliste (v5), carte+portrait Sophie (v6), flux de cartes génériques (v7), gros compteurs abstraits (v15). RÈGLES S5 : agents = têtes/avatars OK mais sobres, jamais de chat entre agents, jamais de gros bloc Mémoire visible, jamais d'effet KPI dashboard, lecture 5s.

DECK ASSEMBLÉ (navigable) = **prospection-recrutement.html** : deck horizontal de 8 iframes, nav flèches ←/→ + clavier + dots, anim rejouée par slide (reload iframe au passage). Token dynamique : `?cabinet=Nom` propagé aux iframes remplace `[Cabinet]`. Slides validées source (chacune affiche 1 seul panneau via `?only=` qui masque vtag/vlabel/nav) : S1 slide1-variants?only=A · S2 slide2-clarity?only=B · S3 slide3-v2?only=A · S4 slide4-v3?only=2 · S5 slide5-v19?only=1 · S6 slide6-variants?only=A · S7 slide7-final?only=1 · S8 slide8-variants?only=B. Le snippet `solo`/`only`/`cabinet` est injecté en bas de ces 8 fichiers.

Méthode : slide par slide, 3 mockups, valider avant la suivante via vividflow.co/<fichier>.html. Propositions visuelles OK sans changer la copy ; si manque, demander avant d'inventer. Voir [[feedback-vividflow-vs-brvndlab]], [[feedback-no-em-dash]].
