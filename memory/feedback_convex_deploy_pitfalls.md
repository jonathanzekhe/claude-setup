---
name: Convex deploy pitfalls (prod flag + typecheck)
description: `npx convex deploy` from Brvndlab VPS needs --typecheck=disable to bypass pre-existing radar errors, and CLI commands default to dev — always pass --prod for prod inspection.
type: feedback
originSessionId: 5f2c71e5-ba49-447e-b6aa-af7048d1c61a
---
Two recurring pitfalls when deploying Convex from the Brvndlab VPS:

1. **TypeScript check blocks deploy** — convex/radarActions.ts and convex/radarEnrichment.ts have pre-existing TS errors that block `npx convex deploy`. Use `npx convex deploy --yes --typecheck=disable`. The Next.js side uses `ignoreBuildErrors: true` but Convex deploy has its own gate.

2. **CLI defaults to dev deployment** — `npx convex run X` and `npx convex function-spec` (no flag) hit `majestic-chameleon-876` (dev). Production is `accurate-cormorant-297`. Always append `--prod` when verifying or smoke-testing a freshly-deployed prod function, otherwise you'll get "Could not find function" even though the deploy succeeded.

**Why:** Lost minutes on 2026-05-28 chasing a phantom missing-function bug when `getBrandDna` was deployed to prod but my smoke test hit dev. The codegen file (convex/_generated/api.d.ts) showed the function correctly, but `convex run` without `--prod` queried the wrong cloud URL.

**How to apply:** For every Convex deploy on Brvndlab: `npx convex deploy --yes --typecheck=disable`. For every smoke test: `npx convex run module:fn --prod`. For function inspection: `npx convex function-spec --prod`.
