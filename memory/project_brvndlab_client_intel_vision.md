---
name: Client Intel = cerveau comportemental + IA de recommandation
description: Validé 2026-04-23. Client Intel n'est PAS un CRM post-vente. C'est un tracking complet de chaque user SaaS + IA qui propose à Jonathan les meilleures actions pour maximiser le cash.
type: project
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
## Principe fondamental

**Client Intel = un cerveau par user qui observe silencieusement et remonte à Jonathan.**

Chaque user SaaS de Brvndlab est tracké dans ses moindres actions in-app. L'IA détecte :
- **Obsessions** : thèmes récurrents dans ses recherches / brainstorms / scripts
- **Problématiques** : où il bloque, ce qu'il répète, ce qu'il rate
- **Intentions** : ce qu'il cherche à construire, sa direction stratégique
- **Patterns** : TOFU-heavy, BOFU-vide, format préféré, rythme, horaires actifs
- **Signaux de churn** : baisse d'activité, modules incomplets, zéro nouveau contenu

Et surtout, l'IA **recommande des actions concrètes à Jonathan** :
- "Propose un call stratégique à X"
- "Y cherche obsessivement 'LinkedIn conversion' → offre-lui un coaching LinkedIn"
- "Z est prêt pour un upsell vers ton offre premium"
- "W risque de churner cette semaine, envoie-lui ça"

## Objectif business

Permettre à Jonathan de :
1. Proposer **le bon produit au bon moment** (Brvndlab ou hors Brvndlab)
2. **Personnaliser le pitch** selon l'obsession détectée
3. **Maximiser la LTV** par client (upsell, cross-sell, coaching 1-1, formations)
4. **Détecter les churns** avant qu'ils ne partent
5. **Identifier les ambassadeurs** (patterns de performance + engagement)

## Distinction Client Intel vs Mémoire dorée

| | Client Intel | Mémoire dorée |
|---|---|---|
| **Scope** | Par user (micro) | Tous users (macro) |
| **Vue** | Fiche 360° d'un user précis | Patterns marché global |
| **Action** | Targéter 1 user spécifique | Informer stratégie Brvndlab produit |
| **Insight** | "Marc cherche LinkedIn × 47" | "LinkedIn est la niche #1 ce mois" |

**Données communes** : même backend (table Convex memoireDoree déjà en place, tracking silencieux depuis day 1).

## Accès

- **Client Intel** : visible à Jonathan uniquement. Jamais aux collaborateurs ni aux users eux-mêmes.
- Data privée, à mentionner dans Privacy Policy / ToS Brvndlab.

## Échelle de valeur orchestrée par Client Intel (validée 2026-04-23)

Client Intel n'est pas que de la reco d'actions ponctuelles. C'est le cerveau qui oriente chaque user vers le bon niveau de la ladder Brvndlab :

- **Niveau 1 — SaaS retainer** : l'offre par défaut (self-service, récurrent). Tous les users.
- **Niveau 2 — Consulting 1-1 signature** : offre premium label Jonathan, pour users à fort jus (engagement élevé, capacité d'investissement, besoins complexes).
- **Niveau 3 — Masterminds privés par niche** : regrouper les MEILLEURS entrepreneurs utilisateurs de Brvndlab, par verticale (Sport / SaaS B2B / Coaching / Business / etc.). Très premium, exclusif.

## Clustering automatique (à implémenter)

L'IA doit clusteriser les users par niche à partir du Brand OS (positionnement, niche, grande promesse) + patterns de contenu + résultats.

Puis détecter dans chaque cluster les top performers (engagement + LTV + qualité Brand OS + résultats externes).

## Recos concrètes attendues dans la fiche Client Intel

Remplacer les recos vagues ("offre personnalisée") par :
- "Invite-le au mastermind Sport (11 membres actuels)"
- "Crée un nouveau mastermind SaaS B2B — 5 candidats détectés"
- "Propose-lui ton consulting 1-1 signature (1 500 €)"
- "Affilie-lui l'outil externe X (commission Y €)"
- "Relance-le : inactif depuis 12j, risque churn"

## Positionnement stratégique de Jonathan

Ses SaaS users sont déjà **pré-brandés par son contenu** (ils sont arrivés par ses vidéos YouTube). Il a une autorité implicite sur eux. La ladder monetize cette relation de confiance au-delà du retainer mensuel.

## Architecture UX (validée 2026-04-23)

1. **Entry point = liste** de tous les users SaaS avec signaux rapides (LTV, statut, alertes IA)
2. **Click → fiche 360°** avec tabs :
   - Signaux IA + Recommandations actions
   - Activité chronologique complète
   - Profil + plan SaaS
   - Performance externe (si connecté)
   - Notes privées Jonathan
