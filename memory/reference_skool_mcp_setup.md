---
name: skool-mcp-setup
description: "MCP Skool installé (repo louiewoof2026/skool-mcp) — auth par cookie auth_token, config à compléter"
metadata: 
  node_type: memory
  type: reference
  originSessionId: b3129184-3147-44a1-a8d6-c00c5a520cda
  modified: 2026-08-11T14:00:13.517Z
---

Skool n'a PAS d'API publique officielle (état août 2026). Accès programmatique = endpoints internes reverse-engineered.

MCP installé le 2026-08-11 :
- Repo : `~/dev/skool-mcp` (clone de github.com/louiewoof2026/skool-mcp, Node/TS, build dans `dist/`)
- Enregistré en scope user : `claude mcp add skool -- node ~/dev/skool-mcp/dist/index.js` (dans `~/.claude.json`)
- Config : `~/.config/skool-mcp/config.json` — champs `cookies` (`auth_token=JWT`), `defaultCommunity` (slug), `baseUrl`
- Auth : cookie `auth_token` (JWT httpOnly, ~1 an) récupéré via Chrome DevTools → Application → Cookies → skool.com. JAMAIS de login/password.
- 14 outils : community info, members (list/pending/approve/reject), posts (list/get/create/comment), courses/lessons, notifications, `skool.request` (requêtes brutes pour découvrir de nouveaux endpoints, doc dans API-DISCOVERY.md)
- Lectures via `/_next/data/{buildId}/...`, écritures via `api2.skool.com` ; User-Agent obligatoire (CloudFront 403 sinon).
