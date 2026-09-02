---
name: feedback_brvndlab_one_vercel_moodboard
description: "Un seul projet Vercel pour les mockups Brvndlab = le mood board officiel, jamais de nouveau projet par mockup"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 03adbfc3-e0b4-4f12-87ce-d3de3ed326f9
---

Pour la refonte Brvndlab, **un seul projet Vercel** : le mood board officiel **https://brvndlab-moodboard.vercel.app** (projet `brvndlab-moodboard`, URL prod stable). On travaille TOUJOURS dessus ; quand un mockup est validé, je l'intègre dans le mood board (dossier `screens/` en local + onglet) et je redéploie le mood board. **Jamais un nouveau projet Vercel par mockup.**

**Why:** J'avais créé ~44 projets Vercel (un par mockup/variante) → pollution, quotas non illimités, Jonathan saturé (2026-06-29). Supprimés via API (`DELETE /v9/projects/<name>?teamId=team_GTs1MknPmT57qmmhxdVCv0sl`, token dans ~/Library/Application Support/com.vercel.cli/auth.json). Le mood board est auto-suffisant : les écrans vivent en local dans `screens/`, donc supprimer les autres projets n'efface rien.

**How to apply:**
- Itérer = éditer les fichiers dans `~/.../scratchpad/brvndlab-moodboard/screens/` (ou un seul fichier de travail) et redéployer le MÊME projet, pas en créer un nouveau.
- Déployer en prod (`vercel --prod --yes --scope jonathanzekhe-4288s-projects`) pour garder l'URL stable `brvndlab-moodboard.vercel.app`. `vercel project rm` est interactif → supprimer via l'API.
- Garder intacts : `brvndlab-app` (vraie app, app.brvndlab.com), `brainstorm-portfolio` (carnet), projets VividFlow.
- Limiter les déploiements inutiles (gigas non illimités). Voir [[feedback_always_link_preview_url]].
