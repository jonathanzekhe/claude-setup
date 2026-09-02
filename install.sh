#!/bin/bash
# Installation complète du setup Claude de Jonathan sur un nouveau Mac.
# Usage : ./install.sh
# Idempotent : peut être relancé sans casser l'existant.

set -uo pipefail
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
PROJECT_DIR="$HOME/Documents/Claude AI"

echo "== 1/7 Skills et commands =="
mkdir -p "$CLAUDE_DIR/skills" "$CLAUDE_DIR/commands"
cp -R "$REPO_DIR/skills/." "$CLAUDE_DIR/skills/"
cp -R "$REPO_DIR/commands/." "$CLAUDE_DIR/commands/"
echo "   $(ls "$CLAUDE_DIR/skills" | wc -l | tr -d ' ') skills installés"

echo "== 2/7 CLAUDE.md global =="
if [ -f "$CLAUDE_DIR/CLAUDE.md" ]; then
  echo "   CLAUDE.md existe déjà -> sauvegardé en CLAUDE.md.bak"
  cp "$CLAUDE_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md.bak"
fi
cp "$REPO_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"

echo "== 3/7 Settings =="
if [ -f "$CLAUDE_DIR/settings.json" ]; then
  echo "   settings.json existe déjà -> template copié en settings.template.json, fusion manuelle"
  cp "$REPO_DIR/settings/settings.template.json" "$CLAUDE_DIR/settings.template.json"
else
  cp "$REPO_DIR/settings/settings.template.json" "$CLAUDE_DIR/settings.json"
  echo "   ATTENTION : remplacer REMPLACER_PAR_TON_TOKEN_GITHUB dans ~/.claude/settings.json"
fi

echo "== 4/7 Mémoire (connaissances projets) =="
mkdir -p "$PROJECT_DIR"
SLUG="$(echo "$PROJECT_DIR" | tr '/ ' '--')"
MEM_DEST="$CLAUDE_DIR/projects/$SLUG/memory"
mkdir -p "$MEM_DEST"
cp -R "$REPO_DIR/memory/." "$MEM_DEST/"
echo "   $(ls "$MEM_DEST" | wc -l | tr -d ' ') fichiers mémoire -> $MEM_DEST"
mkdir -p "$PROJECT_DIR/.remember"
cp -R "$REPO_DIR/remember/." "$PROJECT_DIR/.remember/"

echo "== 5/7 MCP DaVinci Resolve =="
if ! command -v uv >/dev/null 2>&1; then
  echo "   uv absent -> installation"
  curl -LsSf https://astral.sh/uv/install.sh | sh
  export PATH="$HOME/.local/bin:$PATH"
fi
UV_BIN="$(command -v uv || echo "$HOME/.local/bin/uv")"
mkdir -p "$HOME/dev"
if [ ! -d "$HOME/dev/resolve-claude-mcp" ]; then
  git clone https://github.com/barckley75/resolve-claude-mcp.git "$HOME/dev/resolve-claude-mcp"
fi
(cd "$HOME/dev/resolve-claude-mcp" && "$UV_BIN" sync)
claude mcp add-json resolve --scope user "{
  \"type\": \"stdio\",
  \"command\": \"$UV_BIN\",
  \"args\": [\"--directory\", \"$HOME/dev/resolve-claude-mcp\", \"run\", \"resolve-claude-mcp\"],
  \"env\": {
    \"RESOLVE_SCRIPT_LIB\": \"/Applications/DaVinci Resolve/DaVinci Resolve.app/Contents/Libraries/Fusion/fusionscript.so\",
    \"PYTHONPATH\": \"/Library/Application Support/Blackmagic Design/DaVinci Resolve/Developer/Scripting/Modules/\"
  }
}" 2>/dev/null || echo "   (MCP resolve déjà enregistré ou claude CLI absent — voir README)"

echo "== 6/7 MCP Skool =="
if [ ! -d "$HOME/dev/skool-mcp" ]; then
  git clone https://github.com/louiewoof2026/skool-mcp.git "$HOME/dev/skool-mcp"
fi
(cd "$HOME/dev/skool-mcp" && npm install && npm run build)
claude mcp add-json skool --scope user "{
  \"type\": \"stdio\",
  \"command\": \"node\",
  \"args\": [\"$HOME/dev/skool-mcp/dist/index.js\"],
  \"env\": {}
}" 2>/dev/null || echo "   (MCP skool déjà enregistré ou claude CLI absent — voir README)"

echo "== 7/7 Plugins =="
while IFS= read -r plugin; do
  [ -z "$plugin" ] && continue
  claude plugin install "$plugin" 2>/dev/null || echo "   à installer manuellement via /plugin : $plugin"
done < "$REPO_DIR/plugins.txt"

echo ""
echo "== TERMINÉ =="
echo "Reste à faire manuellement :"
echo "  1. Token GitHub dans ~/.claude/settings.json (si nouveau settings)"
echo "  2. DaVinci Resolve Studio installé + Préférences > Système > General > External scripting using = Local"
echo "  3. Connecteurs claude.ai (Gmail, Calendar, Notion, Canva, Wispr...) via les settings claude.ai"
echo "  4. Lancer 'claude' dans ~/Documents/Claude AI pour vérifier que tout charge"
