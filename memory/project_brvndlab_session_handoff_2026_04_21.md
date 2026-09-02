---
name: Brvndlab session handoff 2026-04-21
description: Etat complet du backend + frontend a la fin de la session du 21 avril pour reprendre proprement
type: project
originSessionId: d20c1ad6-25c2-4284-9ee1-b6f59ff05e86
---
Session du 2026-04-21 interrompue parce que Jonathan bosse en parallele dans une autre conversation sur le SaaS. On reprend ici quand il revient.

**Why:** Eviter les conflits de deploy Convex et les editions de fichiers qui s'ecrasent entre deux sessions simultanees. Cette memoire capture tout ce qui est deploye, tout ce qui est code mais non deploye, et tout ce qui reste a faire.

**How to apply:** Quand Jonathan reprend cette conversation (ou une nouvelle), lire ce fichier en premier pour savoir exactement ou on en est avant de toucher au code.

## Ce qui est LIVE en prod (deja deploye, ne pas refaire)

Backend Convex prod (`accurate-cormorant-297`) :
- 5 nouvelles tables : `contentMetrics`, `researchQueries`, `researchResults`, `marketSignals`, `competitorTracking`
- 2 tables Performance OS : `sales`, `payments`
- 4 champs ajoutes a `contentItems` : `publishedUrl`, `publishedExternalId`, `lastMetricsFetchAt` + index `by_published_external_id`
- `convex/clientIntelligence.ts` (complet, deja live)
- `convex/research.ts` + `researchActions.ts` (Claude web search)
- `convex/radar.ts` + `radarActions.ts` (YouTube Data API public)
- `convex/contentMetrics.ts` + `contentMetricsActions.ts` (YouTube stats fetcher)
- `convex/performance.ts` (CA / Cash / MRR / Clients)
- `convex/dashboards.ts` (getCoachDashboardSummary + getClientDashboardSummary)
- `convex/healthCheck.ts` (getSystemHealth)
- `convex/crons.ts` (2 daily jobs : radar scan 6h UTC, youtube metrics refresh 5h UTC)
- Audit backend : 12 mutations publiques non-sécurisées converties en internalMutation (fixVideoDurations, migrateOffers, reset*, remove*, seed*, reorderBrandOs, notifications.create)

Env vars set en prod :
- YOUTUBE_API_KEY, ANTHROPIC_API_KEY, RADAR_COACH_CLERK_ID (user_3CaB4NBRnQBy0vDGkydiSNzWdP3), RADAR_KEYWORDS_FR, RADAR_KEYWORDS_EN, CLERK_SECRET_KEY, RESEND_API_KEY, APP_PUBLIC_URL

Integrations live :
- Resend : domaine `brvndlab.com` verifie, emails invitation + revocation fonctionnent
- Clerk : allowlist add/remove operationnel
- Anthropic Claude : research avec web search configure
- YouTube Data API v3 : radar a deja scanne et insere des signaux reels

## Ce qui est CODE mais PAS DEPLOYE en prod

**Feature PDF upload dans Inspiration (prioritaire pour Jonathan) :**
- Backend : `src/app/api/analyze-pdf/route.ts` (nouveau, uses Claude doc block natif)
- Frontend : `src/app/(app)/content/new/inspiration/page.tsx` modifie avec :
  - Toggle Video / PDF
  - File upload avec preview
  - Max 32 MB
  - Messages de statut adaptes
  - Carte resultat avec badge PDF + type + pages + resume
  - Section "Citations fortes extraites" (keyQuotes)
  - Boutons Brainstorm/Script adaptes au PDF
- Etat : code complet, typecheck OK (sauf 2 erreurs pre-existantes dans brand-os/edit). Pas encore deploye sur Vercel.

**Radar AI enrichment (complete, deploye backend Convex mais pas en prod encore) :**
- `convex/radarEnrichment.ts` : enrichSignal, enrichAllPending, cronEnrichFromEnv
- Ajoute a `convex/radar.ts` : _getSignalInternal, _updateSignalEnrichment, _listPendingEnrichment
- Scorer de relevance 0-100, tags IA, resume FR pour chaque signal marketSignal
- Deploye sur prod Convex, mais pas encore branche au cron (pas dans crons.ts)

## Ce qui reste a faire quand on reprend

### Priorite 1 : Feature PDF
1. Deployer frontend Vercel pour activer `/api/analyze-pdf`
2. Tester avec un vrai PDF (texte et scan d'images)
3. Valider que le flow PDF -> resultats -> brainstorm/script fonctionne end-to-end

### Priorite 2 : Finir Radar AI enrichment
1. Ajouter le cron `radar enrichment daily` dans `convex/crons.ts`
2. Trigger initial pour enrichir les signaux deja scannes en prod
3. Tester 3x

### Priorite 3 : Fix pre-existants
2 erreurs TypeScript pre-existantes dans `src/app/(app)/brand-os/edit/page.tsx` lignes 286-287 (Promise<null> vs Promise<void> sur ReactMutation). Non bloquant mais a nettoyer.

### Priorite 4 : Roadmap strategique discutee
- Marche BR (portugais) : valide par Jonathan comme "pas maintenant, peut-etre dans 2-3 mois". Schema permet l'ajout en 10 lignes.
- OAuth YouTube prive (watch time / retention) : Sprint 2 de la roadmap, bloque par le frontend.
- TikTok OAuth : idem Sprint 2.
- Instagram : bloque par privacy policy publique sur brvndlab.com + Meta Review.

## Regles actives dans la session (deja saved en memoire dedies)
- Regle 3 tests backend : toute erreur = fix + 3 tests obligatoires
- Autonomie maximale : pas de back-and-forth, tu decides et tu executes
- Ne jamais reecrire fichier existant sans demande explicite
- Voix Brvndlab : "on" jamais "je", zero em-dash, accents completes

## Rappel pour la prochaine session

Avant de toucher au code Convex :
1. `git pull` ou verifier que l'autre session n'a pas fait de commit
2. `git status` pour voir les modifications en cours
3. `npx convex env list --prod` pour verifier que les env vars sont toujours la
4. Verifier que le fichier `src/app/(app)/content/new/inspiration/page.tsx` contient bien le toggle PDF
5. Si oui, deployer Vercel

Le fichier Next.js `inspiration/page.tsx` a les modifs locales non commitees. Si l'autre session edite ce fichier, risque de conflit git.
