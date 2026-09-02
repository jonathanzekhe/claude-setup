---
name: project_vividflow_final_cta_block
description: "Bloc final orange CTA vividflow.co (.final-section) — desktop calendrier animé, mobile 3 stats (45 min / 0 CHF / 1:1)"
metadata:
  node_type: memory
  type: project
  originSessionId: e36b2602-f661-40d5-ab17-c52cb8081ab9
---

Bloc final de la home vividflow.co (`.final-section` / `.fcta` dans index.html, repo site-mockups), juste avant le footer. Panneau orange dégradé (#ff5a1f→#E34400), titre « Passez à l'IA en premier.<br><span class="ital">Ou rivalisez avec ceux qui l'ont fait.</span> » (2e ligne Instrument Serif italic), bouton blanc « Réserver mon audit » (lien iclosed appel-de-d-mo).

**DISTINCTION desktop/mobile SCELLÉE (2026-07-21)** :
- **DESKTOP (inchangé)** : grille 2 colonnes = texte à gauche + **calendrier animé `.fcal`** à droite (grille 7 colonnes des jours du mois, un jour se « sélectionne » tout seul en boucle 6,4s → confirmation « Réservé » → reset). Sous-texte `.txt p` « 45 min avec un expert IA, sans engagement. » présent.
- **MOBILE (≤640px, version C validée)** : le calendrier animé RETIRÉ (`.fcal{display:none}`) — il « cassait/bougeait en bas », instable une fois empilé. Le sous-texte `.txt p` RETIRÉ aussi (`display:none`). Remplacés par **`.fcta-stats`** = 3 colonnes de réassurance séparées par un filet, mobile only (`display:flex`, desktop `display:none`) :
  - **45 min** — d'audit de votre entreprise (corrigé 2026-07-22, était « d'audit avec un expert » → redondant avec le 3e bloc)
  - **0 CHF** — aucun engagement (franc suisse, jamais €)
  - **1:1** — avec un expert IA
  Chaque colonne = un chiffre `.n` (Satoshi 21px bold) + un libellé `.l` qui **se lit seul** (exigence Jonathan : « 0 CHF / sans engagement » ne se comprenait pas → chaque bloc doit avoir un sens autonome). « 1:1 » = one-on-one, important de le dire. Rejetés : « 24h pour être rappelé » (ça veut rien dire), « Gratuit » (a préféré 0 CHF).

Mockups : final-cta-mobile-variants.html (A puces réassurance, B créneau statique, C stats → C choisi). Le JS du calendrier (`fcalGrid`, loop) tourne encore mais `.fcal` masqué en mobile = sans effet visible. Lié à [[project_vividflow]].
