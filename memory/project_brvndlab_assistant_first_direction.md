---
name: project_brvndlab_assistant_first_direction
description: "Brvndlab pivote assistant-first : home = chat brainstorm immersif, bras droit IA contenu qui redirige + connaît le SAS. North star = vulgariser la création de contenu."
metadata: 
  node_type: memory
  type: project
  originSessionId: bb724bd8-efb2-432a-86b3-2c6f054670da
---

**North star (gravé par Jonathan le 2026-06-22, « n'oublie jamais ça ») :** vulgariser la création de contenu pour la rendre **accessible à tous**, grâce à un **bras droit IA spécialisé création de contenu**. Tout choix produit/UX se juge à cette aune : si ça complexifie pour un peu-initié, c'est non.

**Décision de direction (validée 2026-06-22) : ASSISTANT-FIRST, pas modules-first.** Le centre de gravité du produit, c'est l'IA, pas la structure de modules. On arrive dans l'app sur un **chat de brainstorm immersif** (DA validée = variante C : dark #0A0A09 + halo orange, badge « Mode brainstorm », barre qui glow, tuiles « Démarrer »). Les modules existent toujours mais deviennent les rails et les données de l'assistant, pas la porte d'entrée. La sidebar reste (navigation de secours pour power-users), mais l'assistant est la porte + l'orchestrateur.

**Mécanique clé : brainstorm = aussi session de redirection.** L'assistant ne tchatte pas dans le vide (sinon = substitut à Claude qui crame des tokens). Il cadre l'intention puis jette l'utilisateur sur les rails structurés déjà bâtis (script / carousel / story). Le gros du travail reste dans les générateurs, pas le chat ouvert.

**Cerveau unifié, connaissance tiérée par offre (validé) :** UN seul assistant (pas deux cerveaux séparés contenu vs business). La VALEUR est à l'intersection (« ce contenu t'a ramené 12 leads, refais cet angle » = contenu × business). C'est la *donnée qu'il peut lire* qui est gated : contenu pour tous, leads/cash/perf débloqués avec la 2e offre. Bonus = upsell natif. Build étagé : palier 1 home immersive + redirection cards ; palier 2 redirection par le texte (classifier l'intention tapée) ; palier 3 couche contenu (quel angle marche) puis couche business (leads/cash, gated + permissions).

**Formats gardés : Script vidéo, Carousel, Story.** **Q&A retiré** (temporaire). **Mon script retiré** (officiel/définitif). Voir l'archi des portes/brainstorms dans [[project_brvndlab_script_video_flow]]. Mockup 3 variantes : `~/Documents/Claude AI/brvndlab-mockups/brvndlab-accueil-chat.html` (A épuré / B structuré / C immersif retenu).

**SCOPE SCELLÉ (2026-06-23) : Brvndlab = création de contenu PURE.** Plus de tracking/business. ICP = entrepreneurs + créateurs qui veulent du **contenu chirurgical** autour de leur personal brand (vendre une offre OU raconter / apporter de la valeur). Le brainstorm + le Brand OS = l'âme. Décision : **SPLIT** le tracking dans un produit à part (2e SaaS type Trackyo qui s'intégrerait à Brvndlab plus tard) plutôt que le garder dans le dashboard (deux produits qui se battaient).

**Tâches de suppression (à pousser au prochain build, PAS encore fait) :** retirer intégrations Stripe + toutes les intégrations, vue Ventes/transactions, Leads, Smart Links + tracking de liens. Nettoyer la sidebar du groupe "perf/business". On garde Home(brainstorm) · Brand OS · Pipeline · Calendrier · Journal.

**Home = on arrive DIRECT dans l'ambiance brainstorm** (même visuel que cliquer Carousel/Script vidéo aujourd'hui : sombre immersif, typo centrée). **PLUS de label "Mode brainstorm"** : le brainstorm EST le produit, pas un mode. Question d'ouverture ("on prépare quoi aujourd'hui ?") + présélection du format (script / carousel / story) DANS ce cadre. Story garde ses 3 questions. Lien mockup canonique : [[reference_brvndlab_mockups_public_url]] (brvndlab-home).

**How to apply :** on avance **étape par étape**, validation explicite à chaque palier. DA Brvndlab via [[reference_design_max_skill]]. Déploiement prod via la branche active `claude/brandos-server-enforcement` (cf. [[feedback_verify_deploy_lineage_before_prod]]). Mockups d'abord, jamais de prod sans validation.
