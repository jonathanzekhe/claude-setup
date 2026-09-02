---
name: Brvndlab Stripe integration validated end-to-end
description: 2026-05-01 — Première intégration de la Phase 1 fonctionnelle en prod. OAuth Connect multi-tenant, tokens chiffrés AES-GCM, webhook signé, backfill 6 mois, ingestion idempotente. Modèle/blueprint à dupliquer pour les 5 autres (Whop, Calendly, iClosed, GHL, Skool).
type: project
originSessionId: b89456e2-2692-4863-b103-66dec20d323d
---
Validé en prod le 2026-05-01 : un paiement test Stripe sur le compte connecté Signature Mentora a déclenché un webhook Stripe → notre route `/api/webhooks/stripe` a vérifié la signature, retrouvé l'owner via `event.account` → `integrations.providerAccountId`, ingéré la vente dans `trackingTouchpoints` et créé le visitor avec `intent: client` dans `/leads`.

**Architecture (à dupliquer pour les autres providers)** :
- Table Convex `integrations` (multi-tenant : `ownerClerkUserId`, `provider`, `accessTokenEnc`, `refreshTokenEnc`, `mode`, `webhookSecret`, `status`, `providerAccountId`)
- Tables `integrationEvents` (audit + idempotence par `externalEventId`) et `integrationOauthStates` (CSRF protection)
- Lib `src/lib/integrationCrypto.ts` : AES-256-GCM via Web Crypto, env `INTEGRATION_ENCRYPTION_KEY` (32 bytes hex)
- Routes `/api/auth/{provider}/start` (état CSRF + redirect OAuth) et `/callback` (échange code → token, chiffrement, stockage)
- Lib `src/lib/stripeClient.ts` : fetch wrapper, generators paginés (`iterateCharges`)
- Route `/api/integrations/{provider}/backfill` : pagination, idempotence via `externalEventId`, `maxDuration = 300`
- Webhook signé : `STRIPE_WEBHOOK_SECRET` (créé via API, pas dashboard, attaché au client_id Connect avec `application: ca_xxx`)
- Page `/integrations/{provider}` : KPIs live + timeline + bouton resync + déconnexion propre

**Pattern Stripe Connect spécifique** :
- Single webhook URL platform-side
- Stripe Connect app `ca_UQs8WcPAhSnYY6q4YrTme62lEekgHo3c` (test) / `ca_UQs8VyKRysrOhHbX00tIfh5hZTZX3cHA` (live)
- Webhook créé via `POST /v1/webhook_endpoints` avec `connect=true` → reçoit events de tous les comptes connectés via OAuth
- Signature HMAC-SHA256 vérifiée en Web Crypto pur (sans SDK stripe)

**Pièges qu'on a corrigés** :
- `echo "value" | vercel env add` ajoute `\n` qui pollue la variable. Utiliser **`printf "value"`** systématiquement.
- Plateforme Stripe = VividFlow (`acct_1Pb4bRJGipQqOwft`). Mentora (`acct_1QMaUMBXhxc9FJ8i`) = compte connecté de test, pas la plateforme. Webhook obligatoirement sur la plateforme.
- Les routes serveur Next.js ne peuvent pas appeler les `internalMutation` Convex via `ConvexHttpClient`. Convertir en `mutation` publique avec `clerkUserId` en arg explicite (pattern `youtubeTokens.saveFromServer`).

**Why** : Sprint 2 livré. Architecture validée par smoke test live (paiement test → lead créé en quelques secondes). Premier blueprint Phase 1.

**How to apply** : Pour chaque provider de Phase 1 restant (Whop, Calendly, iClosed, GHL, Skool), dupliquer cette architecture. Adapter :
- L'URL OAuth provider et le scope
- L'endpoint API à paginer
- La signature webhook (chaque provider a son propre algo, mais HMAC-SHA256 base64/hex partout)
- Le mapping event → touchpoint (sale/booking/opt_in)
