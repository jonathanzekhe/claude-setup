---
name: project_brvndlab_local_vs_github_divergence
description: Le repo local Brvndlab et GitHub main ont divergé au 1er commit ; GitHub main = vraie source prod
metadata: 
  node_type: memory
  type: project
  originSessionId: b5389008-ebc1-497f-9099-0755ff875315
---

Le repo local `Documents/Claude AI/Brvndlab` (.git à la racine `Brvndlab/`, app dans `brvndlab-app/`) et le **GitHub main ont divergé dès le 1er commit (9f4d187, 6 mai 2026)** — deux lignes parallèles, ancêtre commun = la racine uniquement.

- **GitHub `main` = la VRAIE source prod** (confirmé par Jonathan 05/06). Ligne du CTO : angles cards V3, brainstorm IA, backend Convex. **PAS** de système de tokens CSS, pas de ThemeProvider.
- **Local `main`** = ligne parallèle (token system, dark foundation, settings Section/Row redesign, motion atoms) **jamais mergée sur GitHub**. Ne pas supposer que le local = prod.

**Workflow pour livrer du code prod Brvndlab :**
1. Toujours partir de `origin/main` (GitHub), pas du local main.
2. Brancher + PR + review CTO. **Jamais de force-push sur main** (écraserait le travail CTO).
3. Déploiement : `.github/workflows/vercel-deploy.yml` se déclenche **sur push main/master uniquement** (pas sur PR). Pas d'intégration Vercel-GitHub pour preview auto. Preview = `vercel deploy` CLI manuel.

**Piège git rencontré :** un ref corrompu `refs/heads/main 2` (artefact duplication macOS/iCloud, perms 600) cassait `git fetch` ("bad object refs/heads/main 2"). Fix : `rm ".git/refs/heads/main 2"`.

Voir [[feedback_always_push_to_vercel]], [[project_brvndlab_vercel_no_autodeploy]].
