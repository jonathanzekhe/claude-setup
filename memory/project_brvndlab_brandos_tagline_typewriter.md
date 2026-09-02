---
name: project-brvndlab-brandos-tagline-typewriter
description: "Brand OS hub : 5 taglines validées (26/08) sous le titre, effet machine à écrire, rotation séquentielle localStorage, toujours finir par ... jamais point ferme"
metadata: 
  node_type: memory
  type: project
  originSessionId: 8e450f89-16aa-48da-8dc9-0ebf45281751
  modified: 2026-08-26T11:26:52.026Z
---

Le 2026-08-26 Jonathan a validé les 5 phrases affichées sous « L'ADN de ta brand » sur /brand-os, tapées à la machine à écrire à chaque arrivée, en rotation séquentielle (compteur localStorage `brvndlab.bos.tagline`) :

1. Le cœur de ta communication...
2. Tout ce que tu crées part d'ici...
3. Ce qui rend ta marque impossible à copier...
4. Ce que l'IA sait de toi avant d'écrire...
5. La mémoire vivante de ta marque...

Règle de style validée : ces phrases finissent TOUJOURS par « ... » (petits points, continuité), jamais par un point ferme. Il avait rejeté « Plus il est précis, plus tes contenus te ressemblent ».

Implémentation : composant TaglineTypewriter dans src/app/(app)/brand-os/page.tsx + styles .tagline/.caret dans brandos.css (min-height réservé = zéro layout shift, caret qui s'éteint en fin de frappe, prefers-reduced-motion respecté). Déployé prod cc1ca59c, vérifié live avec le robot E2E ([[reference-e2e-robot-brvndlab]] : le robot viewer ACCÈDE bien à /brand-os, pas éjecté par le guard).
