---
name: Hermes agent runs on vividflow-vps (not local Mac)
description: L'agent Hermes Telegram tourne sur le VPS (systemd user services par profil), pas localement. Comment investiguer/réparer.
type: reference
originSessionId: ef6cb262-74bd-4558-9f77-067ec27f4ecd
---
L'agent Hermes qui répond sur Telegram à Jonathan tourne sur le VPS `vividflow-vps` (root@76.13.52.163), pas sur la machine locale. La config locale `~/.hermes/` est largement inactive.

**Profils actifs (systemd user services)** :
- `chief_of_staff` → bot Telegram principal (DM Jonathan + groupe `-1003845223802`)
- `vision_architekt` → second profil

**Localisations sur VPS** :
- HERMES_HOME par profil : `/home/hermes/.hermes/profiles/<profile>/`
- Logs : `/home/hermes/.hermes/profiles/<profile>/logs/{gateway,agent,errors}.log`
- Env du profil : `/home/hermes/.hermes/profiles/<profile>/.env`
- Service : `hermes-gateway-<profile>.service` (systemd --user, user `hermes`)

**Commandes utiles** :
```bash
# Logs récents
ssh vividflow-vps 'sudo -u hermes tail -100 /home/hermes/.hermes/profiles/chief_of_staff/logs/errors.log'

# Status / restart
ssh vividflow-vps 'sudo -u hermes -i bash -lc "HERMES_HOME=/home/hermes/.hermes/profiles/chief_of_staff hermes gateway status"'
ssh vividflow-vps 'sudo -u hermes -i bash -lc "HERMES_HOME=/home/hermes/.hermes/profiles/chief_of_staff hermes gateway stop && hermes gateway start"'
```

**Note** : `sudo -u hermes -i bash -lc ...` (login shell) requis pour charger systemd user manager (`XDG_RUNTIME_DIR`). Sinon `Failed to connect to bus`.
