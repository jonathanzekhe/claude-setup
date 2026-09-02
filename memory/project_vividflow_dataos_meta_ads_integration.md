---
name: project_vividflow_dataos_meta_ads_integration
description: "DataOS VividFlow — intégration Meta/Facebook Ads déjà construite et fonctionnelle (Convex), il manque juste le token côté Meta"
metadata: 
  node_type: memory
  type: project
  originSessionId: a792b0b1-cf0c-415c-99ee-7e8138933841
---

La page Meta Ads du DataOS (`/root/QOS` sur le VPS, voir [[project_vividflow_vps_systems_map]]) est **entièrement câblée** — rien à coder.

Code: `src/components/media-buyer/MetaConnectModal.tsx` (modale → appelle `connect`), `MediaBuyerView.tsx` (bouton « Sync Meta » → `syncInsights`), `MetaGuide.tsx` (onglet guide). Backend `convex/mediaBuyer.ts`: `connect`/`disconnect` (gardés `requireAdmin`), `connectionStatus`, `dashboard`/`summary` (KPIs), et surtout **`syncInsights`** (action) qui appelle la **Meta Marketing API** (graph.facebook.com v21.0) aux niveaux account/campaign/adset/ad, extrait les leads depuis `actions[]`, remplit `meta_daily`/`meta_object_daily`. **Cron horaire** « meta insights sync » (`convex/crons.ts`). Webhook lead gen: `src/app/api/webhooks/meta/route.ts`. Table `meta_connection` (1 ligne/workspace).

**ÉTAT 2026-06-21: CONNECTÉ ✅.** Compte VividFlow Agency `act_2107713119537689` (CHF, app Meta "Vividflow Gestion" ID 1980809492649371, system user "Conversions API System User"), token System User (scopes ads_read+read_insights, jamais expiré) inséré dans Convex `meta_connection` via `convex import` (connect CLI impossible car requireAdmin/Clerk). Déploiement Convex prod = `standing-malamute-439`. Lancer fonctions: `cd /root/QOS && CONVEX_DEPLOYMENT=prod:standing-malamute-439 npx convex run mediaBuyer:<fn>`. Sync 365j OK: 3311 CHF / 678 leads / CPL 4.88 (3 campagnes PAUSED). Meta bloque time_range >37 mois ET le sync journalier 1100j (#unknown error, trop lourd) → rester ≤365j. Dans l'UI, choisir une plage large (12 mois) sinon 7/30j affiche 0 (campagnes en pause).

**(Historique) Pourquoi les KPIs étaient à 0:** aucun vrai compte connecté. Il faut un **System User Access Token** longue durée (Meta Business Settings → Utilisateurs système → générer, scopes `ads_read` + `read_insights`; system user attribué au compte pub) + l'**Ad Account ID** (`act_XXXX`). Coller dans la modale → Connecter → Sync.

**Caveat honnête:** la modale dit « jeton chiffré côté serveur » mais le schéma stocke `token` en CLAIR dans Convex (lisible seulement server-side via internalQuery, jamais exposé client). « Côté serveur » oui, « chiffré » non — à corriger (wording ou vrai chiffrement at-rest) si demandé.

**How to apply:** Une fois le token collé, je peux lancer `npx convex run mediaBuyer:syncInsights` depuis /root/QOS sur le VPS pour confirmer le pull. Convex prod, `--prod`. Voir [[feedback_convex_deploy_pitfalls]].
