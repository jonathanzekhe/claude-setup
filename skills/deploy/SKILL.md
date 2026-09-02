---
name: deploy
description: Deploy Brvndlab to production (Convex + Vercel + commit + push) in one command
disable-model-invocation: true
---

# Deploy Brvndlab

Deploy the entire stack in one go. Run these steps in order:

1. **Typecheck Convex**: `cd "/Users/businessmanagement/Documents/Claude AI/Brvndlab/brvndlab-app" && npx convex dev --once`
2. **Typecheck Frontend**: `npx tsc --noEmit 2>&1 | grep -c "error"` -- if errors in OUR files (not pre-existing), stop and fix
3. **Deploy Convex**: `npx convex deploy --cmd-url-env-var-name NEXT_PUBLIC_CONVEX_URL --yes`
4. **Deploy Vercel**: `npx vercel --prod --yes`
5. **Report**: Show the Aliased URL and confirm both deployments are READY

If any step fails, stop and report the error. Don't continue blindly.
