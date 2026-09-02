---
name: site-mockups-promote-required
description: "vividflow.co (projet Vercel site-mockups) ne bascule pas sur un nouveau deploy prod — il faut `vercel promote` après `vercel --prod`"
metadata: 
  node_type: memory
  type: reference
  originSessionId: 4888cc11-1712-4a5b-bd9d-c0edb118c0a2
  modified: 2026-08-03T09:06:19.250Z
---

Le projet Vercel `site-mockups` (qui sert vividflow.co + www, repo local `~/dev/site-mockups`, PAS de git) a son domaine épinglé sur un déploiement précis : `npx vercel --prod` crée bien un déploiement production Ready mais le domaine continue de servir l'ancien (x-vercel-cache HIT, vieux contenu).

**Procédure complète :** `cd ~/dev/site-mockups && npx vercel --prod` puis `npx vercel promote <url-du-nouveau-deploiement>`, et vérifier avec `curl -s https://vividflow.co | grep <texte modifié>`. Voir [[verify-until-live]].
