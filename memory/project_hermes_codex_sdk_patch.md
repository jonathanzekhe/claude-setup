---
name: Hermes — patch SDK OpenAI pour Codex Pro (chatgpt.com backend)
description: Patch 1-ligne appliqué le 27/05 dans /home/hermes/.hermes/hermes-agent/venv/.../openai/lib/_parsing/_responses.py pour tolérer `response.output=None` retourné par chatgpt.com/backend-api/codex. Fragile si pip réinstalle le SDK.
type: project
originSessionId: 5f2c71e5-ba49-447e-b6aa-af7048d1c61a
---
Hermes tourne maintenant sur l'abonnement Codex Pro de Jonathan (gpt-5.5 via `chatgpt.com/backend-api/codex`).

**Le SDK OpenAI public a un bug** quand utilisé contre ce backend : à la réception de `response.completed`, le SDK fait `for output in response.output:` mais `response.output` est `None` (au lieu de `[]`). TypeError "NoneType object is not iterable".

**Patch appliqué le 27/05/2026 ~17h** sur le VPS `vividflow-vps` :
- Fichier : `/home/hermes/.hermes/hermes-agent/venv/lib/python3.11/site-packages/openai/lib/_parsing/_responses.py`
- Ligne 61 : `for output in response.output:` → `for output in (response.output or []):`
- Backup : `/tmp/_responses.py.bak-1700` sur le VPS

**Why** : sans ce patch, Hermes crash systématiquement avant de pouvoir délivrer la réponse de Codex. Le model répond pourtant correctement (events `output_text.done` arrivent avec le bon texte), mais le SDK plante au moment d'agréger le `response.completed` final.

**How to apply** : si le SDK OpenAI est réinstallé (`pip install --upgrade openai`, mise à jour Hermes, etc.), **le patch est perdu**. Faut le ré-appliquer avec :
```bash
sed -i "s|for output in response.output:|for output in (response.output or []):|g" \
  /home/hermes/.hermes/hermes-agent/venv/lib/python3.11/site-packages/openai/lib/_parsing/_responses.py
```
Puis restart service : `systemctl --user restart hermes-gateway-chief_of_staff.service` (sous user `hermes`).

**Vraie solution long-terme** : soit le SDK OpenAI public absorbe ce edge case (chatgpt.com backend), soit Hermes implémente son propre stream parser pour le Codex backend. Pour l'instant le patch tient.

**Auth Codex storage gotcha** : `hermes auth add openai-codex --type oauth` lance le device flow et écrit le token dans `$HERMES_HOME/auth.json` (= dépend de l'env var HERMES_HOME). Si lancé sans HERMES_HOME, écrit dans `~/.hermes/auth.json` du user qui lance. Le credential_pool sous `credential_pool.openai-codex[0]` est ce que Hermes utilise réellement à runtime — pas `providers.openai-codex.tokens.*`. Si les deux divergent, Hermes utilise l'ancien.
