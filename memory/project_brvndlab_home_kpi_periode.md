---
name: project_brvndlab_home_kpi_periode
description: "Home KPI vues/audience par période 7/30/90j + delta pastille, table accountMetricsDaily + cron"
metadata: 
  node_type: memory
  type: project
  originSessionId: 9f30526b-7410-4588-91e8-2a967de4205a
---

Home Brvndlab : les cartes « Mes vues » et « Mon audience » sont passées d'un total figé à une **performance sur période** (sélecteur 7/30/90j, défaut 30j), desktop + mobile. Delta en **pastille coin haut-droit, sans flèche** (juste « +18% »), sauge `--pos` / terracotta `--neg` (validé par Jonathan après 3 variantes : pastille de A + position de B + sans flèche).

**Backend (Convex prod accurate-cormorant-297)** : nouvelle table `accountMetricsDaily` (photo quotidienne du compteur GLOBAL de la chaîne : abonnés + vues cumulées, index `by_user [clerkUserId, createdAt]`) + cron `account metrics daily snapshot` (05:10 UTC, `contentMetrics.snapshotAllAccountsDaily`) + queries `getViewsForPeriod` / `getAudienceForPeriod`. **Repli honnête** : `mode:"alltime"` (total nu, aucun delta) tant que l'historique est trop court ; bascule auto en `mode:"period"` quand assez de snapshots. Jamais de faux %.

Pourquoi ce design : il n'y a **aucun contentItem publié en base** → les snapshots par vidéo (`contentMetrics`) somment à 0. La vraie donnée vient du compteur chaîne (`youtubeChannelLinks.subscriberCount/viewCount` + `instagramTokens.followersCount`). D'où le snapshot quotidien du compteur global pour construire l'historique daté. Livré 2026-07-12, commit de0641d.

Voir [[feedback_convex_cli_1341_lies_use_1421]] (le CLI 1.34.1 mentait au déploiement), [[project_brvndlab_vercel_no_autodeploy]] (Vercel Git auto-deploy), [[feedback_less_is_more_premium]] (dégraissage libellés).
