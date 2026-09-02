---
name: Validations workflow Contenu (6 sections scellées)
description: Choix validés par Jonathan le 2026-04-25 sur les 6 variantes du workflow Contenu (sauvegarde script, bouton pipeline, retour, modal, assignation, métadonnées). Cycle d'affinage clôturé.
type: project
originSessionId: b89456e2-2692-4863-b103-66dec20d323d
---
Validations 2026-04-25 sur l'affinage du module Contenu (mockups brvndlab-content-refine). Cycle complet, 6 sections scellées.

**Section 01 · Sauvegarder vs Pipeline (page du script terminé)** → Variante C (Auto-save continu en arrière-plan, plus de bouton "Sauvegarder" manuel, uniquement "Envoyer en pipeline" en bas). Standard moderne type Notion/Linear/Google Docs. Élimine l'anxiété "où va ma sauvegarde". La frise de progression Brouillon → Programmé → Tourné → Publié reste pour le module Calendrier, pas dans l'éditeur de script.

**Section 02 · Bouton "Ajouter à la pipeline"** → Variante C (Icône + texte discret, action principale légèrement teintée orange).

**Section 03 · Wording du retour** → Validé. Tous les CTA "Retour aux résultats / à la liste / au générateur / aux angles" deviennent simplement "Retour" partout dans le module Contenu.

**Section 04 · Modal au retour** → Variante A (Modal silencieuse si déjà sauvegardé, modal s'affiche uniquement si modifications non sauvegardées).

**Section 05 · Assignation collaborateur** → Variante A (Champ unique "Assigné à" multi-select sur la fiche, notification automatique au tag, badge "Assigné à toi" côté collaborateur).

**Section 06 · Métadonnées de l'angle** → Variante B (Durée + indicateur de complexité simple/dense/dossier) avec correction couleur : durée et complexité en noir #1A1A2E, seul le tag funnel TOFU/MOFU/BOFU garde la couleur orange.

**Why** : Ces choix scellent l'intégralité du workflow Contenu pour l'implémentation finale. Évite de re-débattre les mêmes décisions aux étapes suivantes. Les variantes ont été choisies pour minimiser la friction utilisateur et aligner sur les standards SaaS modernes.

**How to apply** : Lors de l'implémentation du module Contenu, appliquer directement ces variantes choisies sans re-proposer d'alternatives. Le module Contenu peut être considéré comme finalisé en termes de logique d'interaction, ne plus le rebrainstormer.

---

**Statut implémentation 2026-04-25** : codé dans `brvndlab-app/`. Diff résumé :

- `src/app/(app)/content/script/page.tsx` : ajout state `isDirty`, hook auto-save (debounce 1.5s), bouton "Sauvegarder" remplacé par indicateur de statut "Sauvegardé automatiquement", refonte des métadonnées (suppression word count, ajout label complexité Simple/Dense/Dossier, plateforme et durée passées en noir, funnel garde sa couleur), intégration `AssigneeSelector`, wording Retour simplifié.
- `src/components/AddToPipelineButton.tsx` : restyle bouton en variant C (orange-50, border, plus discret), suppression import ChevronRight inutilisé.
- `src/components/ExitDraftModal.tsx` : wording mis à jour ("Modifications non sauvegardées" / "Garder en brouillon" / "Quitter sans sauvegarder").
- `src/components/AssigneeSelector.tsx` : nouveau composant multi-select pour assigner des collaborateurs, avatars dégradés, recherche, notification au tag.
- `convex/schema.ts` : ajout champ `assignedCollaboratorIds: v.optional(v.array(v.id("collaborators")))` sur contentItems (ancien `assignedTo` conservé en legacy).
- `convex/contentItems.ts` : nouvelle mutation `setAssignees` (multi-select avec notification des nouveaux ajoutés), refonte `listAssignedToMe` pour gérer legacy + nouveau champ.
- Tous les CTA "Retour aux X" du module Contenu simplifiés en "Retour" (script, qa, guide-funnel, new/context, new/qa).

Typecheck : aucune erreur introduite dans les fichiers modifiés. Les erreurs tsc restantes (brand-os, calendar, settings/connexions, routes OAuth Instagram/TikTok/YouTube) sont pré-existantes et non liées à ces changements.
