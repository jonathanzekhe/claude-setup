---
name: project-brvndlab-admin-clients-access
description: "Page founder /admin/clients + table clientAccess pour gérer l'accès des clients (donner/couper, Brand OS seul vs complet)"
metadata: 
  node_type: memory
  type: project
  originSessionId: fffad245-8684-475e-a0b1-c6e236cc4c4b
---

Page founder-only **/admin/clients** (rail admin, gate FOUNDER_EMAILS) livrée en prod le 2026-06-22. Voir tous les clients Brvndlab : plan (149/349/749), statut paiement (sourcé `brvndlabSubscriptions` miroir Stripe), prochaine échéance, type d'accès + actions.

Source d'accès = nouvelle table Convex **`clientAccess`** (email lowercase, `accessType` full|brand_os_only, `status` active|revoked, indexée by_email pour pré-autoriser AVANT signup). `convex/adminClients.ts` : listClients/addClient/setAccessType/revokeClient/restoreClient. `addClient` → allowlist Clerk + record. Auth branchée dans `resolveEffectiveContext` ([collaborators.ts](convex/collaborators.ts)) : email dans clientAccess → owner isolé (données à lui), `brand_os_only` → UI confinée Dashboard+Brand OS (guard dans layout.tsx + rail réduit AppSidebar), revoked → bloqué. Remplace la constante hardcodée `BRAND_OS_ONLY_EMAILS` (gardée en filet vide).

C'est pour des **clients** (pas des collaborateurs — distinct du système collaborators qui partage TES données). Un client mis en "Brand OS seul" a SON propre Brand OS isolé.

**En attente :** coupure auto sur impayé = pas branchée (le webhook Stripe `customer.subscription.*` n'écrit pas encore le statut d'abonnement). Statut affiché + coupure manuelle pour l'instant.

Deploy : Convex prod `accurate-cormorant-297` + Vercel app.brvndlab.com. NB : `.env.local` réécrit par `vercel env pull` perd la ligne `CONVEX_DEPLOYMENT` → pour deployer Convex, masquer `.env.local` (VERCEL=1 force le mode CI) et passer `CONVEX_DEPLOYMENT=prod:accurate-cormorant-297` avec la device auth.
