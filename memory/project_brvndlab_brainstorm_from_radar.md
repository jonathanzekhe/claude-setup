---
name: Brainstorm depuis Radar - décortiquer/remixer/produire
description: Flow 3 étapes pour le bouton "Brainstorm un angle similaire" du Radar Feed. Décompose le signal en 5 segments, tu remixes en 4 mouvements, sortie brief + script.
type: project
originSessionId: b89456e2-2692-4863-b103-66dec20d323d
---
**REVUE FINALE 2026-04-29 : pivot total vers "Radar Picks".**

Décision finale validée : on dégage TOUT ce qu'on a construit autour du brainstorming et de la capture d'angle. Le bon concept = **pick & choose en 1 clic**.

**IMPORTANT : chaque plateforme a 2 couches de valeur — sujet (substance) + levier visuel (packaging).** YouTube ne se résume pas à ses miniatures. Il a SES sujets ET ses miniatures. Pareil pour IG/TT : ils ont des sujets ET des hooks visuels/audio.

| Plateforme | Couche 1 : Sujet (substance) | Couche 2 : Levier visuel (packaging) |
|---|---|---|
| YouTube | ✓ | Miniature (image complète) |
| Instagram (Reels) | ✓ | Hook texte overlay 3s + audio trending |
| TikTok | ✓ | Hook texte overlay 3s + audio trending |

**5 zones de la page Radar Picks** :

1. **Sujets qui marchent** — grille de tuiles cliquables, **toutes plateformes confondues** (YT + IG + TT mélangés selon ce qui performe). Chaque tuile montre le sujet + chips plateformes + créateur source. Click = brouillon `contentItem` créé en draft, pré-rempli avec l'angle source, redirect sur `/content/script`.
2. **Miniatures qui marchent (YouTube uniquement)** — galerie outliers avec thumbnails réelles. Hover = bouton étoile pour épingler dans la moodboard.
3. **Hooks qui marchent (Instagram + TikTok uniquement)** — équivalent du levier visuel YouTube mais pour shorts : texte overlay des 3 premières secondes + audio trending. Pas la cover (rarement choisie sur ces plateformes).
4. **Ma moodboard** — agrégat des miniatures + hooks épinglés (cross-plateforme). Bouton "Briefer mon miniamaker" qui pré-remplit le formulaire Tally du miniamaker avec les inspirations + le titre de la vidéo en cours.
5. **Tes vidéos à rehasher** (badge "Bientôt · OAuth YouTube") — détection des vidéos sous-performantes en CTR, propose 2-3 nouvelles miniatures inspirées des outliers du marché. Méthode rehashing d'Iman Gadzhi.

Inspirations validées :
- Iman Gadzhi (vidéo YouTube · "How testing thumbnails led to $15M+") — méthode rehashing CTR comme métrique reine
- VidIQ — Find Viral Ideas, Design Thumbnails, Competitive analysis
- Critères bonne miniature : digestible 3s, avant/après, mid-action, familiarité, promesse claire, couleurs qui pop

Mockup validé : `brvndlab-radar-pick` sur brvndlab-mockups.vercel.app.

**À supprimer côté UI** :
- Bouton "Capturer cet angle" sur Radar Feed → remplacé par "Voir mes Radar Picks"
- Page `/content/brainstorm-radar` → liens d'entrée retirés (code conservé en archive)
- Modal de capture sur monitoring/page.tsx → supprimée

**À conserver en mémoire pour plus tard** :
- Le bouton "Brainstorm un angle similaire" rejeté définitivement comme concept
- L'idée du nurturing chirurgical conversationnel rejetée définitivement (trop chronophage pour ICP entrepreneur)
- L'idée de capture d'angle textuelle rejetée (gadget, ne sert à rien sans consommation aval)

---

**REVUE 2026-04-29 (post-test) : flow brainstorm 5 segments rejeté.**

