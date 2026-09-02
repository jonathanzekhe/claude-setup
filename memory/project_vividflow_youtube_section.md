---
name: project-vividflow-youtube-section
description: "Section YouTube \"En vidéo\" en prod sur vividflow.co (variante A scellée, entre Process et FAQ)"
metadata: 
  node_type: memory
  type: project
  originSessionId: f0d892c9-718f-4cea-9d9a-f78f493d2070
---

Section YouTube intégrée en prod sur vividflow.co le 2026-06-10. Contenu de la variante A (grille éditoriale, date + titre, pas de numérotation) avec le traitement sombre de la variante C (fond noir #231F20, texte crème, CTA orange) : Jonathan a basculé en sombre pour réserver le crème aux futurs témoignages clients en vidéo. Mockups d'origine : vividflow.co/youtube-variants.html?only=a/b/c (fichier conservé). Eyebrow "En vidéo" (Jonathan a refusé "La chaîne"). Ancre `#videos`, placée entre Process et FAQ.

Contenu : les 3 vidéos de la chaîne @Jonathanzkh (thumbnails maxresdefault i.ytimg.com, liens watch directs, bouton S'abonner avec `?sub_confirmation=1`). Si nouvelles vidéos publiées, mettre à jour les 3 cartes à la main (pas d'API branchée).

Piège technique : `.section-title br { display:none }` sous 640px sur le site. Toujours écrire `mot <br>mot` (espace avant le br) sinon les mots se collent en mobile.

**REFONTE COMPLÈTE (2026-07-21, « j'aime beaucoup cette version, très propre »)** — l'ancienne version (grille 3 vidéos dans un `.ytd-frame` carte noire posée sur fond blanc) a été REJETÉE : « très mal fait », on voyait deux fonds (noir + blanc autour), 3 vidéos empilées = scroll infini en mobile, CTA sur 2 lignes + pastille « @Jonathanzkh » = « dégueulasse ». Nouveau design :
- **DISTINCTION desktop/mobile SCELLÉE (corrigé 2026-07-21)** — le full-noir-bord-à-bord ET les flèches/carrousel sont **MOBILE UNIQUEMENT**, jamais desktop :
  - **DESKTOP** : `.yt-section{background:transparent}` + le contenu dans un **`.ytd-frame`** = cadre noir #121212 arrondi (radius 28) posé sur le fond blanc pointillé du site, ombre portée, ~40px de marge blanche de chaque côté (« l'espace où on voit le fond blanc derrière »). Les 3 vidéos en **grille** `.ytd-track{display:grid;3 colonnes}`, **flèches `.ytd-nav` masquées** (`display:none`).
  - **MOBILE (≤640px)** : `.yt-section{background:#121212;padding:0}` full noir bord à bord (fullbleed), `.ytd-frame` neutralisé (`background:transparent;border-radius:0;box-shadow:none`), `.ytd-track` repasse en **carrousel** flex scroll-snap, **flèches `.ytd-nav` visibles**. Jonathan a rappelé 2× que ces règles (fond entier, flèches) étaient « uniquement sur téléphone portable » — ne JAMAIS les appliquer en desktop.
- **Titre serif à la ligne** : `Regardez l'IA appliquée à<br><em>de vraies entreprises.</em>` — le `<em>` Instrument Serif italic + le point vont à la ligne ensemble (exigence Jonathan). 42px desktop / 29px mobile. **Le sous-titre `.ytd-sub` « Analyses et déploiements concrets, publiés sur YouTube. » a été RETIRÉ** (2026-07-21, desktop + mobile : « on s'en fout »).
- **Carrousel à FLÈCHES CENTRÉES sous le titre** (`.ytd-nav` : `#ytd-prev`/`#ytd-next`, ronds), une seule vidéo affichée (`.ytd-track` flex scroll-snap, `.ytd-slide{flex:0 0 100%}`, JS `scrollBy(±clientWidth)`). Flèches JAMAIS sur les côtés de la vidéo (« ça me dérange »). Choisi CONTRE les pastilles numérotées 1·2·3 car scalable (« si je mets plus de vidéos un jour, on fait comment ? »).
- **CTA `.yt-cta-primary`** « S'abonner sur YouTube » sur UNE ligne (`white-space:nowrap`), orange→crème hover. Handle « @Jonathanzkh » (`.yt-handle`) RETIRÉ.
- Vidéos réelles inchangées (Pw0x_8lZTI0 / irb8VWvmZ-A / CipfnKhN2LU). Mockups : youtube-mobile-variants.html (l'ancien youtube-variants.html de juin est obsolète).

Lié à [[project_vividflow]].
