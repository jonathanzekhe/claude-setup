---
name: Zéro redondance dans toute l'UI Brvndlab
description: Règle absolue de communication visuelle — interdiction de répéter une info déjà visible ailleurs sur la page
type: feedback
originSessionId: b89456e2-2692-4863-b103-66dec20d323d
---
Aucune redondance dans aucune partie du SaaS Brvndlab. Si une information est déjà visible dans la page, elle ne doit pas être répétée ailleurs sur la même page.

## Why

Jonathan est designer/UX-driven. Chaque texte ou chiffre dupliqué le perd visuellement et l'oblige à scanner deux fois pour comprendre. Confirmé le 30 avril 2026 après plusieurs corrections sur la vue Monteur (compteurs répétés au-dessus des tabs, titre "Pricing consulting · partager les rushs" alors que le contexte est évident, sous-titres explicatifs des onglets, etc.).

## How to apply

À chaque mockup, page ou composant que je conçois ou modifie :

1. **Compteurs** : si un onglet affiche "Livrés (34)", ne pas écrire "34 livrés" ailleurs.
2. **Titres contextuels** : si on est dans la fiche "Pricing consulting", ne pas remettre "Pricing consulting · ..." dans une sous-section. Le contexte suffit.
3. **Labels d'onglet redondants avec sous-titres** : pas de sous-titre qui répète ce que l'onglet annonce déjà (ex : onglet "Lien transfert" + sous-titre "Colle ton lien WeTransfer, Drive…" → garder uniquement le placeholder de l'input).
4. **Pages title + breadcrumb** : pas de breadcrumb si la page title et la sidebar active rendent l'emplacement évident.
5. **Tabs / filtres / segmented controls** : ne pas dupliquer leur état dans une phrase au-dessus ("Vous êtes assigné · 4 contenus à traiter · 34 livrés" alors que les tabs montrent déjà 4 et 34 — supprimer la phrase).
6. **CTA** : "Cliquer pour ajouter" + bouton "+ Ajouter" → garder uniquement le bouton.
7. **Sous-titres de section** : pas de sous-titre qui paraphrase le titre. Soit le titre est self-explanatory, soit pas de section.
8. **Placeholders d'input** : remplacent les labels quand le contexte est clair. Pas les deux.
9. **Statuts** : un état (ex : "En retard") s'affiche **une seule fois** par item, à la place la plus visible (chip ou pill, pas les deux).
10. **Avant de livrer** : relire la page entière, demander "qu'est-ce que je peux supprimer sans rien perdre ?". Si la réponse n'est pas vide → supprimer.

Cette règle s'applique aux mockups, à l'app live, aux emails, aux notifications, à l'onboarding, à toute communication visuelle Brvndlab.
