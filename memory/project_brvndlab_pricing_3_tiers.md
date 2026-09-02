---
name: Pricing Brvndlab, 3 tiers
description: Validé 2026-04-22. Brvndlab a 3 offres tarifaires différentes. Cliquer Upgrade ouvre la page de comparaison.
type: project
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
Brvndlab a **3 tiers** de pricing. L'utilisateur voit son plan actuel dans Settings > Abonnement, et peut cliquer "Upgrade" pour comparer et passer à un plan supérieur.

**Tiers** (à ajuster avec vrais prix Jonathan) :
- **Starter** : petit plan d'entrée pour tester
- **Founder** : plan principal (plan actuel de Jonathan à 84€/mois)
- **Scale** : plan haut, pour équipes plus grandes

**Flow Upgrade** :
1. Clic "Upgrade" dans Settings > Abonnement
2. Ouvre la page `/settings/abonnement/upgrade` avec les 3 tiers côte à côte
3. Chaque tier montre : nom, prix, features principales, CTA "Passer à X"
4. Clic sur un tier supérieur → checkout Stripe intégré ou redirection
5. Confirmation + retour sur Settings avec nouveau plan actif

**Factures** :
- Brvndlab **génère ses propres factures** pour l'abonnement SaaS
- PDF téléchargeable depuis Settings > Abonnement > Factures
- Chaque facture : numéro, date, période, montant HT/TVA/TTC, méthode de paiement, infos entité VividFlow LTD
- Facture auto générée à chaque renouvellement mensuel ou annuel

**Règle importante :** Les factures Brvndlab ne concernent QUE l'abonnement SaaS. Les ventes de l'utilisateur (son propre business, via Stripe/Whop) restent gérées par ses propres outils, Brvndlab ne génère PAS de facture pour ces ventes (cf `project_brvndlab_transactions_positioning.md`).
