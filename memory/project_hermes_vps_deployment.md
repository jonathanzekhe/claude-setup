---
name: Hermes VPS Deployment
description: 3 agents Hermes deployes sur VPS Hostinger, config complete avec tunnel SSH Mac, WhatsApp, computer-use
type: project
originSessionId: b5594288-62a0-453d-82b9-e8b2c17aa9f9
---
## Serveur VPS
- **IP** : 76.13.52.163
- **Hostname** : srv1601285.hstgr.cloud
- **Specs** : KVM 2, 8GB RAM, 100GB storage, Ubuntu 24.04 LTS, datacenter France
- **SSH** : root, cle ed25519 configuree

## 3 agents Hermes (systemd, auto-start)
- **hermes-cockpit** : orchestrateur principal, token Telegram 8630045765
- **hermes-chief-of-staff** : vie perso, token Telegram 8791737335
- **hermes-coo-brvndlab** : business ops, token Telegram 8681683817

## Config
- Modele : Claude Sonnet 4 via OpenRouter
- WhatsApp Baileys : paire et connecte
- ElevenLabs TTS : configure
- SOUL.md : zero restriction, mode executant, pas de blabla

## Tunnel SSH (VPS → Mac)
- `hermes-tunnel start/stop/status` sur le Mac
- autossh, reverse tunnel port 2222
- Scripts mac-screenshot, mac-click, mac-type, mac-key en place

## Skills deployes
- computer-use : boucle screenshot-analyse-action-verification
- contacts : ton adapte par apprentissage, validation messages, homonymes

## Next steps (avec Erwan le CTO)
- Brancher emails (IMAP/SMTP ou Google Workspace)
- Brancher Google Calendar
- Optimiser les integrations WhatsApp et autres

**Why:** Jonathan veut ses agents dispo 24/7 sans dependre de son Mac
**How to apply:** Toute modification Hermes se fait sur le VPS via SSH root@76.13.52.163
