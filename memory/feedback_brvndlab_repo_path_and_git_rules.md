---
name: feedback_brvndlab_repo_path_and_git_rules
description: Repo Brvndlab canonique = ~/dev/brvndlab-claude (PAS ~/Documents) + règles de commit git anti-freeze
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 891eaab9-8ef6-4fcf-a347-420863b4ac39
---

**Repo canonique Brvndlab (depuis 2026-06-13, fix Hermes) :**
- App : `~/dev/brvndlab-claude/brvndlab-app`
- **NE PLUS utiliser** `~/Documents/Claude AI/Brvndlab/brvndlab-app` : sous iCloud Drive (Documents synchro), git s'y **fige** (commit/status/du pendent indéfiniment, process git s'empilent).

**Règles git obligatoires (sinon freeze) :**
- **Jamais** `git commit -m` multi-lignes via le wrapper eval du harness : une **apostrophe** dans le message casse le quoting → git attend stdin → wedge → tous les git suivants bloquent.
- **Toujours** `git commit -F /tmp/message.txt`, idéalement `gtimeout 60 git commit -F /tmp/message.txt`.
- `gtimeout` dispo (coreutils via brew). `git config --global core.editor true` + `core.pager cat` posés par Hermes.
- Si git pend : `pkill -9 git` puis `rm -f .git/index.lock`.

**Why :** environnement macOS + Documents iCloud + quoting eval = combo qui gèle git. Réglé par Hermes le 2026-06-13.

**Divergence à clarifier avec Jonathan avant tout deploy depuis ce repo :** `~/dev/brvndlab-claude` est en **clair uniquement** (couleurs en dur, pas de tokens), branche `hermes/audit-nonbloquant`. L'ancien repo Documents était sur `feat/dark-mode` (tokens var(--…)). Vérifier quelle lignée alimente la prod avant de redéployer — déployer le repo clair ferait **perdre le dark mode** en prod. Voir [[project_brvndlab_local_vs_github_divergence]], [[feedback_brvndlab_prelaunch_ship_direct]].

**Stash à préserver (17/08/2026)** : `stash@{0}` « On feat/script-references: wip-avant-plus-flat » = WIP de 116 lignes sur `angles/[id]/recap/page.tsx`, issu de la branche `feat/script-references` (session antérieure, propriétaire inconnu). NE PAS le drop sans vérifier si cette branche compte encore. Un `stash pop` de ce stash a déjà créé un conflit surprise dans le worktree partagé le 17/08. Plusieurs sessions Claude travaillent en parallèle dans ce repo : jamais d'opération git GLOBALE (checkout ., stash pop/clear, reset) sans vérifier `git status` et se coordonner via SendMessage avec les sessions listées par ListAgents.
