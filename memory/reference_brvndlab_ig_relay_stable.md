---
name: brvndlab-ig-relay-stable
description: "Relais Instagram VPS = URL STABLE http://76.13.52.163/ig-relay (nginx → 127.0.0.1:8793), secret dans /opt/ig-relay/relay.env ; ne JAMAIS remettre un tunnel trycloudflare éphémère"
metadata: 
  node_type: memory
  type: reference
  originSessionId: 26b311ed-ff18-48b0-9392-0c9b154ae853
---

Panne Inspiration/Instagram du 19/07/2026 (cartes vides) — deux causes cumulées :
1. `INSTAGRAM_SESSIONID` (compte technique falsego) mort : 403 `login_required` logout_reason 8. Se rafraîchit en se reconnectant au compte falsego sur instagram.com dans un navigateur → DevTools → cookie `sessionid` → `printf '<valeur>' | npx vercel env add INSTAGRAM_SESSIONID production` (jamais echo). Nécessaire seulement pour la qualité max (dumps/slides via l'API privée).
2. `IG_SCRAPER_URL` / `IG_RELAY_SECRET` VIDES en prod : le fallback relais n'était jamais appelé. Cause racine : le relais était exposé par un tunnel cloudflared QUICK (`trycloudflare.com`) dont l'URL change à chaque reboot du VPS (3 reboots cette semaine-là).

FIX PÉRENNE : le service `ig-relay` (systemd, port local 8793, Chrome headless, `/opt/ig-relay/`, secret dans `/opt/ig-relay/relay.env`) est exposé par nginx du VPS vividflow-vps (srv1601285, IPv4 76.13.52.163) via `location /ig-relay/` dans `/etc/nginx/sites-enabled/vividflow` → **URL STABLE `http://76.13.52.163/ig-relay`**, protégée par le header `x-relay-secret`. C'est cette URL qui vit dans `IG_SCRAPER_URL` (prod Vercel). Ne JAMAIS repasser par un quick tunnel. Le service `cloudflared-igrelay.service` est devenu inutile (peut être désactivé).

Rappel archi (`src/app/api/inspiration/ig-media/route.ts`) : API privée IG (sessionid) → fallback relais public (ratio/poster/caption/MP4 progressif). Après changement d'env Vercel : redeploy obligatoire (commit vide + rail).

Suite (même jour) : les reels retombaient ENCORE sur l'embed « Regarder sur Instagram » car chaque requête (méta + chaque range request du `<video>`) re-tentait l'API privée morte (7 s de timeout) avant le relais. Fix dans la route : cache négatif 10 min après 401/403/login_required (`privateApiDeadUntil`), cache mémoire des métadonnées par shortcode 30 min (`metaCache`), timeout privé 4 s. Vérifié : relais → videoUrl MP4, CDN 206 video/mp4 avec Range + UA simple.
