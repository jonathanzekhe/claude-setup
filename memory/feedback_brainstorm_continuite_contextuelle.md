---
name: Brainstorm depuis Research ou Radar = continuité profonde, jamais reset
description: Quand on clique "Créer un brainstorm" depuis une vidéo analysée, un signal Radar ou tout contexte riche, le brainstorm doit hériter de TOUT le contexte. Jamais juste le titre.
type: feedback
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
Quand un utilisateur clique "Créer un brainstorm à partir de cette vidéo" (Research), "Creuser ce pic viral" (Radar), ou toute CTA qui pousse vers une surface de brainstorm, la section brainstorm doit hériter de **l'intégralité du contexte collecté**, pas juste du titre ou d'un label.

**Why:** Jonathan a constaté que dans d'autres outils (et probablement dans ses sessions précédentes avec Brvndlab), cliquer "brainstorm" réinitialise presque tout. Seul le titre passe. Résultat, l'utilisateur doit tout réexpliquer à l'IA, tout le travail d'analyse en amont est perdu. C'est bateau et ça tue la valeur du SaaS. Le brainstorm n'est pas une étape isolée, c'est la **continuité** de la recherche. On a déjà fait l'investigation, on ne recommence pas à zéro.

**How to apply :**
Quand le brainstorm est initié depuis :

1. **Une vidéo analysée dans Research** → le brainstorm reçoit :
   - Titre de la vidéo + créateur + plateforme + URL source
   - Transcript reformaté complet (hooks, sections, quotes)
   - L'analyse des 4 tabs (Pourquoi / Structure / Ton / Thumbnail)
   - Les patterns détectés sur le sujet
   - La liste des autres vidéos similaires qui performent

2. **Un signal du Radar** (pic viral, nouveau hook, pattern similaire) → le brainstorm reçoit :
   - La publication déclencheur + son contexte
   - Le type de signal (viral / hook / pattern)
   - L'historique du créateur (si surveillé)
   - Le "pourquoi ça vibre maintenant" de l'IA

3. **Du Dashboard ou d'une autre surface** → idem, tout le contexte visible au moment du clic voyage.

**Dans l'UI du brainstorm :**
- Afficher un bandeau "À partir de : [source]" en haut de la conversation, cliquable pour ouvrir la source
- Le premier message de l'IA doit montrer qu'elle a TOUT lu : référencer les hooks spécifiques, citer les chiffres vus dans l'analyse, mentionner les patterns détectés
- L'IA ouvre avec une question ciblée qui suppose le contexte connu, pas "Sur quel sujet veux-tu brainstormer ?"

**Backend :**
- Passage du contexte via objet structuré (pas juste une query string)
- Le brainstorm consulte le vault Convex de la vidéo / du signal en temps réel si besoin de recharger
- Le brainstorm garde la source en référence tout au long de la conversation (pour citations ou retour en arrière)

Cette règle s'applique à TOUTES les transitions cross-module où du contexte existe : ne jamais jeter le contexte en chemin. C'est le socle du "less is more" qui marche vraiment : moins d'étapes pour l'utilisateur parce que chaque étape capitalise sur la précédente.
