---
name: Brvndlab app — structure et pages live au 2026-04-10
description: État des routes Next.js de l'app Brvndlab, layout partagé (app), pages live vs placeholders, mockups restants à porter
type: project
---

**État au 2026-04-10 03h (après session nocturne autonome)** — Brvndlab SaaS déployé sur https://app.brvndlab.com avec 7 pages live et 1 layout partagé.

## Architecture Next.js

- **Route group `(app)`** : `src/app/(app)/layout.tsx` wraps toutes les pages authentifiées avec `AppSidebar` + fond Brvndlab. Les URLs ne contiennent PAS "(app)".
- **Sidebar extraite** : `src/components/AppSidebar.tsx` — Client Component, détecte la route active via `usePathname()`, lit le rôle via `useQuery(api.users.getMe)`. Items coach-only (ex: "Mes clients") ne rendent que si `role === "coach"`.
- **Route group public** : `/sign-in`, `/sign-up`, `/onboarding` restent hors du group `(app)` (ont leur propre layout pour le thème sombre onboarding, pas de sidebar).

## Pages live (toutes fonctionnelles end-to-end, 307 → sign-in si non authentifié)

| Route | Fichier | État |
|---|---|---|
| `/onboarding` | `src/app/onboarding/page.tsx` | Fonctionnel, 23 questions, sauvegarde Convex |
| `/dashboard` | `src/app/(app)/dashboard/page.tsx` | Full mockup porté, empty states partout |
| `/brand-os` | `src/app/(app)/brand-os/page.tsx` | Index avec 3 vidéos prérequis + 12 modules (tous lockés pour MVP) |
| `/coach` | `src/app/(app)/coach/page.tsx` | Vue coach, empty state (Jonathan seul user) |
| `/calendar` | `src/app/(app)/calendar/page.tsx` | Vue semaine avec 7 slots vides cliquables |
| `/journal` | `src/app/(app)/journal/page.tsx` | Compose textarea + filtres + empty state |
| `/settings` | `src/app/(app)/settings/page.tsx` | Profil, notifications, déconnexion (photo upload pas encore wired) |

## Pages/routes encore placeholder (sidebar pointe vers mais 404 pour l'instant)

- `/content` (Contenu, module kanban — mockup-contenu-kanban-v2-chat.html)
- `/analytics` (Analytiques — mockup-analytics.html)
- `/research` (Recherche — mockup-recherche.html)
- `/monitoring` (Veille — mockup-veille.html)
- `/messaging` (Messagerie — mockup-chat-coach-client.html)

## Mockups existants mais pas encore portés

Tous dans `~/Documents/Claude AI/Brvndlab/brvndlab-demo/` :
- mockup-brand-os-{story,audience,problemes,marche,positionnement,offre,mission,valeurs,voix,personnalite,style,personas}.html — **12 modules individuels du Brand OS** (chacun sera une sous-page `/brand-os/{slug}`)
- mockup-brand-os-prerequis-videos.html — player vidéo pour les 3 prérequis
- mockup-contenu-*, mockup-analytics, mockup-recherche, mockup-veille, mockup-chat-coach-client, mockup-fiche-membre, mockup-radar, mockup-modules, mockup-modules-video-final, mockup-memoire-doree, mockup-partage-collaborateur

## Dettes techniques connues

- **Clerk JWT template** custom (créé via API Backend le 2026-04-09) inclut email/given_name/family_name/picture. Convex auth.config.ts utilise provider `customJwt` (pas OIDC) car le preset "Blank" Clerk n'injecte pas de claim `aud`. **Ne PAS repasser en OIDC** sans avoir d'abord ajouté `{"aud": "convex"}` dans le JWT template.
- **Pas de Convex schéma pour** : brand_os progress, dailyNotes, tasks, journal_entries, content_items, clients (coach view), notifications. Toutes les pages affichent des empty states hardcodés aujourd'hui.
- **Settings** : upload photo de profil n'est pas wired (juste un bouton visuel). Link "Modifier mon profil sur Clerk" ouvre l'account portal Clerk externe (solution temporaire jusqu'à ce qu'on intègre les forms nativement).
- **Theme toggle dark/light** (mentionné dans `project_brvndlab_theme_toggle.md`) : PAS encore implémenté, prévu pour une itération ultérieure.

## Convention Gemini quand je génère une nouvelle page

Les appels `create_frontend` de Gemini ont tendance à :
1. Importer `clsx` et `tailwind-merge` qui ne sont PAS installés → remplacer par de la concat string
2. Ajouter `<style jsx global>` (incompat avec App Router) → retirer
3. Wrapper la page dans un `bg-[#F8FAFC]` ou `min-h-screen` qui conflicte avec le layout `(app)` → retirer, le layout gère déjà ça
4. Parfois mettre un em-dash dans le copy → le remplacer (règle absolue de Jonathan)
5. Utiliser des apostrophes brutes dans du JSX (`l'instant`) → échapper en `l&apos;instant` sinon TS râle

Toujours réécrire le fichier avec un `Write` propre après le retour de Gemini. Ne pas laisser passer.

## Vérification finale

Build Next local : OK (24 min cold Turbopack). Deploy Vercel prod : OK. Toutes les routes protégées répondent 307 → /sign-in?redirect_url=... → 200. Domaine custom https://app.brvndlab.com live avec SSL.

**Jonathan dort, au réveil il lui suffit d'ouvrir https://app.brvndlab.com/dashboard et de cliquer sur les items de la sidebar pour visualiser les 6 nouvelles pages.**
