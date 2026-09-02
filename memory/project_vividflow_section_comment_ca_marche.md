---
name: project_vividflow_section_comment_ca_marche
description: "Section \"Comment ça marche\" vividflow.co — 3 étapes scellées + schéma étape 1 (calendrier animé)"
metadata: 
  node_type: memory
  type: project
  originSessionId: e36b2602-f661-40d5-ab17-c52cb8081ab9
---

Section **"Comment ça marche"** de vividflow.co, juste après le hero. Sert de pont de clarté (le hero envoyait direct sur l'offre sans montrer le "comment"). Analysée d'après réfs (knotch.framer.ai, neocell.ai, hanzo, agero, hyros, lunaui) : toutes mettent le "how it works" après le hero.

**Distinction scellée** (piège évité) : "Comment ça marche" = la **trajectoire** (parcours en 3 étapes dans le temps). "La solution" = le **fonctionnement du système** (carousel [[project_vividflow_r1_direction_source_of_truth]] battements : capter/mémoire/mouvement/décision, bras droit orchestrateur + DataOS tableau de bord). Deux sections DISTINCTES, zéro redondance.

**Les 3 étapes (copies validées, ton mature façon Linear/Notion, en "on", pas de répétition du hero) :**
1. **L'audit** — On repère ce qui vous coûte du temps et ce qui peut tourner sans vous.
2. **L'installation** — On déploie vos agents IA sur vos outils, sans rien remplacer.
3. **Le partenariat de croissance IA** — On pilote votre IA au quotidien et on vous garde une longueur d'avance sur votre marché.

Progression narrative : douleur → solution → ambition. Nommer par le **livrable** (L'audit, L'installation, Le partenariat) pas l'action. Dire "partenariat de croissance IA", jamais "partenariat allié". [[project_vividflow_positionnement_officiel]]

**Schéma étape 1 SCELLÉ = simulation calendrier animée (V1 classique) :**
- Faux écran produit façon Knotch (pas de schéma abstrait décoratif). Fond gris trame de points, tuiles blanches en relief, zone texte hachurée en bas, coins arrondis.
- Semaine Lun→Ven avec vraies tâches. Blocs **keep** (gris #f1efec = tâches gardées : Comité, Stratégie, Client, Closing, Revue) vs **kill** (orange doux = chronophages : Relances, Reporting, Saisie, Admin, Emails, Devis).
- Animation : la semaine se remplit, puis les tâches kill **disparaissent une par une** (flash orange puis fade+collapse), le compteur "libéré" grimpe. Boucle.
- Badge haut-droite = **variante 01 "Pill douce"** validée : `<span class="freed"><span class="n">5 h 30</span><span class="l">libérées</span></span>` — pill orange doux, chiffre d'abord + "libérées", largeur fixe (min-width sur .n, tabular-nums) pour ne PAS sautiller.
- PAS de bandeau final "Votre vraie semaine rendues" (rejeté, trop). La semaine qui se vide suffit.

**Orange scellé pour les schémas = #FF5A1F** (plus vif/punchy que le #E26137 du site, jugé trop "orange Claude"). Fichier de travail : site-mockups/audit-calendar-3.html (V1) + badge-in-context.html.

**Schéma étape 2 SCELLÉ = tableau "équipe renforcée par agent" (site-mockups/etape2-final.html) :**
- Tableau 3 colonnes : **Département · Équipe + Agent IA · Tâches absorbées**. Fond blanc encadré, façon écran produit, charte du site.
- Colonne 1 : nom du département SEUL (pas de sous-titre). Noms : **Commercial · Relation client · Administratif · Marketing** (jamais "Support" → "Relation client").
- Colonne 2 "Équipe + Agent IA" : photos humaines RONDES (bordure noire) + l'agent IA en DERNIER (carré arrondi + halo orange, distinct). Nombre d'humains variable, **cap à 4 photos** (pas de "+N"). Marketing = 4 humains + agent.
- Colonne 3 "Tâches absorbées" : carte fond BLANC (pas verte), seuls le **check (bouton) et le chiffre en VERT #2f9e44**, texte noir. Largeur AUTO (jamais tronqué). Libellés COURTS pour tenir à taille réelle condensée (ex. "5 RDV calés", "28 messages", "9 factures", "3 posts").
- **Motion A validée** : le check "pop" (scale) + le texte se remplace en fondu (swap opacity), décalé par ligne. Cartes en largeur auto ne bougent pas anormalement.
- Copie foot inchangée : "On installe un agent IA dans les départements qui ont besoin de soutien opérationnel."
- Règles apprises douloureusement : PAS "IA" en tag sous l'agent (inutile) ; agent = membre de l'équipe (pas de colonne séparée = évite doublon avec département) ; auditer 3× au zoom avant de montrer ; tester à la TAILLE RÉELLE du site (~680px) pas en plein écran ; cartes largeur fixe/auto pour ne pas bouger au swap. Rejetés : orbite logo, illustrations générées (OpenRouter), bulles VividFlow qui se chevauchent, avatars persona seuls, barres charge/perf.

**Schéma étape 3 SCELLÉ = duo CEO/CTO + bulles partenaire (site-mockups/etape3-final.html) :**
- Rejetés en route : courbes, points/détachement, dashboards chiffrés, fond sombre (jamais de fond sombre), organigrammes → le concept final vient de Jonathan : **deux portraits côte à côte (Jonathan CEO + Thomas CTO, photos beige assorties : persona/jonathan-ceo.jpg = channels4_profile.jpg croppé, persona/thomas-cto.jpg = WhatsApp img croppée)** avec des **bulles VividFlow scellées** (blanches, bord 1.5px #231F20, radius 14, ombre 0 2px 0, flèche bas, typing "···" puis message, bob 3.2s) qui alternent au-dessus de chaque tête.
- Bulles = messages du PARTENAIRE humain (voix "on", concret ROI, jamais robot/notification IA, pas de doublon étape 2). Les 6 scellées : "On a repéré une opportunité rentable" · "Votre agent commercial cale plus de RDV" · "Votre marché a bougé, on a déjà ajusté" · "Nouvelle amélioration installée chez vous" · "On a une reco pour votre prochaine offre" · "Un temps d'avance sur vos concurrents". (Un agent ne "vend" pas : les outils appuient les humains → "cale plus de RDV".)
- Fix chevauchement : bulle max-width 200px, 2 lignes, reste sur sa moitié, flotte AU-DESSUS de la tête (ne mord plus la photo).
- **Fix bulles MOBILE (2026-07-22)** : en mobile les bulles étaient coupées par les cadres `.ccm-feat`/`.ccm-scene`/`.ccm-screen` (tous `overflow:hidden`, hauteurs fixes). Jonathan a AUTORISÉ que la bulle **sorte du cadre** pour rester entière. Fix : classe `.ccm-col-3` ajoutée sur la colonne étape 3 ; media `@media(max-width:640px)` passe `.ccm-col-3 .ccm-feat/.ccm-scene/.ccm-screen{overflow:visible}` + `.ccm-col-3 .ccm-duo{padding-top:64px}` (de l'air au-dessus pour la bulle qui déborde) + bulle max-width 200px. Vérifié : bulle entière, jamais coupée (cutLeft/cutRight=false), sur le bon personnage. La règle « une seule bulle .on à la fois » (JS bStep) évite le chevauchement Jonathan/Thomas.
- Header écran : "Vos partenaires" (corrigé 2026-07-19, « on est plusieurs ») + mono "au quotidien". Labels mono "Jonathan · CEO" / "Thomas · CTO".
- Copie pied SCELLÉE : "Le partenariat de croissance IA" / **"On anticipe, on conseille, on améliore : vous gardez une longueur d'avance sur votre marché."** (les 3 verbes = les 3 piliers ; "anticipe" choisi contre "veille" trop passif ; pas de "croissance" dans la phrase, déjà dans le titre).

**GABARIT COMMUN SCELLÉ (les 3 cartes)** : onglet "dossier" `.steptab` au-dessus de la carte (crème, mono orange uppercase "Étape 0X", radius 14 14 0 0, margin-left 20), carte .feat **600×442 exactement** (scene height 322 + foot height 118 FIXES, foot p min-height 41px pour 2 lignes), plus de numéro dans le pied. Fichiers finaux : etape1-final.html (calendrier), etape2-final.html (tableau), etape3-final.html (duo partenaire) + comparateur etapes-1-2-compare.html.

**INTÉGRÉ EN PROD (2026-07-18)** : la section a REMPLACÉ l'ancienne section "Notre offre" dans index.html (l'ancre `id="offre"` est conservée pour la nav ; le JS deck/agents-grid de l'ancienne section est null-guardé, resté en place sans effet). Les 3 cartes sont côte à côte sous le titre `h2.section-title` "Comment ça marche" (pas d'eyebrow), classes préfixées **`ccm-`** pour éviter les collisions CSS, JS embarqué dans un `<script>` de la section. JetBrains Mono ajouté au lien Google Fonts. Responsive : 3 colonnes ≥1160px, empilées (max 600px) en dessous, ajustements <480px (colonnes tableau 76/100px). Colonnes étape 2 réduites à 88px/112px pour tenir à ~1/3 de largeur. LIVE vérifié sur https://vividflow.co (desktop + mobile + zéro erreur console).

**Ajustement scellé (2026-07-18 soir)** : les 3 barres d'en-tête d'écran ("Votre semaine" / thead Département·Équipe+Agent IA·Tâches absorbées / "Votre partenaire") font toutes **height:45px** → bordures basses alignées au pixel entre les 3 cartes. Jonathan a REJETÉ l'équilibrage complet proposé (lignes étape 2 étalées sur la hauteur, calendrier densifié, photos 132px) : étapes 1 et 3 restent à la version initiale, étape 2 garde ses lignes compactes — SEULE la barre a changé. Les 3 variantes de placement du titre (gauche nu / gauche+ligne / eyebrow+gauche, page ccm-titre-variants.html) : pas fan, aucune choisie.

**TITRE SCELLÉ + LIVE (2026-07-18)** — pattern Knotch validé : petit label mono discret `.ccm-cap` « COMMENT ÇA MARCHE » (IBM Plex Mono 10px, letter-spacing .18em, GRIS #736d65, sans fond ni bordure) au-dessus du titre `.section-title` 40px en DEUX lignes : « Comment on vous apporte<br>des résultats concrets ». Aligné à GAUCHE (padding-left 20, aligné aux cartes), 56px d'air avant la grille. TOUT NOIR : Jonathan a interdit l'accent Instrument Serif italic orange mis sans validation — **RÈGLE : plus jamais de couleur sans son accord explicite**. Rejetés : capsule fond crème (trop mise en avant), titre une ligne (trop long), « Comment ça marche » en gros titre (trop cheap). Doublon à traiter plus tard : la section `#comment` plus bas garde l'eyebrow « Comment ça marche » + « Comment fonctionnent nos solutions IA ».

**Piège vf-motion (corrigé 2026-07-18)** : le script `vf-motion` d'index.html découpe les `.section-title` en spans `.vf-word` en CONSERVANT les espaces d'origine, et le CSS ajoutait `margin-right:.25em` par mot → double espace visible entre les mots. Fix : `margin-right:0` sur `html.vf-motion .offre-section .section-title .vf-word` (scopé à cette section ; le hero et les autres sections gardent leur règle d'origine — si Jonathan se plaint d'espacement large sur un autre titre du site, c'est la même cause).
Génération d'images possible via OpenRouter (clé OPENROUTER_API_KEY dans ~/.hermes/.env, modèle google/gemini-2.5-flash-image) mais crédits limités + résultat hors charte → éviter sauf besoin réel.


**Habillage Linea des cartes (2026-07-19, LIVE)** : sur demande de Jonathan (réf cartes « How it works » de lineads.framer.website), les 3 cartes passent en **carte BLANCHE** avec la trame pointillée UNIQUEMENT dans un cadre intérieur (scene margin 12px, padding 12px, border 1px rgba(26,24,21,.07), radius 14, dots renforcés .09) — ça met le visuel en valeur ; pied épuré (plus de hachures ni border-top), onglet dossier blanc. Contrepartie gérée : le cadre mange ~30px de largeur → étape 2 resserrée (colonnes 86/94px, gap 8, avatars 22/24, notif 9.5px padding 4/8) pour ZÉRO troncature (vérifié : « 12 relances », « 9 demandes » entiers). Les fichiers mockups etape*-final.html restent à l'ancienne version ; index.html fait foi.