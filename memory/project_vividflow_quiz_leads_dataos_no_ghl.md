---
name: project-vividflow-quiz-leads-dataos-no-ghl
description: "Leads quiz VividFlow → DataOS Convex uniquement, AUCUN GHL ; pièges de naming (ghl-webhook.js) et de deployment Convex (standing-malamute-439 = dev:)"
metadata: 
  node_type: memory
  type: project
  originSessionId: 477f4f7f-45ad-48d4-b09f-775d5b1cdecf
  modified: 2026-08-11T09:31:39.371Z
---

Chaîne leads du quiz VividFlow (quiz.vividflow.co), vérifiée le 2026-08-10 :

- **AUCUN GoHighLevel.** Le fichier `api/ghl-webhook.js` du repo vividflow-quiz2 porte un nom hérité mais envoie vers le DataOS Convex (`/quiz/progress`). Ne plus jamais parler de GHL à Jonathan pour ce funnel.
- Chaîne réelle : page 1 du quiz → `api/quiz-lead.js` (Vercel) → Convex `standing-malamute-439.eu-west-1.convex.site` `/quiz/lead` → mutation `leadIngest.fromLeadForm` → tables `crm_contacts` + `crm_leads` (funnel "quiz") + `prospection_records` + `os_lead_journey`. Code DataOS : `/root/QOS` sur le VPS.
- **Piège Convex CLI** : `standing-malamute-439` est enregistré comme deployment **dev:** du projet vividflow-immo. `npx convex data --prod` depuis /root/QOS interroge un AUTRE deployment (vide) et répond « no documents ». Toujours utiliser `CONVEX_DEPLOYMENT=dev:standing-malamute-439 npx convex@1.42.1 data <table>` sans `--prod`.
- Vocabulaire pubs : « Quiz 1/2/3 » = les 3 PUBLICITÉS Meta (3 vidéos différentes), pas 3 quiz. Un seul quiz. Les pubs ont été recréées le 05/08 (v2, nouvel adset « VF · Quiz · Broad Romandie · Leads · 08-2026 » 120245793772060662, optimisation pixel LEAD offsite) ; l'ancien adset du 03/08 est ARCHIVÉ.
- Réconciliation 10/08 : 13 leads côté Meta (03→09/08, CPL 18,54 CHF) vs 10 leads funnel "quiz" dans crm_leads depuis le 04/08 — cohérent, pas de fuite webhook.

**Actions du 2026-08-10 (validées par Jonathan, déployées LIVE)** :
- Pub « Quiz 2 » (120245822252460662) mise en PAUSED par API ; Quiz 1 et Quiz 3 restent ACTIVE, budget 40 CHF/jour inchangé.
- Événement Meta « Lead » déplacé : il part maintenant à la validation de la **page identité** (submitLanding, même moment que la fiche DataOS), plus en fin de quiz. Garde `state.leadSent` contre le double comptage ; les deux anciens déclencheurs restent en filet pour les parcours sans page identité. Raison : l'adset (optimisation pixel LEAD) était affamé (13 conv/semaine, learning bloqué, CPM ×3). Commit cc8e8da, déployé et vérifié live sur quiz.vividflow.co.
- **RÈGLE Jonathan (10/08)** : le quiz, c'est **quiz.vividflow.co**, point. Ne JAMAIS citer quiz2.vividflow.co dans les comptes-rendus : ce domaine ne devrait même pas exister pour lui. Le repo git vividflow-quiz2 reste la source de vérité versionnée côté code, mais l'URL dont on parle et qu'on vérifie, c'est quiz.vividflow.co.
- Bilan prévu 3-4 jours après (vers le 13-14/08) : CPM attendu sous ~15 CHF, alerte CPL > 35 CHF.

**PAUSE GÉNÉRALE le 2026-08-11 (décision Jonathan, exécutée et vérifiée)** : campagne « Quiz - Dirigeants Suisse Romande » (120245754410250662) mise en PAUSED entière. Raisons : août mauvais en Suisse romande (0 lead les 10-11/08, dirigeants en vacances, CPM ×3), et surtout leads arrivant sur un écosystème sans contenu. Plan Jonathan : produire du contenu et nourrir l'audience jusqu'à septembre, puis relancer. À la relance : tout est intact (adset, 2 pubs actives Quiz 1+3, Quiz 2 en pause), le correctif Lead-en-page-1 est déjà live sur quiz.vividflow.co, un seul appel API (status=ACTIVE sur la campagne) suffit. Bilan du 13-14/08 annulé.

Voir [[project_meta_ads_quiz_campagne_etat]], [[project_vividflow_quiz_landing_v2_and_two_projects]], [[project_vividflow_dataos_meta_ads_integration]].