Jonathan a testé le flow stepper + nurturing chirurgical en prod. Verdict : trop long, trop chronophage pour son ICP entrepreneur. Il a quitté en cours.

**Nouvelle décision validée — Hypothèse A : Capturer un angle, pas brainstormer.**

Quand Jonathan voit un signal Radar qui marche, son état mental réel = "j'aime l'angle, mais je sais pas si j'en ferai du contenu". Il ne veut pas s'engager plus loin à ce moment-là. La valeur du bouton est donc de **capter ce "j'aime l'angle" en 30 secondes**, pas de produire un script.

**Spec du bouton "Capturer cet angle"** (remplace "Brainstorm un angle similaire") :
- Modal légère sur le Radar Feed
- 1 champ texte court : "Ce qui me parle dans cet angle" (max 1-2 phrases)
- Bouton "Capturer" qui sauvegarde dans une banque "Angles capturés"
- Pas de chat, pas de génération IA, pas de stepper
- L'angle capturé est lié au signal source (créateur, vidéo, vues)

**Banque "Angles capturés"** :
- Stocké dans table dédiée `radarAngleNotes` (id signal, id competitor, note user, créé)
- Consultable depuis Création de contenu (module Inspiration existant en /content/new/inspiration)
- Plus tard, quand Jonathan démarre une vraie idée de vidéo, ces angles capturés apparaissent comme références d'inspiration

**Code conservé mais désactivé** : la page /content/brainstorm-radar et les fonctions Convex (`brainstormRadar.ts`, `brainstormRadarActions.ts`) restent en place mais ne sont plus déclenchées par le bouton Radar. Pas supprimé pour ne pas perdre le travail si on veut un mode "atelier en profondeur" optionnel plus tard.

---

**Architecture (historique, abandonnée)** :

**Architecture validée**

4 phases :
1. **Décortiquer** (Opus 4.7, auto) : la vidéo source est cassée en 5 segments narratifs ancrés sur des citations exactes du transcript.
2. **Remixer en Stepper** (toi, plein écran, 1 segment à la fois) : pour chaque segment, tu choisis 1 mouvement parmi 4 + tu peux saisir ton angle perso. L'IA donne un aperçu "L'IA va construire X" pour anticiper.
3. **Nurturing chirurgical** (vrai brainstorming conversationnel, mode Explorer dopé) : l'IA reprend tes 5 choix de remix et creuse chaque tag pour faire émerger la matière. Elle ne lâche jamais une réponse vague. "Tu as des résultats" → "parles-moi de tes résultats spécifiques, chiffres et anecdotes". Le brief se construit en live à droite.
4. **Brief signé** : output structuré (Hook + Promesse + Mécanisme + Preuve + CTA) avec contenus nourris. Bouton "Signer le brief" (autonome) + "Continuer en script" (enchaîne sur mode Script).

**Les 5 segments universels**
Hook · Promesse · Mécanisme · Preuve · CTA. Grammaire B2B, pas de jargon littéraire (pas de "tension narrative", "résolution", etc.).

**Les 4 mouvements de remix**
- **Reprendre** : garder la structure, swap surface (chiffres, nom propre, contexte)
- **Adapter** : garder le mécanisme, changer l'angle pour coller à mon territoire
- **Contredire** : position inverse — outil de différenciation par opposition (mouvement précieux pour ICP entrepreneur)
- **Ignorer** : skip ce segment, pas pertinent pour mon angle

**Sortie finale (option c)**
Brief texte structuré (titre + hook + 3 beats + CTA), autonome (partageable à un copywriter ou monteur). Bouton "Continuer en script" pour enchaîner sur le mode Script existant si voulu. Pas de flow forcé jusqu'au script.

**Mémoire dorée (capture silencieuse)**
À chaque remix on track : quel segment a été tagué quoi, sur quel signal, sur quel créateur source. Permet d'extraire en silence le "style de remix" (Jonathan reprend souvent les hooks chiffrés, contredit souvent les promesses émotionnelles, etc.). Pas de UI dédiée pendant le tagging.

