---
name: Toute action structurelle Brvndlab doit être répercutée sur le doc CTO Vercel
description: Suppression/ajout/refactor dans brvndlab-app/ = entrée Changelog datée dans brvndlab-stack.vercel.app + redéploiement.
type: feedback
originSessionId: 46f65b5e-003b-4011-999f-19a64bd37793
---
Quand je supprime, déplace, ajoute ou remplace quelque chose de structurel dans `Brvndlab/brvndlab-app/` (routes API, intégrations, dépendances majeures, providers IA, schéma Convex, etc.), je dois immédiatement :
1. Ajouter une entrée datée en haut du Changelog dans `/Users/businessmanagement/Documents/Claude AI/brvndlab-stack/index.html`
2. Redéployer : `cd "/Users/businessmanagement/Documents/Claude AI/brvndlab-stack" && vercel deploy --prod --yes --scope jonathanzekhe-4288s-projects`

**Why:** Jonathan a explicitement demandé que le CTO/Dev puisse toujours voir l'état actuel via brvndlab-stack.vercel.app. Une suppression locale invisible sur le doc = vue désynchronisée pour le CTO = perte de confiance dans la doc.

**How to apply:** Pas besoin pour les changements UI cosmétiques, les bugfix internes, le typing, ou les ajustements de copy. Trigger uniquement sur les changements visibles dans l'architecture, la stack, les APIs externes, les coûts ou la sécurité.
