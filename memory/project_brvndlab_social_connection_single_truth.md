---
name: brvndlab-social-connection-single-truth
description: "État de connexion réseaux unifié (17/08) — Home lit getMySocialConnections, déconnexion coupe TOUS les chemins, data et crons gatés sur l'état de connexion."
metadata: 
  node_type: memory
  type: project
  originSessionId: 100d0ff3-e583-486e-ade2-ef55a5f52457
  modified: 2026-08-17T07:13:20.189Z
---

Chantier du 2026-08-17 (commit 7b581a75), déployé Convex prod + Vercel prod.

**Cause racine du bug « Connecté fantôme »** : 6 sources concurrentes d'état de connexion (youtubeChannelLinks, youtubeTokens, instagramTokens, socialConnections Nango, users.zernioAccounts, + labels). En prod les 3 tables historiques (youtubeChannelLinks, youtubeTokens, instagramTokens) sont VIDES : toutes les connexions passent par Zernio (marque blanche) et Nango LinkedIn. La Home ne lisait que les tables vides.

**Règles posées (à ne pas casser)** :
- `analyticsSocial.readSocialConnections` = LA source de vérité de l'état de connexion (couvre les 3 chemins YouTube : lien de chaîne, OAuth Google natif via youtubeTokens, Zernio). Home, Analytics, getPlatformAnalytics la lisent. Tout nouvel écran doit la lire aussi, jamais une table en direct.
- Déconnexion dans Intégrations = TOUS les chemins d'un réseau, en best-effort (YouTube : channel + youtubeTokens + Nango + Zernio unlink ; LinkedIn : linkedin + linkedin-dma + linkedin-3p + Zernio ; Instagram : Meta + Zernio).
- Débranché = rien à l'écran : getPlatformAnalytics("youtube") renvoie videos vides si déconnecté ; getDashboardAnalytics gate la Vue Contenu par `connections[platform].connected` (les lignes business/attribution Smart Links restent, c'est notre tracking) ; getMyAudience/getMyTotalViews incluent youtubeTokens dans ytBranche.
- Cron nocturne `dailyRefreshAllYouTubeMetrics` filtre via `contentMetrics._youtubeConnectedUsers` : plus d'appels API pour des chaînes débranchées.
- `youtubeTokens.disconnect`/`getMyConnection` scopés au COMPTE (requireWriteAccess/resolveOwnerClerkUserId), plus identity.subject.

**Restes signalés, non corrigés (hors périmètre)** :
1. Home mobile n'affiche que YT+IG, pas LinkedIn (desktop affiche les 3).
2. `getMyTotalViews` : la part IG+LI du snapshot accountMetricsDaily est indivisible (une seule colonne views) — débrancher SEULEMENT Instagram en gardant LinkedIn laisse le bloc combiné. Fix propre = colonnes séparées dans accountMetricsDaily.
3. `social.syncConnections` au montage de la Home peut ressusciter une connexion si la suppression Nango distante a échoué (rare).

**Déconnexion durable (17/08, 2e vague)** : Nango ACCUMULE une connexion par reconnexion → la déconnexion supprime désormais TOUTES les connexions Nango du provider, et pose une PIERRE TOMBALE locale (`socialConnections.status="disconnected"`, `nangoConnectionId` vidé, `updatedAt` = date de déconnexion). `social._upsert` refuse de ranimer une connexion Nango née AVANT la tombale (seule une connexion plus récente = vraie reconnexion rouvre). `_allConnectedUsers` filtre `status==="connected"` (les tombales restent en base). Ne jamais revenir à la suppression de ligne : c'est elle qui permettait la résurrection par `syncConnections` au chargement de page.

**Garde-fou permanent** : `npx convex@1.42.1 run _diagSocial:auditAudience --prod` — invariants (photo quotidienne cohérente, pas de followersCount sur connexions LinkedIn, report d'abonnés jamais perdu). **À lancer au début de toute session Brvndlab touchant réseaux/audience, et après tout déploiement dans cette zone.** Vert le 17/08 après corrections.

**Incident évité** : deploy Convex parti avant rebase → a écrasé 2 fichiers convex de Thomas (0e3c91ca) ; détecté et redéployé depuis l'arbre rebasé dans la foulée. Rappel : toujours `git pull --rebase` AVANT `convex deploy`. Voir [[feedback-verify-deploy-lineage-before-prod]].
