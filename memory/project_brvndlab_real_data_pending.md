---
name: Données réelles à remplacer (pricing, légal, TVA)
description: Validé 2026-04-22. Tous les prix, contenus légaux et paramètres fiscaux dans les mockups sont des placeholders à remplacer par les vraies valeurs définies par Jonathan.
type: project
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
Les mockups Brvndlab contiennent actuellement des **données placeholder** qui devront être remplacées par les vraies valeurs avant la mise en production.

## À remplacer par les vraies données

### Pricing
Les 3 tiers actuellement affichés (Starter 34€, Founder 84€, Scale 184€) **ne sont PAS les vrais prix** choisis par Jonathan. À remplacer par les prix officiels dès qu'ils sont définitifs.

Impact : pages à mettre à jour
- `/tmp/brvndlab-upgrade.html` (page des 3 tiers)
- `/tmp/brvndlab-settings.html` (card plan actuel "Founder 84€")
- `/tmp/brvndlab-invoice.html` (facture "Founder 84€")
- `/tmp/brvndlab-legal.html` section CGV (prix listés)

### Pages légales
Tous les contenus légaux sont génériques et indicatifs :
- **CGU** : à valider par avocat
- **Politique de confidentialité** : à valider selon stack réelle (Convex, Clerk, hébergeur)
- **CGV** : à valider avec vrais prix + politique de remboursement définitive
- **Mentions légales** : coordonnées VividFlow LTD à vérifier (numéro company, VAT, adresse)
- **Entité VividFlow** : même chose

Action : faire rédiger / valider ces documents par un avocat business / SaaS UK avant mise en production.

### TVA et fiscalité
Les factures et prix doivent afficher proprement :
- **HT** (hors taxe)
- **TVA** applicable selon le pays de l'acheteur (UK VAT, UE reverse charge, Suisse auto-liquidation, hors UE TVA 0%)
- **TTC** (toutes taxes comprises)

Brvndlab doit calculer la TVA automatiquement via Stripe Tax ou équivalent selon :
- Pays de l'utilisateur
- Statut (particulier vs entreprise avec numéro VAT)
- Localisation VividFlow LTD (UK)

Sur les mockups actuels (`brvndlab-invoice.html`), la TVA est en placeholder "0% hors UE auto-liquidation" (cas Suisse). À rendre dynamique selon le vrai client.

### Autres placeholders à remplacer
- Numéros de facture (BRV-2026-XXXX format mais vrais numéros générés auto)
- Adresse VividFlow (71-75 Shelton Street London) : à vérifier
- Company number 15847392 : à vérifier
- VAT GB 483 7461 29 : à vérifier
- Email contacts : hey@, legal@, privacy@ brvndlab.com — à valider que ces emails existent

## Règle générale

Tous les mockups actuels sont **visuellement et structurellement finaux** mais les **données métier sensibles** (prix, textes légaux, TVA, entité) sont **placeholder** et à injecter en phase d'implémentation avec les vraies valeurs fournies par Jonathan + validation juridique.
