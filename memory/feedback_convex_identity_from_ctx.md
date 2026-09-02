---
name: Convex identity always from ctx.auth
description: In Convex mutations/queries, never accept clerkUserId or email as client args — always derive from ctx.auth.getUserIdentity()
type: feedback
---

Dans toutes les mutations et queries Convex de Brvndlab, **ne jamais accepter `clerkUserId`, `email`, ou tout attribut d'identité comme argument client**. Toujours les dériver de `ctx.auth.getUserIdentity()` côté serveur.

**Why:** Le rôle `coach` vs `member` est décidé par un whitelist d'emails (`FOUNDER_EMAILS`). Si le client peut passer `email: "jonathanzekhe@gmail.com"` comme argument, n'importe qui peut se promouvoir coach. Le JWT Clerk est signé, donc `identity.subject` et `identity.email` sont fiables — les args client ne le sont pas.

**How to apply:**
- Mutation shape : `args: {}` ou uniquement des args métier (pas d'identité)
- Début du handler : `const identity = await ctx.auth.getUserIdentity(); if (!identity) throw new Error("Not authenticated");`
- Utiliser `identity.subject` comme `clerkUserId`, `identity.email`, `identity.givenName`, `identity.familyName`, `identity.pictureUrl`
- Appliqué dans `convex/users.ts` (ensureUser, getMe) et `convex/onboarding.ts` (getMyProgress, saveStep, complete) le 2026-04-09
