---
name: Toujours push pour que Vercel déploie
description: Après chaque modification Brvndlab/VividFlow, faire git push origin main immédiatement. Commit local seul = invisible côté CTO.
type: feedback
originSessionId: a578cb92-6555-47d4-b434-8e33654fe02e
---
Après chaque modification de code sur Brvndlab ou VividFlow, **toujours pusher** vers origin main pour déclencher le déploiement Vercel automatique. Pas seulement commit.

**Why:** Jonathan partage l'URL live avec son CTO dev. Si le push n'a pas eu lieu, le CTO voit l'ancienne version, le user croit que c'est fait alors que rien n'a bougé en prod. Mauvaise expérience + perte de confiance.

**How to apply:**
- Workflow obligatoire : edit → commit → push → vérifier live.
- Ne JAMAIS livrer un "j'ai fini" sans avoir poussé.
- Combiner avec la règle `feedback_verify_until_live.md` : après push, vérifier que `app.brvndlab.com` (ou l'URL Vercel concernée) sert bien la nouvelle version.
- Si Convex est touché (schema, fonctions backend), prévenir Jonathan qu'il faut aussi `npx convex deploy` séparément (Vercel ne le fait pas).
