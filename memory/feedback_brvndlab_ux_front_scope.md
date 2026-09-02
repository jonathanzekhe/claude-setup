---
name: Brvndlab UX/front — scope strict + mode de travail
description: Règles dur pour tout chantier UX/front Brvndlab post-27/05. Architecture LLM gelée (501/not_wired), uniquement optimiser l'existant, Jonathan = QA, moi = exécution, Hermes = audit.
type: feedback
originSessionId: 5f2c71e5-ba49-447e-b6aa-af7048d1c61a
---
Mode de travail validé le 27/05/2026 :
- **Jonathan** = contrôle qualité / audit froid après chaque change (code, build, prod, parcours utilisateur, cohérence Brand OS → création de contenu)
- **Moi (Claude Code)** = exécution UX/front Brvndlab
- **Hermes** = audit technique à la demande de Jonathan
- Chaque "c'est fini" de ma part = résumé clair fichiers modifiés que Jonathan vérifie

**Scope strict UX/front Brvndlab** (à respecter à la lettre) :
1. **Optimiser les sections existantes uniquement.** Aucune nouvelle section sans validation explicite de Jonathan.
2. **Ne JAMAIS toucher à l'architecture LLM.** Les endpoints AI restent en `501 AI integration not yet implemented` ou `503` selon le handler tant que Jonathan n'a pas décidé d'une vraie intégration LLM client.
3. **Interdictions absolues** (pour ne pas refaire l'hémorragie OpenRouter du 27/05) :
   - Pas de mock IA réintroduit (`generateMockResponse`, `HERMES FALLBACK`, etc.)
   - Pas de `hermes-proxy`, `hermes-server`, `hermes-client`, `claudeWrapper`
   - Pas d'`@anthropic-ai/sdk` ni API Anthropic directe
   - Pas d'OpenRouter (clé, env, code, fallback)
   - Pas de phrase trompeuse "Cost: $0 via Claude Max" ou équivalent
4. **Améliorer la clarté du parcours Brand OS → création de contenu** est l'axe prioritaire UX.
5. **Workflow post-change obligatoire** :
   - `npm run build` ou typecheck local OK
   - `vercel deploy --prod --yes` depuis VPS (auto-deploy GitHub cassé, voir mémoire dédiée)
   - Smoke test prod (curl ou browser) sur les sections touchées
   - Résumé fichiers modifiés livré à Jonathan

**Why** : Jonathan vient de stopper une hémorragie de ~1000€/mois (OpenRouter) causée par des décisions IA non maîtrisées. Il veut maintenant pouvoir bosser sur l'UX/front en confiance, sans craindre que des décisions automatiques (mocks, fallbacks, "migrations" inventées) ré-introduisent du code trompeur ou des coûts incontrôlés.

**How to apply** :
- Avant toute modif Brvndlab front/UX : grep le scope ci-dessus mentalement, vérifier qu'aucune des 3 interdictions n'est touchée
- Si la demande Jonathan implique de toucher au LLM, **stopper et demander confirmation explicite** avant d'agir
- Si on ajoute une nouvelle section/page sans qu'elle soit dans le brief : **stopper, montrer la maquette, attendre validation**
- Toujours commit + push + `vercel deploy --prod --yes` (sinon Vercel ne build pas, voir mémoire `project_brvndlab_vercel_no_autodeploy.md`)
