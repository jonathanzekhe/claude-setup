---
name: Client Intel v2 validé avec Roadmap + Brainstorm IA
description: Page Product Intelligence complète. 5 tabs (Recommandations/Modules/Gaps/Users/Roadmap), ajout à la roadmap, brainstorm IA par item avec PDF export.
type: project
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
## URL

**https://brvndlab-mockups.vercel.app/brvndlab-client-intel-v2**

## Structure validée

**5 top tabs :**
1. Recommandations IA (cards avec sources de signaux)
2. Santé des modules (usage, dropoff, adoption par module)
3. Feature gaps (besoins détectés, sévérité par nombre users)
4. Utilisateurs (drill-down lecture seule, drawer avec patterns behaviors)
5. **Roadmap** (items sauvegardés pour brainstorm + implémentation)

**Flow principal validé :**
Détection dans Recos/Gaps → "Ajouter au roadmap" → Roadmap tab → "Brainstormer avec l'IA" → chat drawer → PDF exporté → implémentation.

## Roadmap panel

- Header avec stats (items, brainstorms faits)
- Filtres par statut : Tous / À étudier / En brainstorm / Validés
- Items affichent : source, statut, titre, description, users concernés, ancienneté, badge "PDF exporté" si déjà brainstormé
- Un seul CTA principal : "Brainstormer / Reprendre / Continuer le brainstorm"

## Brainstorm IA (chat drawer)

Drawer dark premium à droite avec :
- Header avec titre + contexte chargé
- Conversation scénarisée par item (4 scenarios mockés : marketplace, linkedin, personas, radar)
- Messages IA/Vous en bulles
- Typing indicator
- Input pour envoyer des questions
- Actions : "Exporter en PDF" (toast), "Marquer validé" (ferme + retourne en liste)

L'IA brainstorm comme un consultant produit qui connaît toute la stack Brvndlab. Contexte du user signal pré-chargé.

## Direction cristallisée

**Client Intel = Product Intelligence Dashboard pour améliorer Brvndlab basé sur le comportement agrégé des users.**

PAS de :
- Upsell
- Actions commerciales 1-to-1
- Sales recos
- CRM de leads

OUI :
- Détection de frictions et besoins
- Recommandations produit (features, optimisations, marketplaces)
- Brainstorm IA pour affiner chaque direction
- Export PDF pour partager avec développeurs / valider avec l'équipe

## Design improvements appliqués

- Un seul CTA principal par card (au lieu de 3)
- Statuts colorés clairs
- Badge "Brainstorm fait · PDF exporté"
- Toast de feedback sur chaque action
- Sidebar entièrement navigable vers les autres mockups

## Pattern Brvndlab réutilisable

Le pattern **"Détection → Roadmap → Brainstorm IA → PDF"** peut être réutilisé ailleurs :
- Dans Mémoire dorée (patterns marché → idées produit → brainstorm → validation)
- Dans Research (insights veille → idées contenu → brainstorm → script)

Ce schéma "IA + PDF export" permet à Jonathan de capturer son brainstorming et le partager à son équipe dev.
