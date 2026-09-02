---
name: Live status messages pendant toute action longue
description: Toute action longue (IA, scraping, workflow) doit afficher des messages d'étape successifs dans le ton Brvndlab, jamais de spinner muet.
type: feedback
---

Toute action qui prend plus d'une seconde dans Brvndlab doit afficher une **série de messages d'étape successifs** qui racontent ce qui se passe vraiment en coulisses. Jamais de spinner muet ni de message générique "Chargement en cours".

**Why:** Jonathan a explicitement demandé ce pattern le 2026-04-08. Il cite Claude Code comme référence, avec ses mots rotatifs ("reticulating splines", "marinating", etc.) qui donnent une vraie sensation de travail actif. Psychologiquement, un utilisateur accepte 10 à 30 secondes d'attente sans frustration si on lui raconte l'histoire du travail. Face à un spinner muet, il devient frustré dès 2 secondes. C'est aussi un des détails qui distinguent une app premium d'une app générique en 2026.

**How to apply:**
- Chaque action IA, scraping, ou workflow long doit streamer des messages d'étape réels via le backend (pas décoratifs, pas fake). Le Vercel AI SDK permet de streamer ces messages nativement en plus des tokens de réponse.
- Les messages respectent la voix Brvndlab "on", jamais "je". Exemples validés: "On récupère le transcript", "On croise avec ton Brand OS", "On repère les patterns", "On scanne YouTube FR et EN", "On mijote les variantes".
- Verbes d'action concrets et variés, jamais "Chargement". Ton un peu vivant, mais sans gadget.
- Dernière étape toujours "Presque prêt..." avant l'apparition du résultat, c'est psychologiquement important.
- Les messages doivent correspondre à de **vraies étapes** exécutées par le code, pas du storytelling mensonger. Si le backend change d'étape, le message change.
- Créer un composant réutilisable `LiveStatus` au Chantier B, utilisé partout (Recherche, Brainstorm, Analytics, Content Research Agent, sauvegarde Brand OS, etc.).
- S'applique sur TOUS les écrans sans exception dès qu'il y a traitement long.