**Mockups validés**
- `brvndlab-radar-brainstorm-stepper` : phase 2 retenue (1 segment à la fois, plein écran)
- `brvndlab-radar-brainstorm-nurturing` : phase 3 (chat IA chirurgical, brief en construction live, badge Mémoire dorée sur les patterns détectés)
- `brvndlab-radar-brainstorm-workshop` : variante Workshop écartée (trop dense, pas le focus voulu)

**Règle nurturing chirurgical**
L'IA ne se contente jamais d'une réponse vague. Si Jonathan dit "j'ai des résultats", elle creuse "lesquels exactement, chiffres et contextes". Si Jonathan dit "j'ai investi", elle creuse "combien, quand, pour quoi débloquer". Elle relance jusqu'à matière chirurgicale. Style conversationnel max 3-4 phrases par message IA (règle chat continu).

**Variante visuelle retenue : Studio (sidebar sombre + main clair)**
Validée 2026-04-29. Sidebar gauche sombre 280px avec les 5 segments numérotés + signal source en permanence visible + brief de production en bas. Main droit crème avec H1 36px + conversation 18px aérée.

**Piliers enrichis (3 must-have v1 + 2 nice-to-have v2)**

MUST-HAVE v1 :
1. **Confrontation Brand OS** — pendant le nurturing, l'IA confronte ce que dit le créateur source à ce que dit l'identité Brand OS de Jonathan. Force un alignement identitaire automatique. Sans ça, le brief est Frankenstein.
2. **Vault de preuves alimenté par `sales` existant** — pas une nouvelle table externe. Le Vault est une vue par-dessus la table `sales` existante (Performance OS light : clients signés + montants + dates). Champ optionnel "résultat" / "transformation" à ajouter pour enrichir ("Marie passée de 8k à 25k en 3 mois"). Pendant le nurturing, l'IA suggère depuis cette source réelle, pas inventée. Si pas de sales saisis, l'IA dit "Aucune preuve dans tes clients signés, tu peux en saisir une manuellement ici" → CTA d'enrichissement.
3. **Métadonnées alignées sur le module Script existant** — le brief signé porte UNIQUEMENT les métadonnées qui existent dans `/content/script` aujourd'hui : titre, funnel (TOFU/MOFU/BOFU), plateforme, durée. Pas de miniature, pas de B-rolls, pas de description SEO — ces features n'existent pas dans Création de contenu et ne doivent pas être inventées ici. Si Jonathan ajoute des éléments en profondeur dans Script, ils s'ajouteront ici en miroir.

NICE-TO-HAVE v2 :
4. **Mémoire transversale** — pattern matching sur les angles déjà brainstormés. "On a déjà signé 3 vidéos sur la délégation ce trimestre, on attaque l'angle prix ?". Branché sur Mémoire dorée.
5. **Challenge IA** — l'IA peut contester une réponse en croisant avec Brand OS / posts récents. "Tu dis 30h/semaine mais tes posts récents pointent 50h+. Tu veux raconter une réalité ou un objectif ?". Augmente la qualité brutale.

**5e tag de remix optionnel : Détourner**
Entre Adapter et Contredire — utiliser la même structure sur un sujet totalement différent (Hans parle d'argent, je transpose sur le temps). Mouvement de repositionnement subtil pour ICP entrepreneur.

**Why** : Jonathan veut "vraiment bien analyser tous les segments de ce content-là". La décomposition explicite + remix par tag est ce qui rend le truc puissant et chirurgical, là où un simple chat libre serait flou et marketing.

**How to apply** : la sortie de ce flow remplace le point d'entrée actuel du mode Explorer. L'Explorer existant reçoit le remix en contexte et adapte ses 4-5 questions. Le Brand OS reste consommé en parallèle pour ancrer l'identité.
