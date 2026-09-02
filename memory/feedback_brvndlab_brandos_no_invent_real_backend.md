---
name: feedback_brvndlab_brandos_no_invent_real_backend
description: "Refonte UI/UX du Brand OS = partir du vrai backend live, ne RIEN inventer (questions, logique, navigation)"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 03adbfc3-e0b4-4f12-87ce-d3de3ed326f9
---

Quand je refais le UI/UX d'un module Brand OS Brvndlab, je pars du **vrai code live** et je n'invente AUCUN contenu (sections, questions, types de champs, logique). Brvndlab existe déjà avec un gros travail backend.

**Why:** Le 2026-06-28 j'ai pondu un mockup multi-modules avec des questions/sections inventées → Jonathan furieux (« t'as fait n'importe quoi, n'invente rien, il y a une logique derrière »).

**How to apply:**
- Repo réel : `~/dev/brvndlab-claude/brvndlab-app`. Brand OS = `convex/seedBrandOsFull.ts`, `convex/brandOs.ts`, et pages `src/app/(app)/brand-os/<module>/page.tsx`. Lire le verbatim AVANT de designer.
- 10 modules UI réels : histoire, audience, problemes, positionnement, offre, mission, valeurs, voix, style, personas (message/marche définis mais pas en UI).
- Types de champs réels variés : textarea, toggles multi (âge/plateformes), listes, tags, radio, génération Froid/Tiède/Chaud par paquets de 10 jusqu'à 50 (Problèmes), librairie de valeurs (18, max 5), avant/après, personas auto-générés verrouillés. Ne pas tout réduire à des listes titre+desc.
- Problèmes : 1 problème principal + 2 blocs génération (activité quotidienne, freins à l'investissement), bouton « Ajouter 10 de plus (X/50) », déblocage conditionnel (audience-cible + probleme-principal remplis).
- Navigation réelle = accueil grille de cartes + précédent/suivant par page. PAS de barre de slides/pills en haut (rejeté).
- Refonte DA scellée : remplacer les ampoules par un **guide vidéo « Mes guides »** (replié, déroulé au clic, étiquette « Vidéo à venir », sans auteur). Guide vidéo seulement sur : **Histoire, Audience, Problématiques, Positionnement, Mission**. PAS de guide sur : **Valeurs, Voix, Offre, Style, Personas** (validé 2026-06-29, Valeurs+Voix retirés). Supprimer les « Voir un exemple ».
- Standard épuré validé (2026-06-29) sur TOUS les modules : kicker (nom de section) + question + champ. ZÉRO numéro 01/02, ZÉRO sous-titre. La vidéo guide (là où elle existe) porte la profondeur. Cartes-chapitres Histoire/Audience ont aussi perdu numéros+sous-titres.
- « Enregistré au fil » en **vert** (--ok #6FB58C dark / #2E7D5B light) en haut à droite.
- Cartes-chapitres distinctes (numéro + nom + filet), monochrome warm, jamais de « — » (em-dash), jamais le framing « ton bras droit » (l'utilisateur crée, l'outil aide au brainstorming). Voir [[feedback_brvndlab_da_guardrail]].
- L'assistant IA s'appelle **« l'IA » (l'intelligence artificielle)**, PAS « Lya ». La génération de masse (problèmes, etc.) est faite par l'IA, gated : ne se débloque qu'une fois audience-cible + problème principal remplis ; la page rappelle l'audience cible en haut (calculée depuis le module Audience).
- Froid/Tiède/Chaud = **garder les couleurs + emojis** (Froid bleu 🥶 / Tiède orange 😐 / Chaud rouge 🥵), pas de monochrome mort. Code couleur fonctionnel autorisé (comme funnel). Bouton réel = « Ajouter 10 de plus (X/50) ».
- La page Problèmes live (titre « Problématiques ») est validée visuellement : reproduire fidèlement, NE changer QUE l'ampoule/« Voir un exemple » → guide vidéo.
- Histoire ✅ + Audience ✅ validées (2026-06-28). Travailler **page par page**, ne jamais toucher la page principale Brand OS (prédéfinie). Mobile : tout à la fin.
