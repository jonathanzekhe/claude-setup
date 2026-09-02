---
name: Hermes cleanup massive du 2026-05-27 (zéro OpenRouter)
description: État Hermes VPS après nettoyage radical anti-OpenRouter le 27/05. Seul chief_of_staff actif, 8 crons Hermes nukés, toutes clés OpenRouter sanitizées. Avant de relancer un cron ou profil : lire ça d'abord.
type: project
originSessionId: 5f2c71e5-ba49-447e-b6aa-af7048d1c61a
---
Cleanup exécuté le 27/05/2026 ~15h CEST sur vividflow-vps après identification d'OpenRouter comme source réelle des coûts IA mensuels (~1000+€/mois, pas 300€).

**État final** :
- 1 seul profil Hermes actif : `chief_of_staff` (Telegram-facing, "Chief of Staff personnel de Jonathan")
- 11 profils archivés sous `/home/hermes/.hermes/archived-profiles-20260527/` (atlas_dev, buyer_radar, cash_potential, chief-of-staff [tiret], coo-brvndlab, coordinateur, estimation_mandat, kb_ops, receptionniste, vision_architekt, vividflow_rd) — récupérables si nécessaire
- Note : `vision_architekt/` peut réapparaître vide dans `profiles/` parce que Hermes le recrée auto quand quelque chose le référence ; tant qu'il n'a pas de process ni de cron, c'est inoffensif

**8 crons Hermes supprimés** (storage : `~/.hermes/cron/jobs.json` global + `~/.hermes/profiles/chief_of_staff/cron/jobs.json`) :
1. `brvndlab-hermes-task-runner` (every 1m, 4056 runs depuis 21/05) — polling Convex Brvndlab pour tâches AI désormais inexistantes
2. `vividflow-tracker-watchdog` (every 2m)
3. `Rappels appels calendrier 30 min` (every 5m)
4. `Rappel Rafaela Mastermind` (every 10m)
5. `Brvndlab Radar Instagram pilote` (every 120m)
6. `VividFlow IA veille` (daily 9h UTC)
7. `VividFlow Immo veille` (daily 18h)
8. `Veille X quotidienne IA agents` (daily 21h)

Backups dans `/tmp/jobs-backup-20260527-*.json` et `/tmp/jobs-global-backup-20260527-*.json`.

**Toutes les clés OpenRouter sanitizées** dans 24 fichiers (.env actifs + .env.backup + .env.bak.*). Seules occurrences restantes = fakes dans `hermes-agent/tests/agent/test_redact.py` et `website/docs/user-guide/windows-native.md` (templates de doc, pas de vraies clés).

**Why** : Jonathan a découvert que ses coûts IA mensuels ne venaient pas d'Anthropic (Brvndlab = mocks, 0€) mais d'OpenRouter via Hermes (~1000+€/mois). Directive : "fini, fini, terminé" pour OpenRouter. Audit a révélé 8 crons en boucle qui brûlaient des milliers d'appels claude-sonnet-4 + gpt-5.5 via OpenRouter.

**How to apply** :
- Avant de proposer de réactiver un cron Hermes : vérifier que ce cron passera par Codex direct (pas OpenRouter), et qu'il a un budget mensuel cappé
- Si Jonathan demande pourquoi Hermes ne répond pas : c'est probablement le Codex auth bug ("refresh token consumed by another client") → solution : `codex` + `hermes auth` sur le VPS (à faire par Jonathan ou Thomas)
- Si Hermes a besoin de récupérer un ancien profil : `mv ~/.hermes/archived-profiles-20260527/<nom> ~/.hermes/profiles/`
- Ne JAMAIS rétablir une clé `OPENROUTER_API_KEY` dans un `.env` Hermes — c'est la racine de l'hémorragie
- VividFlow features dépendantes des 7 crons (veille IA/immo, tracker-watchdog, rappels) sont arrêtées — à réactiver consciemment si business en a besoin
