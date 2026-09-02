---
name: Brvndlab Auth & Security Setup
description: Auth par Clerk, mono-tenant ready multi-tenants, domaine app.brvndlab.com
type: project
---

L'authentification de Brvndlab est entièrement gérée par **Clerk** (validé par Jonathan le 2026-04-09, confirmé après discussion des trade-offs).

**Why:** Clerk gère le sign-up, sign-in, gestion des sessions, magic links, OAuth Google/Apple/LinkedIn/Microsoft, MFA, user profiles, password reset, email verification, invitations par email, et webhooks vers Convex. Économise 2-3 semaines de dev par rapport à coder l'auth soi-même. Gratuit jusqu'à 10 000 MAU, largement suffisant pour le MVP. Important aussi pour la review Meta qui vérifie comment les données utilisateurs sont protégées.

**Architecture de données:** Mono-tenant au début (Jonathan est le seul coach, ses 12-15 clients sont les utilisateurs) mais **architecture multi-tenants-ready**. Toutes les tables Convex qui en ont besoin incluent un champ `coachId` rempli avec un ID fixe au début. Le code ignore ce champ en mono-tenant, mais l'activera en 2 jours quand on voudra vendre Brvndlab à d'autres coaches francophones.

**Domaine:** À discuter avec Jonathan. Recommandation = `app.brvndlab.com` dès le jour 1 pour la perception premium. Vercel gère automatiquement le certificat HTTPS et le DNS en 10 minutes de configuration.

**How to apply:**
- Installation de Clerk dans brvndlab-app avec `@clerk/nextjs`
- Configuration du middleware Next.js pour protéger les routes (dashboard)
- Synchronisation avec Convex via webhooks Clerk → Convex users table
- Flow d'invitation par email pour inviter les clients de coaching
- Social logins activés: Google, Apple, LinkedIn, Microsoft
- Magic link activé par défaut (zéro password pour les utilisateurs)
- Une politique de confidentialité (privacy policy) doit être créée et hébergée — obligatoire pour la review Meta (Instagram API access)
- À la soumission du contrôle app Meta, mentionner que l'auth est sécurisée via Clerk
