---
name: Supermemory, mémoire cross-session de Jonathan
description: Supermemory.ai est branché. API key dans ~/.claude/channels/supermemory/.env. Container tag = jonathan_brvndlab. Utiliser pour sauvegarder et retrouver le contexte long terme.
type: reference
---

**Supermemory est le vault de mémoire cross-session de Jonathan**, branché depuis le 2026-04-09. Toutes les sessions Claude Code (y compris Bruce Lee sur Telegram) doivent l'utiliser pour capturer et retrouver le contexte long terme.

## Configuration

- **API key** : `~/.claude/channels/supermemory/.env` (variable `SUPERMEMORY_API_KEY`)
- **Base URL** : `https://api.supermemory.ai`
- **Container tag de Jonathan** : `jonathan_brvndlab` (toujours utiliser celui-ci pour scoper)

## Ajouter une mémoire (POST /v3/documents)

```bash
API_KEY=$(grep SUPERMEMORY_API_KEY ~/.claude/channels/supermemory/.env | cut -d= -f2)
curl -sS -X POST https://api.supermemory.ai/v3/documents \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "content": "Le contenu de la mémoire, en texte libre",
    "customId": "identifiant_unique_descriptif",
    "containerTag": "jonathan_brvndlab",
    "metadata": {
      "category": "client|content|decision|idea|meeting|other",
      "date": "2026-04-09",
      "source": "telegram|claude_code|gmail|calendar"
    }
  }'
```

## Rechercher dans la mémoire (POST /v4/search)

```bash
curl -sS -X POST https://api.supermemory.ai/v4/search \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "q": "query en langage naturel",
    "containerTag": "jonathan_brvndlab",
    "limit": 5
  }'
```

Retourne une liste de `results` avec `memory` (fait extrait), `similarity` (score), et `metadata`.

## Lister les documents (POST /v3/documents/list)

```bash
curl -sS -X POST https://api.supermemory.ai/v3/documents/list \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"containerTags":["jonathan_brvndlab"],"limit":20}'
```

## Règles d'utilisation

1. **Toujours utiliser `containerTag: "jonathan_brvndlab"`** pour scoper aux données de Jonathan.
2. **Avant de répondre à une question qui demande du contexte historique** (client mentionné, décision passée, idée évoquée précédemment), faire une recherche supermemory en silence.
3. **Après une conversation importante**, sauvegarder les faits saillants (nouvelles décisions, updates client, idées lâchées) dans supermemory automatiquement, sans le demander à Jonathan.
4. **Ne jamais polluer le channel Telegram** avec des traces d'API calls supermemory. La règle "conversation stricte message à message" s'applique : les recherches et sauvegardes se font en backend silencieux.
5. **Métadonnées à toujours renseigner** : `category`, `date` (YYYY-MM-DD), `source`. Facilite le filtrage ultérieur.

## Starter dump déjà fait

Le 2026-04-09, 40 fichiers de mémoire existants ont été ingérés dans le container `jonathan_brvndlab` :
- 1 profil user (user_jonathan)
- 18 feedbacks (règles de collaboration)
- 20 projets Brvndlab (décisions, architecture, features)
- 1 référence (inspirations)
- VALIDATED.md

Donc supermemory contient déjà tout le contexte de travail passé entre Jonathan et Claude Code.
