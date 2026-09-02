---
name: project_brvndlab_visual_direction_rework
description: "Chantier en cours — refonte complète direction visuelle + UI/UX Brvndlab, à trois (Jonathan, Claude, Thomas/CTO). Process à venir."
metadata: 
  node_type: memory
  type: project
  originSessionId: 03adbfc3-e0b4-4f12-87ce-d3de3ed326f9
---

Démarré 2026-06-25. On retravaille TOUTE la direction visuelle et l'UI/UX de Brvndlab, en équipe : Jonathan + Claude + Thomas (CTO Brvndlab, voir [[user_thomas_cto]]).

**Mode de travail.** Claude = assistant du mood board. À chaque étape, Jonathan + Thomas envoient résumé/inspirations/éléments ; Claude réagit, challenge, structure. On avance dans l'ordre, étape par étape ; on ne passe à la suite qu'une fois l'étape calée.

**Les 8 étapes (abstrait → concret) :** 1) Intention/territoire (mots-clés ressenti) 2) Références visuelles 3) Palette couleurs (marque + neutres + états) 4) Typographie (titre/texte + échelle) 5) Langage visuel (arrondis, ombres, traits, espacements) 6) Imagerie & iconographie 7) Composants UI clés (bouton, carte, champ, badge) 8) Logo & marques (variantes + favicon).

**Livrable final :** un gros dossier/site Vercel rassemblant tous les éléments + notes = direction visuelle officielle, qui servira ensuite à retravailler chaque section de Brvndlab.

**Filtre permanent (à appliquer à chaque choix visuel) :**
- Produit = création de contenu chirurgical adossée au Brand OS (histoire, parcours, com, audience cible, offre) → phase brainstorming → contenus (story, post…). Smart links = mesurer leads/ventes générés par contenu.
- ICP = créateurs / entrepreneurs / infopreneurs qui veulent solidifier leur expertise ET (côté entrepreneurs) générer leads/ventes. Voir [[project_brvndlab_icp_audience]].
- Direction visuelle = premium « première classe », clair, épuré, fluide, lisible, **boomer-friendly** (pas gamin), moderne et agréable. Chaque choix doit parler à cette audience.

## Étape 1 — Territoire (VALIDÉ 2026-06-25)
- **Mots-clés ressenti :** accompli · maîtrisé · serein · premium · **compris** (signature émotionnelle = Brand OS rendu visible, le "chaud" qui évite le froid corporate).
- **Personne incarnée :** Jony Ive (contrôle + esthétique sophistiquée, luxe par la retenue).
- **Triade marques :** Apple (DOMINANTE) · Lacoste · Rolex → premium iconique, intemporel, sans esbroufe, emblème fort.
- **Promesse n°1 / dominante = A (Apple) :** « un outil d'une simplicité géniale, fluide, sans friction. » Lacoste = signature reconnaissable, Rolex = statut d'accompli (épices secondaires).
- **Engage la suite :** beaucoup de vide/espace, peu d'éléments à l'écran, soin maniaque des détails (typo/alignements/transitions), base blanche/minimale/tech, signature de marque affirmée sans surcharge. ÉVITER : gamin, criard, bordélique, corporate froid.

