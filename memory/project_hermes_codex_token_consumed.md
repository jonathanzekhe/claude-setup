---
name: Hermes Codex OAuth — refresh token "consumed by another client"
description: Erreur récurrente sur Hermes VPS quand Codex CLI/extension VS Code partagent le compte ChatGPT. Fallback OpenRouter requis.
type: project
originSessionId: ef6cb262-74bd-4558-9f77-067ec27f4ecd
---
L'auth Codex/ChatGPT d'Hermes (provider `openai-codex`) utilise un refresh token à usage unique. Si Jonathan lance `codex` CLI ou l'extension VS Code Codex avec le même compte ChatGPT ailleurs, l'autre client consomme le refresh token et invalide celui qu'Hermes a en cache sur le VPS.

**Symptôme** : Hermes répond sur Telegram avec `Sorry, I encountered an error (RuntimeError). No LLM provider configured. Run hermes model to select a provider, or run hermes setup for first-time configuration.`

**Why:** Sans fallback configuré, l'auth Codex foirée bloque tout. Le fallback OpenRouter doit être armé (clé dans `.env` du profil) sinon `resolve_provider_client` log `openrouter requested but OPENROUTER_API_KEY not set`.

**How to apply:**
- Fix immédiat : ajouter `OPENROUTER_API_KEY=...` dans `/home/hermes/.hermes/profiles/<profile>/.env` (clé locale disponible dans `~/.hermes/auth.json` sous `credential_pool.openrouter`), puis restart `hermes-gateway-<profile>.service`. Hermes bascule alors auto vers OpenRouter quand Codex échoue.
- Fix racine : SSH VPS comme user `hermes`, lancer `codex` (re-auth interactif), puis `hermes auth` pour rafraîchir le token côté Hermes. Restaure le provider primaire (moins cher/plus rapide que OpenRouter pour les appels Codex/GPT).
- Prévention : si Jonathan veut utiliser Codex CLI/VS Code, créer un compte ChatGPT séparé pour Hermes VPS pour éviter la collision de refresh tokens.
