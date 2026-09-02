---
name: Programme d'affiliation Brvndlab - paramètres validés
description: Validé 2026-04-23. Système d'affiliation Brvndlab cadré : 25% à vie, 60j cookie, 45j validation, auto-activation, dashboard in-app + page publique.
type: project
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
## Paramètres validés

- **Commission** : 25% récurrent à vie sur abonnement + futurs upsells
- **Disponibilité** : les 3 tiers (Starter, Founder, Scale) dès jour 1
- **Cookie de tracking** : 60 jours (match cycle de décision B2B à 349€)
- **Délai de validation** : 45 jours avant payout (protection contre remboursements)
- **Seuil de payout** : 50 € cumulés
- **Méthode de payout** : Stripe Connect Express (virements auto mensuels)
- **Activation** : automatique dès l'inscription (chaque user a son lien au jour 1)
- **Attribution** : last-click pour le trafic organique

## Commission par tier

- 1 filleul Starter : 37 €/mois récurrent
- 1 filleul Founder : 87 €/mois récurrent
- 1 filleul Scale : 187 €/mois récurrent

## Projection exemples

- 10 filleuls Founder actifs = 870 €/mois
- 50 filleuls Founder actifs = 4 350 €/mois
- 100 filleuls Founder actifs = 8 700 €/mois

## Structure des pages à construire

1. **Dashboard in-app Affiliation** (priorité 1)
   - Section dédiée dans l'app user
   - Lien unique + stats temps réel
   - Liste des filleuls + statuts
   - Historique des commissions + prochain payout
   - Assets marketing prêts à l'emploi

2. **Page publique Affiliation** (priorité 2)
   - Landing `/affiliation` pour recruter des affiliés externes
   - Pitch programme + calculateur de gains
   - CTA "Rejoindre le programme"

## Règles anti-fraude (à implémenter en backend)

- Interdire l'auto-affiliation (même email, même fingerprint)
- Détection de cookie stuffing
- Monitoring des patterns fraude
- Pouvoir de geler un affilié douteux (admin Jonathan)

## Règles de conduite affiliés

- Pas de promesses de gains ("fais 10k/mois avec Brvndlab")
- Pas de spam / stuffing
- Pas de brandjacking / domaines similaires
- Respect du positionnement premium

## Retroactivité

Les affiliés existants (users Brvndlab qui ramènent des filleuls) touchent leur commission à partir de l'inscription du filleul, pas rétroactivement sur d'anciens clients.
