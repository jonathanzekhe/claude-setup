---
name: resolve-mcp-davinci
description: "Serveur MCP DaVinci Resolve installé dans ~/dev/resolve-claude-mcp, enregistré scope user sous le nom \"resolve\""
metadata: 
  node_type: memory
  type: reference
  originSessionId: 80629da4-5eca-411a-b4fe-ba977a15f40b
  modified: 2026-09-02T07:05:04.289Z
---

MCP "resolve" (barckley75/resolve-claude-mcp) installé le 2026-09-02 : repo dans `~/dev/resolve-claude-mcp`, deps via `uv sync --all-extras` (mlx-whisper inclus), enregistré en scope user (`claude mcp get resolve`). ~50 outils : montage, color, Fusion, Neural Engine, transcription locale, rendu, `execute_resolve_code`.

Attention : DaVinci Resolve Studio n'était PAS installé sur ce Mac au moment de l'install (seuls les fichiers support Blackmagic présents). Le serveur démarre mais les outils ne marcheront que quand Resolve Studio tourne avec scripting externe = Local (Préférences → Général). Chemin attendu : `/Applications/DaVinci Resolve/DaVinci Resolve.app`.
