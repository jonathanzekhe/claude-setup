---
name: VividFlow — écosystème 9 agents IA
description: Casting des 9 agents IA du site VividFlow + emplacement assets + pattern UI validé
type: project
originSessionId: 5b16ae01-2d64-4c7a-b0bb-48196b427279
---
**9 agents IA validés** (ordre canonique + rôle) :
1. Amani — Agent commercial
2. Mei — Agent support client
3. Akira — Agent analyse
4. Nia — Agent administratif
5. Sora — Agent contenu
6. Imani — Agent relance
7. Kenzo — Agent opérations
8. Aya — Agent RH · onboarding
9. Zulu — Agent d'exécution

**Assets visuels** : `~/Documents/Claude AI/VividFlow/PERSONA - AI AGENT/`
- `{NOM}.png` = avatar profil-cercle (rangée)
- `{NOM} DEBOUT.png` = portrait full-body anime cel-shaded, fond transparent, 3394×4525

**Pattern UI section "Agents" validé** (fichier `site-mockups/agents-interactive.html`) :
- Rangée 9 avatars cliquables + tooltip rôle au hover + auto-rotate
- Panneau coloré (couleur unique par agent) qui change selon agent actif
- Portrait full-body en `position: absolute; bottom: 0; width: 600px` qui flotte sur le panneau, tête déborde au-dessus
- Per-agent `portraitScale` (1.04-1.08) pour les portraits dont le canvas a plus de padding interne

**Why:** Section finalisée après ~15 itérations de design (couleurs, cadrage, prompts image-gen, scale individuel). Le pattern est scellé.
**How to apply:** Quand on retravaille cette section, ne pas re-proposer d'autres layouts (cards, bento, slider). Pour ajouter/modifier un agent : éditer la data dans agents-interactive.html, fournir avatar + DEBOUT, ajuster portraitScale si besoin.
