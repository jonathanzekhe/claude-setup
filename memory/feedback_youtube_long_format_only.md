---
name: YouTube = long format uniquement (filtre format, pas durée)
description: Règle absolue de tracking YouTube dans Brvndlab. Filtrer par FORMAT (HEAD request) et non par durée seule. Aucun Short ne doit remonter dans Analytics, Radar, Recherche ou scan IA.
type: feedback
originSessionId: 062d19ad-1792-4638-9e23-3721dcc00ca0
---
YouTube est traqué uniquement en **long format**. Aucun Short ne doit apparaître nulle part : Analytics, Radar Marché/Concurrents/Références, Recherche, scans IA.

**Why:** Brvndlab cible les entrepreneurs/coaches B2B qui produisent du contenu profond. Les Shorts polluent les signaux. Aussi, filtrer uniquement par durée ≤ 60s NE MARCHE PAS depuis 2024 : YouTube a étendu les Shorts à 3 min. Les Shorts entre 60s et 180s passent à travers tout filtre durée. Jonathan a dû demander 3+ fois de fixer ça.

**How to apply:** La détection doit être **format-based** via HEAD request vers `https://www.youtube.com/shorts/{videoId}` :
- Status 200 → c'est un Short → skip
- Status 303 → redirection vers /watch → vidéo classique → keep

**Critique** : utiliser User-Agent Googlebot pour bypasser la page consentement RGPD (sinon 302 vers consent.youtube.com depuis EU/CH). Implémenté dans `convex/youtubeChannelsActions.ts` via le helper `isYouTubeShort(videoId, durationSeconds)`. Fast path : durée > 180s → pas un Short, pas de HEAD nécessaire. Fallback en cas d'erreur réseau : durée ≤ 60s.

Appliqué dans 3 paths : `connectChannel`, `resyncChannel` (qui n'avait AUCUN filtre Shorts avant), `_internalTestConnect`.

Pour les autres scans (radar/recherche), la même logique format-based doit être utilisée — le filtre durée ≤ 60s actuel dans `radarActions.ts` rate les Shorts 60-180s.
