---
name: Doc Stack CTO Brvndlab
description: Page Vercel brvndlab-stack.vercel.app maintenue à jour pour le CTO/Dev. Source vérité technique externe.
type: project
originSessionId: 46f65b5e-003b-4011-999f-19a64bd37793
---
URL prod : https://brvndlab-stack.vercel.app
Dossier local : `/Users/businessmanagement/Documents/Claude AI/brvndlab-stack/` (index.html + vercel.json)
Projet Vercel : `jonathanzekhe-4288s-projects/brvndlab-stack`

Contenu :
- Architecture globale + 3 schémas SVG (architecture, Smart Link → Lead, Webhook paiement, Ingestion YouTube)
- Liste complète Frontend / Backend / IA / APIs externes avec versions
- Coûts mensuels estimés (~$350-475/mois hors transactions)
- Changelog en bas de page (toutes suppressions/modifs structurelles)

**Why:** Le CTO/Dev a besoin d'une vue continue sur l'état du code sans avoir à fouiller le repo. C'est le snapshot externe partageable de la stack Brvndlab.

**How to apply:** Quand je modifie quelque chose de structurel dans Brvndlab/brvndlab-app/ (suppression de routes/dossiers, ajout d'intégration, changement de provider IA, montée de version majeure, etc.), je redéploie ce doc avec une nouvelle entrée Changelog datée. Redéploiement : `cd "/Users/businessmanagement/Documents/Claude AI/brvndlab-stack" && vercel deploy --prod --yes --scope jonathanzekhe-4288s-projects`.
