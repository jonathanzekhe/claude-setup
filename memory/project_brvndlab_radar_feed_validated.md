---
name: Radar Feed validé (variante C newsletter)
description: Le feed du Radar est une carte unique navigable (variante C) + strip d'avatars. Plus de feed plat. Période 24h/7j/30j fonctionnelles avec labels dynamiques.
type: project
originSessionId: b89456e2-2692-4863-b103-66dec20d323d
---
Validé 2026-04-28. Le Radar (subnav Feed) affiche une **carte unique** par signal sélectionné + un **strip d'avatars en bas** pour parcourir tous les signaux du marché.

**Composants validés**
- Pill rouge "Pic détecté" si ratio ≥ 1.5× baseline, pill bleu "Top vu" sinon
- Headline narrative générée par Opus (analyzeWeekSignal action) à partir du transcript du signal
- Card vidéo avec thumbnail + titre + créateur + chiffre vues (label "VUES" en gris discret sous le chiffre)
- Bloc insight "Ce qui marche" / "Ce qu'on observe" (Opus, depuis transcript)
- 2 CTA : "Brainstorm un angle similaire" (primary noir) + "Ouvrir la fiche [Créateur]" (ghost)
- Bouton rouge YouTube (logo + label "Voir") en haut à droite avec flèches nav ‹ ›
- Strip bas : tous les signaux ordonnés par ratio desc, avec mini-pillet "Pic" / "Top"
- Pas de titre "Signaux de la semaine" (vide, supprimé)
- Card collée au Brief noir au-dessus (`!mt-3` pour casser le space-y-8 de la page)

**Why** : Jonathan voulait un format "newsletter" qui expose tout le marché en un écran sans scroll long. Décomposition demandée des 3 variantes A/B/C, choix C pour la vue d'ensemble + détail riche en même temps.

**How to apply** : Toute évolution future du Radar Feed reprend ce squelette. Pas de feed plat / archive / liste. Si nouvelle info à montrer, l'ajouter à la card courante OU à la fiche créateur, jamais en feed séparé.

**Backend associé**
- `radar.listWeekSignals` (query) prend `windowDays` + `sourceTab` ("concurrents" / "references"), retourne 1 signal par créateur trié par ratio
- `radarActions.analyzeWeekSignal` (action) : Opus 4.7 sur transcript, prompt conditionnel selon ratio (pic vs top vu), output JSON {headline, whatWorks}
- Cache narrative sur `marketSignals.weekSignalNarrative`, refresh si > 24h
- Cron `radar competitors daily rescan` à 5h30 UTC : sans ça, les signaux vieillissent et le feed se vide
