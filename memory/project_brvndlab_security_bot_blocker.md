---
name: Sécurité - bloqueur de bots + fermeture API
description: Installer un bloqueur de bots / scrapers et fermer les API publiques pour éviter le scraping et l'abuse.
type: project
originSessionId: e37cd837-5455-4560-bcc5-81b6b082a9c8
---
Sécuriser Brvndlab contre le scraping, l'abuse et l'accès non autorisé aux API.

## Bloqueur de bots

**Solutions candidates :**
- **Vercel WAF / Firewall** (intégré, simple, recommandé)
- **Cloudflare Bot Management** (si on bascule sur Cloudflare)
- **Arcjet** (lib middleware Next.js, rate limit + bot detection)

**À bloquer :**
- Bots de scraping (User-Agent suspects, comportements anormaux)
- Crawlers non-Googlebot sur les pages auth-gated
- Bruteforce sur endpoints critiques (sign-in, OAuth callbacks)

## Fermeture des API

**Décision sealed (cf `feedback_never_invent_features.md`) :** API d'intégration externe REFUSÉE définitivement.

**Conséquence :**
- Tous les endpoints `/api/*` doivent être :
  - Soit auth-gated (Clerk session OBLIGATOIRE)
  - Soit auth-internal (DEBUG_SECRET pour les endpoints debug)
  - Soit webhook signed (HMAC validation pour Stripe/Whop/Calendly)
  - Soit secret-path (`/api/webhooks/[provider]/[secret]/route.ts` pour iClosed/GHL)
- Aucun endpoint `/api/*` ne doit être accessible sans auth/signature
- Les routes Smart Links `/r/[slug]` sont l'unique exception (publiques par design)

## Rate limiting

**Aujourd'hui :** aucun rate limit en place (gap connu).

**À installer :**
- Sur les endpoints de génération IA (Anthropic API, coûteux)
- Sur les webhooks (protéger contre replay attacks)
- Sur les OAuth callbacks (anti-bruteforce)

**Priorité :** moyenne. À traiter avant ouverture publique large (post-MVP).

## How to apply

- Auditer chaque route API : auth check ? Rate limit ? Validation input ?
- Activer Vercel Firewall (5 min de setup)
- Considérer Arcjet pour le rate limit fin sur les routes IA
- Documenter dans le brief Hermès (Partie 36 sécurité APIs)
