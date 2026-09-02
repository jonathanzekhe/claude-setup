---
name: project_vividflow_faq_videos
description: "Scripts vidéo FAQ VividFlow (page post-réservation) — méthode, règles de voix, état slide par slide"
metadata: 
  node_type: memory
  type: project
  originSessionId: 8a63f3ad-5be5-4f15-8637-ba4d05d5bbf8
---

Projet : vidéos FAQ façon loom sur la page post-réservation d'appel (conversion, but = "je suis au bon endroit"). Deck : ~/dev/vividflow-faq (index.html), live https://vividflow-faq.vercel.app, 10 slides. Déploiement : `vercel deploy --prod --yes` depuis le dossier.

Méthode : Jonathan envoie le transcript de Minozan (concurrent/ex-associé, Kalvi) slide par slide → réécrire MÊME structure et arguments dans la voix de Jonathan. Slide 6 (Claude/ChatGPT) écrite de zéro (lui parlait de Limova).

Règles de voix apprises sur ce projet :
- Vouvoiement, oral naturel, PAS de tics type "la question à un million".
- Monnaie = CHF, jamais d'euros (cible suisse) ; chiffres en chiffres ("80 000 CHF", pas en lettres).
- Rester MACRO : zéro technicité pour ces vidéos (pas de "entraîner les agents", "donnée contextuelle") — la technicité se garde pour l'appel.
- Nommer des entreprises connues crédibles pour les Suisses : McKinsey, UBS. Angle validé : "les leaders de marché utilisent déjà ça, c'est ce qui leur donne un temps d'avance ; aujourd'hui cette même puissance est accessible à tous" (= ennemi fédéral Brand OS, cartes redistribuées, cf [[project_vividflow_brand_os_positionnement]]).
- Secteurs : inclusifs (pas que conseil/agences/coaching — immobilier, BTP, banques, assurances, groupes industriels).
- 80k→130k CHF par employé (pas 40k : sous le coût d'un salaire suisse, pas crédible).

État (2026-07-03) : scripts scellés slides 1-7. Slide 3 : version 80 000→130 000 CHF. Slide 7 : redesignée (4 cartes cochées Cabinets de conseil/Banques/Assurances/Groupes industriels + "Ils l'utilisent déjà en interne. Désormais accessible à votre entreprise."), script scellé "leaders de marché" ; Jonathan pas 100% fan du design actuel, à revoir plus tard. Restent : slides 8, 9, 10.
