---
name: feedback_r2_demo_pas_de_bibliotheque
description: "RÈGLE R2 : jamais de section Bibliothèque (Data, Process, Records) dans une démo SaaS ou un deck R2, c'est trop technique pour un dirigeant"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 53804109-54e8-4c36-ae00-f38a2f7119a6
  modified: 2026-08-17T07:51:34.741Z
---

Dans TOUT support de R2 (démo SaaS client type inkcloth-demo/chardon-demo, deck, maquette), la section **Bibliothèque et ses sous-modules (Data, Process, Records, Onboarding, Projets) est SUPPRIMÉE**. Décision Jonathan du 17/08/2026, appliquée à inkcloth-demo.

**Why:** On montre un outil de pilotage à un dirigeant en appel de vente, pas une arborescence de fichiers ni des SOPs. « Data » et « Process » sont trop techniques, ne parlent à personne et diluent le message. Ça ne concerne QUE les supports R2 : les modules restent en place dans le vrai produit.

**How to apply:** Retirer le groupe de la sidebar (constante `BIBLIOTHEQUES` + son `SectionLabel`), du registre `components/nav/modules.ts` (+ `GROUP_ORDER`), des `PAGE_LABELS` de `Header.tsx` et `MobileHeader.tsx`, de `SHELL_PREFIXES` dans `ShellGate.tsx`, et de la liste de droits de `settings/UserManagementCard.tsx`. Les routes `src/app/bibliotheque/*/page.tsx` sont remplacées par un `redirect('/dashboard')` (jamais laissées accessibles par URL). Vérifier ensuite que la sidebar n'affiche plus que : Commandes · Pilotage · Agentique · Configuration.

Voir [[project_r2_demo_saas_par_client]] [[project_r2_template_system]] [[project_r2_deck_inkcloth_emmanuel]].
