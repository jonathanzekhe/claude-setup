---
name: Section Calendrier validée
description: La section Calendrier est 100% validée par Jonathan le 15 avril 2026. Layout M1 Canvas, drawers Stratégie/Filtres, drag & drop multi-vue. Passer à la section suivante.
type: project
originSessionId: 1df69724-cc9f-4824-aff8-7c74c4ae7327
---
## Section Calendrier — VALIDÉE le 15 avril 2026

Tout le Calendrier est validé. On passe à la section suivante.

**Features livrées :**
- Layout M1 Canvas (pas de sidebar, toolbar top minimal, calendrier plein écran)
- Header style MagicPost : pastille date à gauche + nav + dropdown vue à droite
- 4 vues : Jour / Semaine / Mois / Liste avec dropdown select
- Vue Semaine : colonnes uniformes avec séparateurs verticaux, cartes style pipeline (sans Modifier/Supprimer)
- Vue Mois : pattern diagonal pour jours hors mois courant, pastille orange ronde pour jour actuel
- Cartes contenu avec logos plateforme toujours en couleur (pas de fade draft)
- Tags : TOFU/MOFU/BOFU + VIDÉO/STORY/Q&A/CARROUSEL (SCRIPT renommé VIDÉO pour clarté)
- Drag & drop Month ET Week (effet lift + rotation + ring orange sur drop)
- Panel détails slide-right au clic sur une carte (Modifier envoie sur la bonne page d'édition)
- Bouton flottant Stratégie + drawer structuré :
  - Toggle Notoriété/Conversion (instantané, pre-fetch des 2 objectifs dès page load)
  - Ta répartition encadrée (TOFU/MOFU/BOFU avec trait noir = idéal)
  - Ce qui marche (puces vertes) + À améliorer (puces ambre)
  - Prompt IA : parle en intention (jamais en formats), voix Brvndlab
  - Filtre post-réponse côté API qui supprime les formats interdits (webinaire, témoignage, démo, etc.)
- Bouton flottant Filtres + drawer (Plateforme / Funnel / Statut)
- 2 objectifs uniquement : Notoriété + Conversion (adapté ICP entrepreneurs)
- Ajouter au pipeline sans date (simplifié)
- ExitDraftModal sur page Script (demande confirmation avant de quitter)
- Insights Stratégie : refonte vocabulaire en "ressenti/intention" (jamais "cas client", "webinaire", etc.)

**Corrections notables :**
- Partager modal : portal vers body (échappe au stacking context du toolbar sticky)
- Recommandations ultra-courtes via Haiku 4.5 (80 tokens)
- Cache recommandations versionné (v2) pour invalider les anciennes non filtrées

**Prochaine étape : à choisir avec Jonathan (analytics, research, messaging, KPI, ou autre)**
