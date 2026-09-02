---
name: project_brvndlab_ai_daily_limit_admin_bypass
description: Plafond quotidien IA Brvndlab (DAILY_USER_LIMIT) + exemption admin/founder. Clerk ID de Jonathan.
metadata: 
  node_type: memory
  type: project
  originSessionId: 26a6f39e-8a8d-4598-9f9f-c40e275656ec
---

Le gateway IA Brvndlab (`src/lib/ai/aiGateway.ts`) impose un `DAILY_USER_LIMIT = 100` appels callAi/jour/user (vérifié AVANT chaque appel ; dépassé → `AiBudgetExceededError` → route renvoie 429 → écran rouge « Limite quotidienne d'usage IA atteinte »). Une génération de script long brûle jusqu'à ~4 appels (génération + éditeur + 2 tours de juge), donc en test intensif on tape vite le plafond.

**Exemption admin (2026-06-19) — DEUX couches indépendantes** : le plafond ne doit JAMAIS s'appliquer au founder/admin (Jonathan), mais RESTE pour les clients — future option produit « payer plus ». (1) **Convex** `getDailyCountForUser` (convex/aiUsage.ts) : lookup `users` by_clerk_id → si `email ∈ FOUNDER_EMAILS` (["jonathanzekhe@gmail.com"]) retourne **-1** (jamais ≥ DAILY_USER_LIMIT), donc jamais bloqué. Ancré EMAIL = robuste même si l'ID runtime diffère. Lookup en try/catch (best-effort, ne casse jamais la gateway). (2) **Gateway** (aiGateway.ts) `ADMIN_USER_IDS` (Set) : Clerk ID `user_3C7wHYLGxmyVLXo3GTei6cTwPZS` en dur + env `AI_UNLIMITED_USER_IDS` (CSV), vérif sautée si match. Deux chemins (email + id) → ceinture+bretelles. NOTE debug : `convex run` part en vrille (liste toutes les fonctions / Server Error) à cause des modules radar cassés qui bloquent son push implicite — pas fiable pour tester une query ; utiliser `convex data <table>` ou se fier au `convex deploy`. aiUsage apparaissait « vide » en CLI mais le plafond se déclenchait quand même = lecture CLI peu fiable, ne pas s'y fier.

**Repères Convex** : déploiement prod = `accurate-cormorant-297`. Table `users` (index by_email, by_clerk_id) mappe email↔clerkUserId. Autre compte vu : hey@brvndlab.com = `user_3C9bGQLS7dQ8yuu4CjlZqrgIMum`. Pour lire la prod en CLI : `env -u VERCEL -u VERCEL_ENV -u CI CONVEX_DEPLOYMENT="prod:accurate-cormorant-297" npx convex data <table>` (sans ça, le CLI croit être en build Vercel ou tape la dev vide).

Voir [[project_brvndlab_script_video_flow]] (les retouches IA chat/affinage consomment aussi le quota). Changement structurel → penser à [[feedback_sync_stack_doc_on_every_change]] (entrée Changelog brvndlab-stack).
