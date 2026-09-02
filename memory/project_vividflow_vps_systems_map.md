---
name: project_vividflow_vps_systems_map
description: "Tout VividFlow tourne sur le VPS — carte des apps, du DataOS, et du second brain (gbrain) + comment s'y brancher"
metadata: 
  node_type: memory
  type: project
  originSessionId: a792b0b1-cf0c-415c-99ee-7e8138933841
---

Tout l'écosystème VividFlow vit sur le VPS `vividflow-vps` (SSH alias dans ~/.ssh/config → 76.13.52.163, host `srv1601285`). J'ai accès SSH root.

**Services live (systemd):** `hermes-chief-of-staff.service` (gateway Hermes), `vividflow-wrapper.service` (FastAPI Hermes). n8n tourne aussi (`/root/.n8n-data`).

**DataOS** = `/root/QOS` (canonique, git, pkg "qos") — Next.js + Convex + Clerk, lié au projet Vercel `vividflow-service-execution-os` (prj_XWdQ2klmIteISmbBvWFT4EB32G3j) → https://data-os.vividflow.co. `/opt/vividflow` est une COPIE (autre projet Vercel "vividflow"). Voir [[project_vividflow_dataos_meta_ads_integration]].

**Le « second brain » = gbrain** (outil OSS de Garry Tan, github.com/garrytan/gbrain, v0.33), user `hermes`. CLI: `/home/hermes/.bun/bin/gbrain`. Contenu markdown = `/home/hermes/brain/` (people/ companies/ deals/ projects/ decisions/ meetings/ concepts/ reports/ sources/). DB = PGlite `/home/hermes/.gbrain/brain.pglite` + embeddings OpenAI. ~110 pages, ~2895 chunks embeddées. Curator + heartbeat (`/home/hermes/.hermes/vividflow-brain-curator.lock`, `…-heartbeat.lock`) ingèrent X/articles/transcripts en continu.

**Se brancher au brain (recherche sémantique live):**
`ssh vividflow-vps 'sudo -u hermes bash -lc "export PATH=\$HOME/.bun/bin:\$PATH; cd ~/brain; gbrain query \"...\""'`
Commandes utiles: `gbrain query`, `gbrain stats`, `gbrain timeline`, `gbrain graph-query <slug>`.

Autres apps VPS: vividflow-onboarding, tracker, blowup-landing, vividflow-go, vividflow-loops, kalvi-*. Aussi: `hermes-agent-control-room-upstream` (control room), `hermes-webui`.

**Why:** Jonathan veut que je voie tous les fichiers du VPS et que je sois « constamment mis au courant en me branchant au second brain ».
**How to apply:** Au début d'une tâche VividFlow, query le brain via SSH pour charger le contexte. Option discutée: hook SessionStart qui auto-injecte un digest gbrain à chaque session. Voir [[reference_hermes_vps_setup]].
