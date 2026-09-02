---
name: vercel-git-comments-api-off
description: "Les emails vercel[bot] se coupent via l'API projet gitComments, PAS via vercel.json github.silent"
metadata: 
  node_type: memory
  type: reference
  originSessionId: dcf13332-3e9f-4ac4-bea6-a094ec3c6432
  modified: 2026-08-02T07:21:10.543Z
---

`github.silent: true` dans vercel.json est ignoré par les projets Vercel de Jonathan : le réglage projet `gitComments.onCommit` prime. Coupé le 02/08/2026 sur les 3 projets liés à un repo (brvndlab-app, brvndlab, vividflow-service-execution-os) :

```
TOKEN=$(python3 -c "import json;print(json.load(open('$HOME/Library/Application Support/com.vercel.cli/auth.json'))['token'])")
curl -X PATCH "https://api.vercel.com/v9/projects/<name>?teamId=team_GTs1MknPmT57qmmhxdVCv0sl" \
  -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" \
  -d '{"gitComments":{"onCommit":false,"onPullRequest":false}}'
```

Les emails venaient de GitHub (notifications de commentaires de commit du bot), pas de Vercel directement. Si des emails reviennent, vérifier `gitComments` d'un éventuel nouveau projet lié à un repo. Voir [[brvndlab-vercel-no-autodeploy]].
