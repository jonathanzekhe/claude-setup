---
name: project_brvndlab_links_audit_2026_07_08
description: Audit tribunal des liens internes Brvndlab + corrections déployées le 8 juillet 2026
metadata: 
  node_type: memory
  type: project
  originSessionId: f96f34c5-f03e-49a5-bb65-bd45259616c9
---

Audit complet des liens internes/redirections du SaaS Brvndlab (5 agents tribunal, unanimité) le 2026-07-08, puis corrections validées par tribunal 3 juges et déployées en prod (commit 796c02b + c5be25d sur main).

Corrigé et LIVE sur app.brvndlab.com :
- LinkedIn (`/reseaux/linkedin`) : ajout du support deep-link `?tab=create|mine|stats` (les 3 onglets étaient pilotés par useState local seulement, avant seuls `?post=` et `?topic=` marchaient). Le href sidebar reste nu (`/reseaux/linkedin`) car `isActive` compare `pathname === href` et un query param casserait le highlight + `moduleKeyForPath`.
- `/dashboard` (route morte, stub redirigé vers /home) remplacé par `/home` dans convex/coach.ts (notif invitation client) + public/manifest.json (start_url PWA).
- Analytics : les 3 liens retour de la fiche vidéo YouTube préservent l'onglet (`?tab=contenu&platform=youtube`).
- src/proxy.ts : 9 routes app ajoutées à isProtectedRoute (reseaux, affiliation, collaborateurs, upgrade, modules, client-intel, memoire-doree, resiliation, notifications). N'ajoute QUE l'enforcement auth ; le module-scope dépend de moduleKeyForPath, pas de isProtectedRoute.

Faux positifs de l'audit (dus au timing, l'audit tournait sur du code d'avant un commit Rush) : `/rush/p/[id]` et `/r-share/[token]` EXISTENT (routes committées, fonctionnelles). Ne pas les re-signaler. La non-navigation après création de projet Rush (TODO ligne ~251 de rush/page.tsx) est un choix committé intentionnel de Jonathan.

Incohérence nav NON tranchée (décision produit) : sidebar desktop a "Analytics" -> /reseaux/linkedin et aucun lien vers /analytics ; nav mobile a "Analytiques" -> /analytics et aucun lien vers linkedin. Deux registres qui divergent.

Voir [[feedback_verify_until_live]], [[feedback_verify_deploy_lineage_before_prod]].
