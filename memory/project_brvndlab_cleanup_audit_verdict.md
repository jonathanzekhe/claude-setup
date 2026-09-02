---
name: Brvndlab cleanup commit 36548c1 — audit Hermes validé 27/05
description: Verdict de l'audit Hermes sur le commit `36548c1` (suppression wrappers mock + 501 stubs). Validé global. 3 dettes mineures restantes documentées.
type: project
originSessionId: 5f2c71e5-ba49-447e-b6aa-af7048d1c61a
---
Commit `36548c1` sur `jonathanzekhe/brvndlab` branche `main`, ré-audité par Hermes après son fix OAuth Codex le 27/05/2026.

**Verdict** : travail validé. Le théâtre mock est bien supprimé, la prod répond 501 sur les 10 routes IA, `@anthropic-ai/sdk` n'est plus installé, build OK (117 pages générées).

**Vérifié** (par Hermes) :
- 4 fichiers wrappers supprimés (hermes-proxy, hermes-server, hermes-client, claudeWrapper)
- 10 routes /api/* retournent bien `{"ok":false,"error":"AI integration not yet implemented","status":"not_wired"}` en 501
- `npm ls @anthropic-ai/sdk` retourne vide
- Prod app.brvndlab.com cohérente

**3 dettes mineures listées par Hermes — PURGÉES dans commit `2f16e10` le 27/05/2026** (-371 lignes net, zéro changement fonctionnel, déployé prod, smoke tests OK) :
1. **Blocs Anthropic commentés** dans `src/app/api/analyze-pdf/route.ts` et `src/app/api/analyze-video/route.ts` — du vieux code "ORIGINAL ANTHROPIC CODE" en commentaire, pas exécuté mais pollue la lecture
2. **Messages Convex "ANTHROPIC_API_KEY manquant"** dans `convex/radarActions.ts` et `convex/radarEnrichment.ts` — wording historique faux (rien n'appelle Anthropic), remplacer par "AI integration not yet implemented"
3. **Constantes `MODEL = "claude-..."`** qui traînent — pas bloquant mais entretient l'ambiguïté sur le provider

**How to apply** : si Jonathan demande "finalise le nettoyage Brvndlab" ou "purge le résidu Anthropic", attaquer ces 3 points en un commit. Sinon laisser dormir.

**STATUT 27/05 17h17 CEST** : tous les 3 points adressés via commit `2f16e10`. Plus de dette résiduelle identifiée par Hermes côté Brvndlab.

**ROUND 2 27/05 17h35 CEST** : 2e audit Hermes a flaggé 2 résidus que j'avais laissés par excès de conservatisme ("aucun changement fonctionnel") :
- Checks `process.env.ANTHROPIC_API_KEY` restants dans `convex/radarActions.ts` + `convex/radarEnrichment.ts` (jamais set, dead code)
- Message "migration en cours vers Hermes proxy" dans `analyze-pdf`/`analyze-video` (proxy déjà supprimé)

Purgés via commit `9cd775c`. Plus aucune mention `ANTHROPIC_API_KEY` ni `Hermes proxy` dans le code Brvndlab. Tous les handlers AI affichent désormais "AI integration not yet implemented" uniformément.

**Leçon** : quand Hermes flag du wording faux, ne pas être trop conservateur sur "aucun changement fonctionnel" — supprimer carrément le dead code (env checks qui ne pourront jamais être true) est OK tant que le comportement user-observable reste identique (toujours early-return en erreur).

**CLÔTURE OFFICIELLE 27/05 17h45 CEST** : 3e audit Hermes formellement validé. Plus aucune référence ANTHROPIC_API_KEY / @anthropic-ai/sdk / anthropic.messages.create / ORIGINAL ANTHROPIC CODE / generateMockResponse / HERMES FALLBACK / Cost:$0 / Claude Max / "migration vers Hermes proxy" dans le repo. Build OK, prod OK, routes uniformément "AI integration not yet implemented". Sujet Brvndlab fermé.

**Détail laissé volontairement** (non bloquant, flag Hermes "pas besoin de rouvrir maintenant") : phrases `"Analyse PDF temporairement désactivée pendant la migration."` (dans le `fallback.summary` de `analyze-pdf/route.ts`) et `"Analyse vidéo temporairement désactivée pendant la migration."` (dans le `fallback.transcript` de `analyze-video/route.ts`). Le mot "migration" est légèrement trompeur (rien n'est en migration, c'est juste pas implémenté). Si on rouvre ces 2 fichiers un jour, remplacer par `"... temporairement indisponible."`.
