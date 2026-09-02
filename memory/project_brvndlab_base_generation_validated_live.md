---
name: project_brvndlab_base_generation_validated_live
description: "SCELLÉ - la base de génération Brvndlab (dégraissée, simple+factuel) validée en live sur les 3 formats, cliente + Jonathan"
metadata:
  node_type: memory
  type: project
  originSessionId: 429ff311-7ceb-4dfb-8ddc-eb51181af3ad
---

**SCELLÉ le 2026-07-24 — la base de génération est VALIDÉE en production.** Ne plus la retoucher sans demande explicite de Jonathan.

Validation terrain (la vraie preuve, pas un test à l'aveugle) : testée plusieurs fois avec une CLIENTE + une fois par Jonathan, sur les 3 formats (script, story, carousel), plusieurs formes de contenu. Verdict Jonathan : "très, très, très fort... y'a rien à dire. Là, on a trouvé ce qu'il faut." La régularité (même standard à chaque tir) et la qualité (hook d'identification, simple+factuel, zéro style imposé, zéro promo IA) sont confirmées.

**Ce qui a résolu l'instabilité :** dégraissage total. Prompt passé de ~3000 à ~500 mots, suppression de la contradiction "sois tranchant/qui claque" VS "reste plat sans style" (le modèle tranchait au hasard = un tir bon, un tir nul). Piloté par CONTENT_RULES (4 principes positifs), les routes n'ajoutent que la mécanique de format. Commit e73b03ee sur feat/refonte-brainstorming.

**Où c'est codé :** src/lib/ai/chatRules.ts (CONTENT_RULES, SURGICAL_OUTPUT, CHAT_CONDUCT) propagé aux 3 formats via generate-script/carousel/story + story-slide. Voir [[project_brvndlab_tableau_base_vs_voix]] (le tableau expertise vs voix perso, source de vérité) et [[project_brvndlab_generation_base_neutre_solide]] (les règles fermes).

**Principe maître verrouillé :** SIMPLE ET FACTUEL. La base = expertise universelle de Jonathan (hook d'identification, structure logique, solution amenée sans promo, AUCUNE figure de style). La voix perso (antithèses, paraboles, formules-choc, familiarité) = laissée à chaque client via sa seconde brain, jamais imposée dans la base.
