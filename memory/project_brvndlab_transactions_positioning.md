---
name: Transactions Brvndlab, positionnement simple
description: Validé 2026-04-22. Transactions = couche de suivi/tracking, PAS un CRM. Brvndlab n'est pas processor, Stripe/Whop restent la source de vérité.
type: project
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
Le module Transactions (appelé "Ventes" dans l'UI) est une **couche de lecture et d'attribution**, pas un CRM de gestion financière.

**Why:** Jonathan a constaté que mes premiers mockups allaient trop loin (bouton "Ouvrir sur Stripe" alors qu'on peut utiliser Whop/PayPal/virement, bouton "Rembourser" qui demanderait une vraie intégration deep, gestion de factures alors que Stripe/Whop le font déjà). Il veut juste **savoir** ce qui se passe, pas **gérer** ses paiements depuis Brvndlab. Les outils de paiement restent Stripe ou Whop (ou autre), Brvndlab est un miroir read-only qui attribue chaque vente au contenu/lead/parcours qui l'a déclenchée.

**Architecture de synchronisation** :

- **Source de vérité** = Stripe, Whop, ou autre (PayPal, Shopify, etc. à terme)
- **Synchronisation** = via webhooks. Quand un paiement arrive dans Stripe, webhook → Brvndlab crée une transaction read-only
- **Attribution** = Brvndlab matche l'email du payeur avec un visitor existant (via email d'opt-in ou metadata du checkout), et attache la vente au parcours complet (Smart Link clic → opt-in → booking → vente)
- **Actions** dans Brvndlab = **zéro action financière**. Pas de refund, pas de capture, pas de facture. L'utilisateur va dans Stripe/Whop pour ces actions.

**Ce que Brvndlab fait** :
- Afficher le montant, la date, la méthode de paiement (Stripe / Whop / PayPal / Virement)
- Afficher l'attribution au contenu qui a déclenché la vente
- Afficher le parcours complet du lead jusqu'à la conversion
- Permettre d'ajouter une **note simple** (contexte, observations post-vente)
- Permettre d'**écrire au client** (email)

**Ce que Brvndlab NE fait PAS** :
- Rembourser
- Générer une facture (Stripe/Whop le font déjà)
- "Ouvrir dans Stripe" hardcodé (car on peut avoir Whop, PayPal, etc.)
- Gérer les disputes, chargebacks
- Comptabilité avancée

**UI simplifiée Transactions (drawer)** :
- Header : montant + produit acheté
- Client (cliquable vers fiche lead)
- Infos vente : Date · Méthode (chip colorée selon Stripe/Whop/etc.) · Statut (Payé / Remboursé si syncé depuis Stripe/Whop)
- Note : 1 seul slot, soit "Ajouter une note" si vide, soit la note avec bouton modifier/supprimer inline
- Parcours jusqu'à la vente (timeline des touchpoints, signature Brvndlab)
- Action principale : Écrire au client (email)

**Cette règle annule** toute idée de bouton "Rembourser", "Ouvrir sur Stripe", "Télécharger facture" côté Brvndlab.
