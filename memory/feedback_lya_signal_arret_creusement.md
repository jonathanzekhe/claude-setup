---
name: feedback_lya_signal_arret_creusement
description: "Lya Brand OS — signal d'arrêt du creusement : ni tour en rond, ni bâclé (s'arrête quand elle tient la BONNE matière)"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 85669be3-5f8f-465a-b4ca-9c318860b9c4
  modified: 2026-07-27T19:41:16.349Z
---

Jonathan (entrepreneur pressé) : Lya « tournait en rond », répétait des questions, gaspillait des tokens — MAIS il ne veut PAS non plus qu'elle foncent trop vite (réponse pas mûre = client confus/perdu). Sealed + déployé 27/07/2026.

**La cause (audit) :** le prompt avait un accélérateur (« écris dès que tu as de la matière ») ET un frein (« creuse jusqu'au vrai »), mais AUCUN signal d'arrêt — Lya ne savait pas COMMENT reconnaître qu'elle tient la bonne réponse. Elle oscillait entre les deux échecs.

**Le fix central — PRINCIPE 0 (arbitre tout), dans route.ts en tête des principes transversaux :** Lya s'arrête de creuser DÈS qu'elle tient une réponse JUSTE, CLAIRE, VRAIE (pas parfaite, pas la plus longue, même COURTE). Le signal d'arrêt = « il se reconnaîtrait dedans », JAMAIS un compteur ni la longueur. Si flou → UNE relance ciblée, pas trois. JAMAIS écrire une réponse pas mûre pour aller vite (sinon confusion). « Le juste creusement se mesure à la CERTITUDE d'avoir touché le vrai. Ni tour en rond, ni bâclé. »

**Compléments (même chantier) :**
- Règle 5bis : anti-répétition transversale TOUS modules (avant, la règle « ne repose jamais une question déjà répondue » n'existait que dans Personnalité — d'où le tour en rond ailleurs).
- Règle 5 accordée : réponse COURTE mais juste ≠ vague → on l'écrit sans relancer. Court ≠ insuffisant.
- `probleme-principal` recadré : vise LE problème de fond MAJORITAIRE (pas un client random), 1 relance conditionnelle au lieu de 3 angles obligatoires. Seuil isServed baissé 90→60 (une réponse juste-mais-courte n'est plus forcée à une relance par le code). Opener : « le même blocage de fond qui revient chez presque tous tes clients ».

**Why :** entrepreneur pressé, introspection OUI mais EFFICACE. Le principe : creuser est un moyen, pas un rituel ; on s'arrête quand on tient le vrai.

**PRÉSERVÉ (tribunal) :** creusement racine objectifs/douleurs (seuil 240 intact — pour ces blocs « le vrai » = la racine), anti-module-vide, validation de direction (12sexies), ne jamais inventer, [[feedback_validation_deux_temps_lya]]. Distinct de [[feedback_lya_partenaire_reflexion_noyau]] (façon de parler) et [[feedback_lya_reponses_chirurgicales_1a3_phrases]] (longueur du contenu).
