---
name: Dashboard in-app Affiliation validé 2026-04-23
description: Page dashboard d'affiliation in-app validée par Jonathan. Hero gains, lien unique avec copy, stats, filleuls, payout Stripe, tips dismissible.
type: project
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
## URL

**https://brvndlab-mockups.vercel.app/brvndlab-affiliation**

## Structure validée

1. **Hero dark** : gains cumulés à vie (52px) + meta en 3 colonnes (ce mois, filleuls actifs, MRR récurrent)
2. **Block Lien d'affiliation** : URL unique avec highlight orange, bouton Copier fonctionnel (feedback "Copié !"), bouton Partager
3. **4 Stats cards** : Clics, Inscriptions, Filleuls actifs, Prochain payout
4. **2 colonnes** :
   - Filleuls list (avatar, nom, email, tier avec couleur, statut actif/validation/résilié, MRR)
   - Prochain versement (amount, date, split En validation / Disponible / Cumulé, statut Stripe)
5. **Tips "Comment ça marche"** : block ambre avec X de fermeture dismissible (animation slide-up + fade)

## Features retirés

- Assets marketing (pas encore de vraies bannières/templates, à remettre plus tard)

## Règles appliquées

- 25% à vie sur chaque inscription
- Validation 45 jours avant payout
- Cookie 60 jours
- Payout mensuel le 5 via Stripe Connect (seuil 50 €)
- Lien format : `brvndlab.com/ref/{username}`

## Interactivité mockup

- Click Copier → feedback "Copié !" pendant 1.8s + fond vert
- Click X sur tips → disparaît avec animation
