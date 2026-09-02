---
name: Connexion comptes sociaux (YouTube, Instagram, TikTok)
description: Roadmap - chaque utilisateur connecte ses propres comptes YouTube/Instagram/TikTok pour le tracking analytics
type: project
---

Chaque utilisateur Brvndlab doit pouvoir connecter ses propres comptes sociaux :
- YouTube (via Google OAuth)
- Instagram (via Meta/Instagram API, app ID déjà dans .env.local)
- TikTok (via TikTok API)

**Why:** Le module Analytics repose sur les données des réseaux. Sans connexion, les KPI cards du Dashboard restent en empty state.

**How to apply:** Implémenter un flow OAuth par plateforme dans Settings ou une page dédiée /connect. Stocker les tokens dans Convex (chiffrés). Utiliser les tokens pour fetch les données via les APIs respectives ou via Apify (token déjà dans .env.local).
