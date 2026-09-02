# Mockups validés, source de vérité unique

Ce fichier liste les mockups validés par Jonathan. Mis à jour le 2026-04-09.

## Légende
- ✅ = validé définitif par Jonathan
- ⏳ = en attente de revue
- 🔴 = à refaire
- 🟡 = placeholder en attente de contenu Notion

---

## 01 · Onboarding

- ✅ `mockup-onboarding-full-v2.html` — Flow onboarding complet 10 écrans (aperçu), validé 2026-04-08
- ✅ `mockup-onboarding-questionnaire-23q.html` — Questionnaire 23 questions complet, validé Jonathan 2026-04-09

## 02 · Brand OS (12 modules + 1 prérequis)

**Phase 1, le fondamental**
- ✅ `mockup-brand-os.html` — Hub Brand OS avec 12 modules + bloc vidéos prérequises, validé 2026-04-09
- ✅ `mockup-brand-os-story.html` — Ton histoire avec 3 sections dynamiques (Ton parcours, Tes influences, Ton évolution) matching le code Next.js existant, validé Jonathan 2026-04-09
- ✅ `mockup-brand-os-audience.html` — Audience, validé 2026-04-09

**Gate pédagogique**
- ✅ `mockup-brand-os-prerequis-videos.html` — Page des 3 vidéos prérequises pour débloquer Phase 2 et 3, validée 2026-04-09

**Phase 2, le marché et le message**
- 🟡 `mockup-brand-os-problemes.html` — Placeholder, à construire avec les questions Notion Problèmes
- 🟡 `mockup-brand-os-marche.html` — Placeholder, à construire avec les questions Notion Marché
- 🟡 `mockup-brand-os-positionnement.html` — Placeholder, à construire avec les questions Notion Positionnement
- 🟡 `mockup-brand-os-offre.html` — Placeholder existant, à revalider avec les questions Notion Offre

**Phase 3, l'expression de ta marque**
- ✅ `mockup-brand-os-mission.html` — Mission, validé 2026-04-09
- ✅ `mockup-brand-os-valeurs.html` — Valeurs, validé 2026-04-09
- ✅ `mockup-brand-os-voix.html` — Voix, validé 2026-04-09
- ✅ `mockup-brand-os-personnalite.html` — Personnalité, validé 2026-04-09
- ✅ `mockup-brand-os-style.html` — Style de communication, validé 2026-04-09

**Phase 4, synthèse IA**
- ✅ `mockup-brand-os-personas.html` — Personas auto-IA, validé 2026-04-09

**Note importante** : le fichier `mockup-brand-os-message.html` a été supprimé. Les modules Problèmes, Marché, Positionnement et Offre sont maintenant séparés, accessibles seulement après les 3 vidéos prérequises.

## 03 · Dashboard client

- ✅ `mockup-dashboard-matin.html` — Dashboard matin, validé 2026-04-09

## 04 · Calendrier

- ✅ `mockup-calendrier-final.html` — Calendrier de publication, validé 2026-04-09

## 05 · Contenu

- ✅ `mockup-contenu-entree.html` — Page d'entrée Contenu, validée Jonathan 2026-04-09 ("Option 3 + badge motivation")
- ✅ `mockup-contenu-kanban-v2-chat.html` — Kanban vidéo avec chat collaboratif, validé 2026-04-09
- ✅ `mockup-contenu-script.html` — Script généré, validé 2026-04-09. À enrichir au Chantier B avec la feature "script references" (voir project_brvndlab_script_references.md)

## 06 · Intelligence de marché

- ✅ `mockup-recherche.html` — Module Recherche 7 écrans avec radar FR+EN, validé 2026-04-09
- ✅ `mockup-veille.html` — Module Veille 8 écrans observation pure, validé 2026-04-09
- ✅ `mockup-analytics.html` — Module Analytics 10 écrans avec TOFU/MOFU/BOFU, validé 2026-04-09
- ✅ `mockup-radar.html` — Radar du marché qualitatif, validé 2026-04-09

## 07 · Coach

- ✅ `mockup-dashboard-coach.html` — Dashboard coach portfolio clients, validé 2026-04-09
- ✅ `mockup-fiche-membre.html` — Fiche membre avec slide Avant/Pendant/Après, validé 2026-04-09
- ✅ `mockup-memoire-doree.html` — Mémoire dorée vault market intelligence, validé 2026-04-09
- ✅ `mockup-chat-coach-client.html` — Messagerie coach client Chat/Note, validé 2026-04-09
- ✅ `mockup-partage-collaborateur.html` — Partage collaborateur granulaire, validé 2026-04-09

## 09 · Journal (notes personnelles)

- ✅ `mockup-journal.html` — Journal avec 4 tags (Win, Leçon, Inspiration, Idée), entrée vocale, filtres, auto-détection URLs, validé 2026-04-09

## 08 · Modules de formation

- ✅ `mockup-modules.html` — Hub modules, validé 2026-04-09
- ✅ `mockup-modules-video-final.html` — Lecteur vidéo, validé 2026-04-09

---

## Résumé des actions restantes

**Pour débloquer 100% du Brand OS :**

1. Jonathan doit envoyer les questions Notion exactes pour :
   - Story (à refaire)
   - Problèmes
   - Marché
   - Positionnement
   - Offre (à revalider)

2. Jonathan doit donner les 3 titres et descriptions finaux des vidéos prérequises (actuellement avec placeholders) si différents de ceux proposés :
   - "Qu'est-ce que le message primaire et secondaire" (8 min)
   - "Comprendre les problèmes de ton audience" (11 min)
   - "Positionnement et offre, le cadre stratégique" (14 min)

**Pour le Chantier B (développement technique) :**

- Toutes les autres sections sont 100% validées et prêtes à être codées dans Next.js.
- Feature à implémenter dans Contenu/Script : insertion de références avec timestamp optionnel (voir project_brvndlab_script_references.md).
