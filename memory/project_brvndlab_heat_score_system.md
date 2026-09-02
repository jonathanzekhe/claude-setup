---
name: Heat Score system validé 2026-05-04
description: Système de scoring 0-100 pondéré pour classifier les leads, scellé pour Brvndlab. Pas de logique binaire — gamifié, points visibles partout.
type: project
originSessionId: 0d43d9f6-70f9-409a-9c50-2fce30e51db2
---
**Décision** : système Heat Score 0-100 pondéré pour classifier les leads, validé enthousiasme par Jonathan le 2026-05-04. Présentation référence : `brvndlab-mockups.vercel.app/brvndlab-leads-classification`.

**Why** : pour le high-ticket consulting (ICP Brvndlab), un lead qui booke un call peut être un curieux (35/100 = Tiède), tandis qu'un lead qui consomme du contenu multi-canal sans booker peut être prêt à acheter (80/100 = Chaud). La logique binaire "1 événement = 1 niveau" rate les meilleurs leads. Jonathan adore le côté gamifié et veut que les points restent visibles dans toute l'UI ("on adore le concept des points, c'est gamifié").

**How to apply** :

### Mapping score → niveau (intent)
- 0 → 29 : `cold` (Froid ❄️ bleu)
- 30 → 59 : `warm` (Tiède 🌤 amber)
- 60 → 84 : `hot` (Chaud 🔥 rouge)
- 85 → 100 : `burning` (Brûlant 🌋 violet/orange)
- Sale détectée : `client` (Client 👑 violet) — verrou définitif, jamais de descente auto

### Signaux et poids (12 signaux)
| Signal | Points |
|---|---|
| Click Smart Link | +5 |
| Watch time YouTube > 50% | +15 |
| Multi-canal · 2 canaux | +15 |
| Multi-canal · 3+ canaux | +25 |
| 3+ Smart Links cliqués en 7j | +20 |
| Visite page de prix | +20 |
| Visite témoignages / cas clients | +10 |
| Opt-in email | +20 |
| Lead magnet téléchargé | +15 |
| Booking call planifié | +30 |
| Show up à l'appel | +25 |
| Outcome WON post-call | +30 |

Score plafonné à 100, jamais < 0.

### Decay (refroidissement)
- 30 jours sans activité : −10
- 60 jours sans activité : −20
- 90 jours sans activité : −30
- No-show non rescheduled : −15
- Outcome négatif post-call : −20
- Désinscription newsletter : −25
- Refund / churn Whop : reste Client mais sous-statut Churn

### Sous-statuts
**Chaud** : Booké, Confirmé, No-show, Objection
**Client** : Actif, Churn, Ambassadeur (≥1 filleul payé via affiliation)

### UI requirements (validé Jonathan)
- **Score visible partout** : barre de progression sur la liste leads, big number sur la fiche, tendance +X points sur 7j
- **Top 3 signaux qui ont pesé** sur la fiche détail
- **Filtres tabs** : Tous / Froid / Tiède / Chaud / Brûlant / Client
- **Dashboard KPIs** mis à jour : distribution score, leads brûlants en attente, etc.
- **Couleurs** : bleu (Froid) / amber (Tiède) / rouge (Chaud) / violet (Brûlant) / violet client

### Verrouillage Client
Une fois Client (paiement détecté), on ne descend jamais automatiquement le niveau. Reset manuel uniquement.

### Implémentation
- Champ `heatScore` (number) sur `trackingVisitors`
- Mutation Convex `recalculateHeatScore(visitorId)` qui parcourt les touchpoints et calcule le score
- Triggers dans chaque ingest (Calendly/iClosed/Whop/Stripe/SmartLink) qui appellent recalculate
- Cron quotidien pour le decay
- Mapping intent dérivé du score à chaque update

### Présentation référence
`brvndlab-mockups.vercel.app/brvndlab-leads-classification` — fichier source `~/Documents/Claude AI/brvndlab-mockups/brvndlab-leads-classification.html`. Sert de spec UI/UX et de pitch ICP.
