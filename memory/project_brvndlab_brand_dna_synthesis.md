---
name: Brvndlab Brand DNA synthesis layer (convex/brandDna.ts)
description: Aggregation query getBrandDna that turns brandOsResponses into typed BrandDna shape — central source for future LLM prompts.
type: project
originSessionId: 5f2c71e5-ba49-447e-b6aa-af7048d1c61a
---
`convex/brandDna.ts` exposes the query `api.brandDna.getBrandDna` which aggregates a user's brandOsResponses into a typed `BrandDna` object: promesse, audience, desirs, douleurs, objections (null — no clean source field), differenciation, offre, mission, valeurs[], ton, motsSignature[], motsAEviter[], styleEcriture, personas[], rawByModule, completionScore.

**Why:** The Brand OS was a silo — 12 modules collecting responses with zero downstream consumption. Without a synthesis layer, every future LLM integration would have to re-derive structure from raw answers. This is the single source of truth that all future prompts (scripts, brainstorms, carrousels) must inject.

**How to apply:** When wiring any AI route under `src/app/api/*` that needs brand context, call `api.brandDna.getBrandDna` first and inject the returned shape into the prompt. If a structured field is `null`, fall back to `rawByModule[moduleSlug]` for that module — never invent data to fill a gap. The 10 stub routes already carry a TODO marker pointing here (analyze-image, brainstorm, brainstorm-explore, content-recommendations, generate-carousel, generate-qa, generate-script, generate-story, punctuate, suggest-topics).

QuestionId map used by the extractor (per module): message→message-q8, audience→audience-cible/desir-profond, problemes→probleme-principal, positionnement→statement_positionnement/position_unique, offre→grande_promesse/valeur_ajoutee, mission→mission-q1..q5 concat, valeurs→selected-values (JSON or split), voix→perception-souhaitee/mots-a-eviter, style→ton/debit/mots-signature/mots-interdits, personas→personas-data (JSON).
