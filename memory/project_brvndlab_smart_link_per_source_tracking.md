---
name: Smart Link = un lien PAR source pour tracking précis
description: Validé 2026-04-22. Chaque vidéo / post / placement a son PROPRE Smart Link. Sinon l'attribution est impossible.
type: project
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
## Principe fondamental

**Un Smart Link = une source unique.**

Si tu mets le même lien sur 10 vidéos YouTube différentes, Brvndlab ne peut pas savoir quelle vidéo a généré quel lead. Toutes les conversions se mélangent.

**La règle** : chaque source (vidéo, post, story, pub, placement spécifique) a son propre Smart Link, tous pointant vers la même destination finale si besoin.

## Exemples concrets

Destination commune : `iclosed.io/jonathan/clarte`

Smart Links **auto-générés en numérique incrémental** (validé 2026-04-23). Le système NE DEVINE PAS le sujet sémantique (sinon ça met "funnel" sur une vidéo qui n'a rien à voir). Chaque lien = un compteur auto qui s'incrémente par type de destination.

Destination-type = prefix (`rdv`, `form`, `dl`, etc.) + compteur numérique :
- `brvnd.co/@jonathan/rdv-01` → vidéo YouTube #1 "Le vrai prix"
- `brvnd.co/@jonathan/rdv-02` → vidéo YouTube #2 "Comment calculer la LTV"
- `brvnd.co/@jonathan/rdv-03` → vidéo YouTube #3 "Framework 3 cercles"
- ...
- `brvnd.co/@jonathan/rdv-142` → à grande échelle

Tous redirigent vers la même destination finale, mais chaque lien identifie **la source précise** du clic via son numéro unique.

**Raison du numérique :** la génération doit être automatique et fiable. Un guess sémantique (pricing/funnel/scale) peut se tromper. Le numérique ne peut pas mentir, et l'utilisateur moyen qui voit `brvnd.co/@jonathan/rdv-42` ne calcule pas le sens, il clique.

## Aide à la création

Pour éviter de créer manuellement chaque Smart Link, Brvndlab propose :

1. **Auto-détection du contenu** (si connecté à YouTube/Instagram/TikTok) : quand une nouvelle vidéo est postée, Brvndlab suggère "Cette vidéo n'a pas de Smart Link, en générer un ?"

2. **Groupes / templates** : un "lien parent" (ex: Booking) sert de modèle. Chaque variant généré pointe vers la même destination avec un slug différent automatiquement dérivé du titre du contenu.

3. **Duplication rapide** : sur chaque Smart Link existant, bouton "Dupliquer pour une autre source" qui pré-remplit tout sauf le slug unique.

4. **Bulk generation** : depuis la page Contenu, sélectionner plusieurs vidéos et générer leurs Smart Links en lot.

## Agrégation et vues

- **Vue par Smart Link** : performance d'un lien précis (utile pour A/B test, voir quelle vidéo performe)
- **Vue par template / destination** : agrégat de tous les liens qui pointent vers la même destination (ex: total des bookings venus de tous les liens iClosed)
- **Vue par contenu** : dans Analytics, chaque vidéo/post montre son CA attribué via son Smart Link

Cette règle est la base du système de tracking. Sans ça, l'attribution au contenu est impossible.
