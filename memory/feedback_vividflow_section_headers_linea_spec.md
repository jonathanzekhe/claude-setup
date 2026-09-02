---
name: feedback-vividflow-section-headers-linea-spec
description: "Spec SCELLÉE des en-têtes de section vividflow.co — format Linea centré, tailles/typos/couleurs exactes"
metadata:
  type: project
---

**Spec scellée (2026-07-19, réf lineads.framer.website, « picture perfect » exigé par Jonathan)** pour TOUS les en-têtes de section de vividflow.co (classes `.lin-hdr`/`.lin-cap`/`.lin-title` dans index.html) :

- **Centrés** (plus jamais à gauche — l'ancien pattern gauche `.ccm-hdr` est mort).
- **Label** (eyebrow) : Satoshi Medium 14px / line-height 20px / letter-spacing 2.8px / #616161 / uppercase / **souligné** (underline offset 5px), 22px sous lui.
- **Titre** : 52px / line-height 46.8px / #121212, UNE ligne, mélange deux typos : Satoshi Medium letter-spacing −2.1px pour la partie sans + **Instrument Serif Regular Italic letter-spacing −0.5px** pour le fragment em (même couleur, jamais d'orange). Mobile ≤760px : 36px/34px/−1.4px.
- Règle du fragment serif italic : la partie « valeur client » du titre (des résultats concrets / chez vous / votre métier / y gagnez).

Les 4 titres en place : « Comment on vous apporte *des résultats concrets* » (Comment ça marche) · « Ce qu'on installe *chez vous* » (La solution) · « L'IA appliquée à *votre métier* » (Études de cas) · « Ce que vous *y gagnez* » (Bénéfices). LIVE vérifié. Toute nouvelle section doit suivre cette spec.


**AJUSTEMENT TAILLE 2026-07-19 (Jonathan : les titres et le calendrier etaient trop gros, pas equilibres) :** les titres de section .lin-title et .ytd-title passent de 52px a **42px** (line-height 1.06, letter-spacing -1.6px) pour rester PLUS PETITS que le hero (~48px) et le statement intro .vf-intro-st (qui RESTE a 52px, valide). Header .lin-hdr margin-bottom 56->44px, .lin-cap margin-bottom 22->18px (plus compact/centre). Reference d equilibre = pages etudes de cas (h2 ~42px). Le panneau CTA final .fcta cale a l identique des etudes de cas : max-width **1080px** (etait 1400), padding 48px, titre h2 34px sur 2 lignes.

**LARGEUR DES CONTENEURS (audit 2026-07-19, Jonathan : trop large, ca touche les bords, pas coherent avec les pages etudes de cas) :** REFERENCE = pages etudes de cas qui plafonnent TOUT a max-width 1080px. Sur la home index.html, les conteneurs etaient a 1360px (ccm-grid, sol-bento, edc-table) et 1280px (offre-wrap, ytd-wrap) -> TROP LARGE, touchait presque les bords. Corriges : ccm-grid / sol-bento / edc-table = **max-width 1200px** ; offre-wrap = 1200px (au lieu de 1280) ; ytd-wrap = 1200px ; ben-stage = max-width 1120px ; ces conteneurs avec padding lateral 40px rendent ~1120px de contenu reel. Intro (.vf-intro-wrap) et panneau CTA final (.fcta-wrap) = 1080px (= exactement la ref etudes de cas). REGLE : toute section de la home doit rester <= 1200px de conteneur (marge visible sur les cotes), jamais 1360/1280. Toujours calibrer sur les pages etudes de cas.

**CORRECTION LARGEUR v2 (2026-07-19) : cale EXACTEMENT sur la page etudes-de-cas/cas-usage/equipes-commerciales.** Mesures live de la ref : sections de contenu rendent 960px (max-width 960 + pad 32), panneau CTA rend 1016px (max-width 1080). La home etait a 1120px (trop large). Teste 960px pur = cartes Comment ca marche ecrasees (contenu fixe, textes coupes). COMPROMIS RETENU ET LIVE : toutes les sections de contenu de la home a **max-width 1080px** (ccm-grid, sol-bento, edc-table, ben-stage, vf-intro-wrap, fcta-wrap tous a 1080 rendu), offre-wrap 1160, ytd-wrap 1160. 1080 = largeur max de la page etudes de cas (leur panneau CTA), donne une vraie marge sur les cotes ET garde les cartes complexes lisibles. Les iframes de La solution se re-scalent seules (solFit).