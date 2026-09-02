# Claude Setup — Transfert complet (Jonathan)

Repo de transfert de l'instance Claude Code du Mac principal vers un nouveau Mac.
Contient tous les skills, les connaissances (mémoire), la config, et l'installation
des MCP, notamment **DaVinci Resolve** pour le montage vidéo.

## Installation rapide (pour l'instance Claude du nouveau Mac)

```bash
git clone https://github.com/jonathanzekhe/claude-setup.git ~/dev/claude-setup
cd ~/dev/claude-setup
chmod +x install.sh
./install.sh
```

Le script est idempotent. Il installe tout et liste à la fin ce qui reste manuel.

## Contenu du repo

| Dossier | Contenu | Destination |
|---|---|---|
| `skills/` | 46 skills custom (design-max, brainstorm-loop, correction-saas, ultra-audit, moodboard-process, stress-test...) | `~/.claude/skills/` |
| `commands/` | Slash commands custom (/fast, /check, /goal, /youtube-script + références) | `~/.claude/commands/` |
| `CLAUDE.md` | Instructions globales (mode opératoire Jonathan, règles Brvndlab/VividFlow) | `~/.claude/CLAUDE.md` |
| `memory/` | 403 fichiers de mémoire persistante : tout le contexte Brvndlab, VividFlow, Bold Shift, préférences, garde-fous | `~/.claude/projects/<slug-du-projet>/memory/` |
| `remember/` | Historique de sessions (plugin remember) | `~/Documents/Claude AI/.remember/` |
| `settings/settings.template.json` | Settings complets (permissions, hooks, plugins) — **token GitHub retiré, à remettre** | `~/.claude/settings.json` |
| `plugins.txt` | Liste des 27 plugins à installer | via `claude plugin install` ou `/plugin` |

## DaVinci Resolve (montage vidéo piloté par Claude)

Le MCP DaVinci n'est pas vendored ici : c'est un clone du repo public
[barckley75/resolve-claude-mcp](https://github.com/barckley75/resolve-claude-mcp)
(aucune modification locale). Le script `install.sh` :

1. Installe `uv` si absent
2. Clone le repo dans `~/dev/resolve-claude-mcp` puis `uv sync`
3. Enregistre le MCP en scope **user** avec l'env requis :
   - `RESOLVE_SCRIPT_LIB=/Applications/DaVinci Resolve/DaVinci Resolve.app/Contents/Libraries/Fusion/fusionscript.so`
   - `PYTHONPATH=/Library/Application Support/Blackmagic Design/DaVinci Resolve/Developer/Scripting/Modules/`

**Prérequis manuels sur le nouveau Mac :**
- DaVinci Resolve **Studio** installé (le scripting externe nécessite Studio)
- Resolve > Préférences > Système > General > *External scripting using* = **Local**
- Resolve doit être **ouvert** avec un projet chargé pour que les outils MCP répondent

Outils disponibles ensuite : timelines, montage, marqueurs, transcription/sous-titres
(Whisper), Fusion, color (LUT/CDL), stabilisation, Magic Mask, smart reframe, rendu.

## MCP Skool

Clone de [louiewoof2026/skool-mcp](https://github.com/louiewoof2026/skool-mcp),
buildé en local (`npm install && npm run build`), enregistré en scope user.

## À faire manuellement après install.sh

1. **Token GitHub** : remplacer `REMPLACER_PAR_TON_TOKEN_GITHUB` dans `~/.claude/settings.json`
2. **Connecteurs claude.ai** (Gmail, Google Calendar, Notion, Canva, Wispr Flow, tldv, Google Drive) : à autoriser dans les settings claude.ai du compte
3. **Auth locales** : `gh auth login`, Vercel CLI, Convex CLI (voir mémoire `feedback_convex_cli_1341_lies_use_1421`)
4. **Repo Brvndlab canonique** : cloner dans `~/dev/brvndlab-claude/brvndlab-app` — JAMAIS travailler dans `~/Documents/Claude AI/Brvndlab` (règle critique, voir CLAUDE.md)

## Note pour l'instance Claude qui installe

Lis `CLAUDE.md` et `memory/MEMORY.md` en premier : ils contiennent le mode
opératoire de Jonathan et l'index de toutes les connaissances. Les fichiers
`memory/feedback_*.md` sont des règles de travail validées — elles priment sur
tes défauts de comportement.
