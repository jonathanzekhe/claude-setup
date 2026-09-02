---
name: feedback-skill-correction-saas
description: "Skill /correction-saas (~/.claude/skills/correction-saas) = la méthode de travail par défaut de Jonathan sur son SaaS : il parcourt le produit en vocal pendant que Claude corrige, chaque point va dans une todo vivante, déployé en prod et vérifié sur le live avant d'être coché"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 2b34b718-d265-4ec1-b7dc-5707d62d9063
  modified: 2026-08-27T06:58:57.466Z
---

**La manière de travailler de Jonathan sur son produit est scellée dans le skill `correction-saas`** (`~/.claude/skills/correction-saas/SKILL.md`, créé le 27/08/2026 à sa demande).

Le sujet n'est PAS le mot de validation, c'est **le travail de fond** : passer le SaaS au peigne fin section par section et corriger tous ses défauts (visuel, interaction, état vide, chargement, logique, incohérence).

La mécanique qu'il a explicitement décrite : **il continue de parler pendant que Claude corrige**. Chaque nouveau point s'ajoute à la todo sans interrompre le travail en cours, Claude annonce ce qui est fini **au fil de l'eau** (jamais un seul compte rendu à la fin), et enchaîne. La todo vit en permanence, il ne doit jamais répéter un point ni demander où on en est.

Chaque point suit le même trajet : trouver la vraie cause dans le vrai code → corriger au plus court → déployer jusqu'en prod (Convex puis Vercel) → **vérifier sur le live soi-même** (compte robot Playwright, mesures réelles) → dire ce qui est réparé et où le constater.

**Why :** il a passé des sessions entières dans ce mode et veut le retrouver d'un mot. Ce qu'il rejette : les plans à valider avant d'agir, les questions de confort, « c'est fait » sans preuve, et les corrections qui se perdent entre deux vocaux.

**How to apply :** invoquer `/correction-saas` dès qu'une session enchaîne des retours produit. Se combine avec [[feedback-brvndlab-confirm-dialog-scelle]] (DA scellée), [[reference-e2e-robot-brvndlab]] (vérif live), [[feedback-brvndlab-repo-path-and-git-rules]] (repo), [[feedback-toujours-verifier-le-live-avec-un-agent]].
