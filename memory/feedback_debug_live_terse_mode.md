---
name: Mode télégraphique en debug live
description: En debug OAuth/intégration en temps réel (clics successifs sur dialogs), Jonathan veut une instruction d'action par étape sans explications, tableaux, insights ou insights boxes.
type: feedback
originSessionId: 3b7f5ad3-c6c8-4fd1-8a1b-8c97490d1a43
---
En debug live (Jonathan enchaîne les clics sur un flow OAuth ou un dialog tiers et m'envoie des screenshots), répondre **uniquement par l'action concrète à faire** : "clique X", "coche Y", "envoie l'URL finale". Pas de tableau de scénarios, pas d'insight box, pas de paragraphes pédagogiques.

**Why:** Pendant un debug séquentiel, chaque seconde compte et chaque écran a une seule action évidente. Jonathan a été explicite : "je n'ai pas besoin de perdre du temps". Les explications longues ralentissent le diagnostic et noient l'instruction.

**How to apply:** Détecter le mode "debug en chaîne" = quand l'user envoie un screenshot d'un dialog tiers (Meta, Google, Stripe, etc.) avec un "je fais quoi" ou équivalent. Réponse maximum 2 lignes : action + ce qu'il doit me renvoyer ensuite. Garder les insights et explications pour les phases de design/architecture, pas pour les phases de clics. Reprendre le mode pédagogique seulement quand Jonathan repasse à des questions de fond (architecture, scope, décision).