## Étape 2 — Références visuelles / direction interface (VALIDÉ 2026-06-25)
Deux directions comparées en versus :
- **Direction A = crème clair chaud** : fond blanc chaud/crème, titres serif (+ italique accent), accent orange, beaucoup d'espace, ton humain personnalisé, soft, lisible. (réfs : my mind, Simple Beat, devotional, audio app « Good afternoon Lukas »).
- **Direction B = sombre cinématographique** : noir profond, objets liquides glossy ambre/rouge, serif + monospace, cartes vitrées à halo, drama luxe Rolex (réfs : Bía sleep, « Find your center », model cards Groq, Interstellar).
- **Socle commun aux deux (acté) :** titres serif + italique, énormément d'espace, accent chaud orange/ambre, ton humain personnalisé.
- **DÉCISION :** **A = socle du produit** (quotidien, fluide, lisible, boomer-friendly, dominante Apple, chaleur « compris »). **B = arme pour les moments statement** (landing/hero/écran d'accueil/dark mode de prestige/exports → gravité Rolex). Ne pas faire full-dark partout.
- Point d'attention : doser les halos/dégradés aura (rose-pêche/violet) sobrement pour ne pas glisser vers wellness/féminin/spirituel — garder chaleur crème + orange.

## Étape 3 — Palette de couleurs (EN COURS)
- **L'orange n'est PAS sacré** (Jonathan, 2026-06-25). Brvndlab pas encore sorti = page blanche. Logo peut devenir monochrome ou changer. La couleur de marque doit découler du territoire (accompli/maîtrisé/serein/premium/compris), pas de l'héritage du logo orange actuel. Ne pas verrouiller l'orange par défaut.
- Méthode : Jonathan envoie 2-3 images dont il aime l'ambiance de couleur → Claude extrait crème/blanc chaud (fond), noir/anthracite (sombre prestige), accent, + couleurs d'état → propose palette complète à valider.

**Étape 3 — Couleur : DÉCISION MÛRE = MONOCHROME STRICT (2026-06-26).** Jonathan a rejeté émeraude/or en boutons (j'avais pris Lacoste/Rolex trop littéralement ; le vert fatigue à l'usage quotidien). Décision : **AUCUNE couleur de marque dans l'UI** (luxe par la retenue, Jony Ive). Noir chaud + blanc chaud + gris, point. **Bouton d'action = blanc chaud #EDE7DA.** L'**or (#C6A86E) n'existe QUE dans les illustrations gravées**, jamais dans l'interface. Monde **sombre** confirmé (clair = option plus tard). Ne JAMAIS réintroduire vert/or/orange comme accent UI.

**Étape 6 — Imagerie : ADN illustration SCELLÉ (2026-06-26).** Voir [[project_brvndlab_illustration_style_sealed]]. Style = anime/concept-art picturale moderne lumineuse. Login illustration validée. Illustrations = couche émotionnelle, placées aux moments d'introspection.

**Carte des illustrations (placements, à enrichir) :** Login ✅ · Brainstorming (à préciser) · Brand OS — 1 image par carte (histoire, audience, problème, positionnement, offre, mission, objectif, valeur) · états vides. Génération EN LOT à la fin (après UI + formats).

**Reste à faire (mood board) :** étape 4 Typographie (serif vs mono — non tranché) · étape 5 Langage visuel UI (arrondis, ombres, espacements, détails) · étape 7 Composants · étape 8 Logo & marques. Puis livrable Vercel + génération illustrations.

**Étape 4 — Typographie : SCELLÉE (2026-06-26).** « Précision maîtrisée » → sans-serif moderne. **Satoshi** (gratuit, Fontshare) pour tout le produit (titres en Black 900, texte en Regular/Medium). **Monospace (JetBrains Mono)** en accent sur chiffres/labels/métadonnées (honore le goût mono de Jonathan sans nuire à la lecture). Résout le débat serif vs mono = ni l'un ni l'autre, sans précis. Validé "à fond".

**Étape 5 — Langage visuel : SCELLÉ (2026-06-26).** Validé "choqué/incroyable" via mockup login+accueil. Arrondis nets-mais-doux (cartes 14px · boutons 11px · pills 20px) · ombres profondes basses (pas de halo) · espacements généreux · UN seul bouton plein par écran = blanc chaud (#EDE7DA, la couleur vit dans les illustrations) · mono sur données/labels. Login = illustration plein cadre + dégradé sombre + UI posée dessus. Accueil = illustration en bannière + UI neutre autour (chaque emplacement a SA propre illustration, pas de réutilisation).

**Étape 8 — Logo & marques : SCELLÉ (2026-06-26).** On GARDE le logo existant Brvndlab = mark de **6 formes en « Y » qui rayonnent en cercle** (communauté/contenu qui ramène à soi). MAIS on abandonne le traitement glossy/dégradé orange (ancienne direction cliché). Nouveau traitement = **monochrome blanc chaud (#EDE7DA) plat sur fond sombre.** La couleur reste dans les illustrations, jamais dans le logo. Orthographe « Br**v**ndlab » avec le V = signature non négociable.

**MOOD BOARD COMPLET (8/8 étapes scellées).** Prochaine phase = assemblage du livrable Vercel (consolide tout) + carte des illustrations + génération en lot + application aux sections Brvndlab.

Liens : [[project_brvndlab_assistant_first_direction]] (direction produit assistant-first), [[project_brvndlab_visual_polish_phase]] (phase polish dark mode Mochi), [[feedback_brvndlab_repo_path_and_git_rules]] (repo + git), [[feedback_brvndlab_work_directly_on_prod]] / [[feedback_brvndlab_preview_first_mode_loupe]] (règles deploy).
