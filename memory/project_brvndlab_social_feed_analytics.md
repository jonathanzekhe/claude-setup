---
name: Feed social navigable dans Analytics
description: Vision Jonathan 21 avril 2026 -- dans /analytics, afficher le feed social du client (YouTube/IG/TT) avec drill-down par video pour voir les stats detaillees.
type: project
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
Feature demandée le 21 avril 2026 par Jonathan : dans la page `/analytics`, afficher le feed social complet du client (ses propres videos YouTube, ses posts IG, ses videos TT), et permettre de cliquer sur une video pour voir ses analytics detaillees dans un drawer.

**Why:** Aujourd'hui le client doit ouvrir YouTube Studio / Instagram Insights / TikTok Analytics separement pour voir ses stats. Brvndlab doit etre le point unique. Plus important encore : un feed visuel navigable transforme le dashboard d'un tableau de chiffres en une experience produit proche du consumer (TikTok UX).

**How to apply:**
- Depend de Sprint 2 (OAuth YouTube + TikTok) et Sprint 3 (Instagram Meta Review) pour les feeds prives.
- Pour le PUBLIC feed YouTube : possible maintenant via YOUTUBE_API_KEY existant + contentItems.publishedUrl. Le cron `youtube metrics daily refresh` rafraichit deja les stats.
- Composant `SocialFeed` dans `/analytics` avec tabs YouTube / Instagram / TikTok.
- Chaque card video = thumbnail + title + views + engagementRate + badge de type (long/short).
- Click sur video -> `ContentDrawer` existe deja dans /analytics/page.tsx -> afficher timeSeries (getTimeSeriesForContent) + stats detailles (getLatestForContent).
- Ordre : le client voit SON feed d'abord, les metriques suivent en drawer.
- Design Frosted Bento, aligne sur le design system.

**Phasing:**
- Phase 1 (feasible now) : feed YouTube via publishedUrl + YOUTUBE_API_KEY, drill-down dans drawer.
- Phase 2 : feed TikTok via OAuth TikTok Developer (Sprint 2).
- Phase 3 : feed Instagram via OAuth Meta (Sprint 3 apres review).

**Not to confuse with:**
- `/monitoring` (Radar) : feed des CONCURRENTS/REFERENCES, pas du client lui-meme.
- `/research` : recherches manuelles sur le marche, pas le feed personnel.
