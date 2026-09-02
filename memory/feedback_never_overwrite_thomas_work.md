---
name: feedback_never_overwrite_thomas_work
description: "Jamais écraser le travail de Thomas (ni l'inverse) — rebase/complémenter, jamais remplacer"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 85669be3-5f8f-465a-b4ca-9c318860b9c4
  modified: 2026-07-26T13:53:29.348Z
---

Thomas (CTO, [[user_thomas_cto]]) et Jonathan/moi poussons sur le MÊME repo GitHub (`jonathanzekhe/brvndlab`, branche main) mais travaillons TOUJOURS sur des choses différentes. Règle absolue, pour TOUT :

**Ne JAMAIS écraser le travail de l'autre. Dans les deux sens.** Ce que Thomas a poussé, je le garde. Ce que Jonathan/moi ai fait, ça ne doit jamais être écrasé par un push de Thomas.

**Why:** ils ne travaillent jamais sur le même fichier/la même feature, donc les deux versions doivent coexister. Un `git push --force` ou un reset écraserait le travail de l'autre = perte sèche.

**How to apply:** avant tout push, `git fetch origin main` puis `git rebase origin/main` (JAMAIS force-push). Le rebase empile mon travail au-dessus du sien sans rien perdre. Après rebase, vérifier que MON travail est intact ET que le sien est présent (grep les deux domaines dans les fichiers partagés comme `schema.ts`). Si conflit sur un fichier partagé (schema.ts, api.d.ts), fusionner les deux, jamais choisir un côté. Exemple vécu 26/07 : Thomas avait poussé Journal v2 (journalEntries/Folders, schema, mobile nav) après mon push Brand OS ; rebase propre → les deux coexistent, build ✓. Voir [[feedback_brvndlab_repo_path_and_git_rules]].
