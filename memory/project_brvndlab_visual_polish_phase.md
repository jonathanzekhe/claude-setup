---
name: Visual polish phase Brvndlab — direction Mochi (themochi.app)
description: Phase visuelle finale Brvndlab. Référence d'inspiration : themochi.app. Foundation dark mode posée 2026-05-09. Migration progressive page par page + Mochi-style polish.
type: project
originSessionId: e37cd837-5455-4560-bcc5-81b6b082a9c8
---
Référence visuelle scellée : **https://themochi.app/** — Jonathan veut ce niveau de fluidité, polish, motion. "La meilleure expérience que mes clients n'aient jamais vu."

**Foundation déjà posée (2026-05-09)** :
- CSS variables sémantiques dans `src/app/globals.css` : `--bg`, `--surface`, `--surface-alt`, `--surface-muted`, `--text`, `--text-secondary`, `--text-muted`, `--border`, `--divider`, `--accent`, `--accent-bg`, `--shadow-sm/md/lg`
- Tokens flippent automatiquement en dark via `[data-theme="dark"]` ou `.dark` sur `<html>`
- `@custom-variant dark` activé pour Tailwind v4
- `ThemeProvider` (`src/components/ThemeProvider.tsx`) gère light/dark/auto avec localStorage + prefers-color-scheme
- `useTheme()` hook exposé
- Settings → section "Apparence" avec toggle Clair / Sombre / Auto
- Body, sidebar (dropdown), Settings page → migrés vers les tokens

**Restent à migrer (pages détail)** :
- Dashboard, Leads, Smart Links, Analytics, Radar, Transactions, Brand OS, Content, Calendar, Journal, Integrations, Affiliation, Memoire dorée, Client Intel, etc.
- Chacune ~50-100 valeurs hex hardcodées (`bg-white`, `text-[#1A1A2E]`, `bg-[#EEF0F4]`, `border-black/[0.04]`, etc.)
- Strategy : remplacer par les tokens quand on touche la page en passe d'optimisation, OU faire une passe dédiée

**Polish "Mochi-style" à ajouter** :
- Page transitions (Framer Motion already installed) — fade/slide cohérent à l'arrivée de chaque route
- Skeleton loading systématique (cards qui apparaissent en stagger fade-in)
- Micro-interactions : hover states avec transform subtle (translateY, scale), spring easings
- Smooth tabs/toggles avec Framer Motion layout animations
- Cursor-following hover effects sur les CTAs principaux
- Subtle parallax / depth sur les hero sections

**How to apply** :
- À chaque page touchée, migrer les couleurs hex → tokens CSS variables
- Pattern d'arrivée systématique : `<motion.div initial={{ opacity: 0, y: 8 }} animate={{ opacity: 1, y: 0 }} transition={{ duration: 0.25, ease: "easeOut" }}>`
- Stagger pour listes : `delay = index * 0.04`
- Skeleton placeholder pour chaque async loading
- Référence d'inspiration constante : themochi.app (à ouvrir en parallèle pour calibrer)

**Conditions de l'execution** :
- Soit on fait un chantier dédié 2-3 sessions focalisées
- Soit on migre progressivement à chaque passe d'optimisation par section
- Jonathan a explicitement demandé que ça arrive "maintenant" (pas attendre la phase finale)
