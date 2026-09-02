---
name: OpenRouter = vraie source des coûts Hermes (confirmé 2026-05-27)
description: Hermes (VPS) consomme via OpenRouter sur tous les profils. Confirmé par un HTTP 402 "not enough credits" pendant un audit le 27/05. C'est la cible business à optimiser pour couper le budget IA mensuel.
type: project
originSessionId: 5f2c71e5-ba49-447e-b6aa-af7048d1c61a
---
Tous les profils Hermes sur vividflow-vps sont configurés avec `model: anthropic/claude-sonnet-4` et fallback OpenRouter. Logs de gateway montrent en boucle : `Fallback provider resolved: openrouter model=anthropic/claude-sonnet-4`.

Confirmé en live le 2026-05-27 lors d'un audit Hermes : HTTP 402 d'OpenRouter "you requested 64000 tokens but can only afford 35072". Le solde OpenRouter s'épuise en temps réel à chaque interaction Hermes.

**Why** : L'enquête initiale partait de l'hypothèse "Brvndlab coûte 300€/mois en Anthropic API". Audit complet a montré : Brvndlab = 0€ Anthropic (mocks partout). La vraie source des coûts IA récurrents = Hermes → OpenRouter → Claude Sonnet 4. Validé par le 402 reçu en live.

**How to apply** :
- Pour réduire le budget IA mensuel : **agir sur Hermes**, pas sur Brvndlab/VividFlow
- Leviers possibles : baisser max_tokens par défaut, forcer Codex en provider primaire sans fallback OpenRouter, cap quotidien par profil, désactiver les profils non-critiques (`chief_of_staff` + `vision_architekt` tournent en permanence)
- Quand Hermes lance un 402 pendant un audit/long message : top-up rapide OpenRouter OU baisser max_tokens du profil dans son `.env`
- Ne PLUS partir de l'hypothèse "Anthropic facture Brvndlab" — l'enquête a été faite, la facture est ailleurs
