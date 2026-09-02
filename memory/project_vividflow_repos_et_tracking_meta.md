---
name: project_vividflow_repos_et_tracking_meta
description: "Où vivent vividflow.co et le quiz, quel projet Vercel sert quel domaine, et l'état du tracking Meta (pixel + Conversions API)"
metadata: 
  node_type: memory
  type: project
  originSessionId: ff36ec5d-c9e2-45e1-9e94-834c89331eb1
  modified: 2026-08-04T07:54:08.392Z
---

Cartographie établie le 04/08/2026, vérifiée par hash MD5 contre la prod.

**Repos (versionnés le 04/08/2026, aucun n'avait de git avant)**
- `vividflow.co` → `~/dev/site-mockups` → GitHub `jonathanzekhe/vividflow-site` (privé), projet Vercel `site-mockups`. Le nom trompe : c'est la PROD, pas des maquettes. Le repo contient aussi 400+ mockups et des projections client (schmid, bienici, novastratex, paris-autrement, residences-immobilier) — pas de pixel dessus, volontairement.
- `quiz.vividflow.co` → `~/dev/vividflow-quiz2` → GitHub `jonathanzekhe/vividflow-quiz2` (privé), projet Vercel `vividflow-quiz2`.
- Le projet Vercel `vividflow-quiz` est l'ANCIEN. Il gardait l'alias `quiz.vividflow.co` jusqu'au 04/08 ; l'alias a été rebasculé sur `vividflow-quiz2`. Ne pas y déployer.

**Architecture du quiz**
quiz → Vercel functions → Convex `standing-malamute-439` (eu-west-1), protégé par `INTERNAL_API_SECRET`.
4 endpoints : `diagnostic` (Anthropic), `ghl-webhook` (soumission finale → Convex), `lead-progress` (capture progressive → Convex), `meta-lead` (Conversions API).

**Piège rencontré** : `ghl-webhook.js` et `lead-progress.js` tournaient en prod sans code source nulle part. Un déploiement depuis le local les aurait supprimées. Récupérées via l'API Vercel `/v6/deployments/{id}/files` puis `/v7/.../files/{uid}` (réponse en base64 imbriqué). Voir [[feedback_verify_deploy_lineage_before_prod]].

**Tracking Meta** — pixel `27202280722743456` sur le quiz + les 20 pages publiques de vividflow.co.
`Lead` et `CompleteRegistration` sont gatés sur `qualified === true` : les leads affichés dans Ads Manager sont les leads QUALIFIÉS, pas le nombre de formulaires soumis.

**Bloqué** : la Conversions API est déployée mais inactive. Le token System User (`/root/.hermes/secrets/meta-systok.txt` sur le VPS, nommé "Conversions API System User", permanent, scope `ads_management`) n'a PAS le pixel assigné comme asset. Symptôme : `error_subcode 33` sur `POST /{pixel}/events`. Le seul pixel visible par ce token est "Sevenland Led Mirror" (`760381557750699`), sans rapport. À corriger dans Business Manager → Paramètres → Sources de données → assigner le pixel au System User, puis `vercel env add META_CAPI_TOKEN production`.

Compte pub : `act_2107713119537689` "VividFlow Agency", Business `509019513257444` "VividFlow".
