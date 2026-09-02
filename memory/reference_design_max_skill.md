---
name: reference-design-max-skill
description: "Skill design-max — stack de design consolidé (7 sources + 2 profils marque), trigger \"active le skills de design\""
metadata: 
  node_type: memory
  type: reference
  originSessionId: 3c8563e0-21e4-4222-bae8-9b205032a4bf
---

Skill perso **`design-max`** dans `~/.claude/skills/design-max/`. Une seule skill qui fusionne tout le craft design.

**Trigger maître :** « active le skills de design » (ou « active design ») charge la stack complète. Déclenche aussi sur tout travail UI/UX/frontend/mockup/deck/motion/polish.

**Contenu :**
- `SKILL.md` = orchestrateur + doctrine anti-slop fusionnée + garde-fous Jonathan.
- `references/` = sources bundlées : `impeccable.md` (bans absolus + 23 commandes), `taste.md`, `motion-emil.md` (Emil Kowalski), `frontend-design.md` (Anthropic), `ui-ux-pro-max.md`, lentilles taste (minimalist/brutalist/soft/redesign), 3 skills Anthropic (canvas-design/brand-guidelines/theme-factory).
- `references/brand-vividflow.md` + `references/brand-brvndlab.md` = profils de marque extraits de la mémoire (DA, voix, design system, garde-fous). Cf. [[project_vividflow_positionnement_officiel]], [[project_brvndlab_radius_hierarchy]], [[feedback_no_em_dash]].

Skills d'origine `ui-ux-pro-max` et plugin `frontend-design` conservées intactes ; design-max les fusionne et étend. Pour mettre à jour la DA d'une marque : éditer le fichier `brand-*.md` correspondant.
