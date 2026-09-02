---
name: project-brvndlab-ig-oauth-contamination-fix
description: "Contamination IG 25/08 (compte Rafaela sur compte Jonathan) — cause racine, purge, et garde-fous posés"
metadata: 
  node_type: memory
  type: project
  originSessionId: 8920d117-50c9-4a0a-9933-7fd064b1749f
  modified: 2026-08-25T17:25:11.189Z
---

Incident du 24-25/08/2026 : le compte Jonathan (user_3CaB4NBRnQBy0vDGkydiSNzWdP3) affichait l'Instagram de Rafaela `iam.rcf` (3 756 abonnés, vues, stories) dans Performances.

**Cause racine** : le callback OAuth Meta (`src/app/api/auth/instagram/callback/route.ts`) prenait la PREMIÈRE Page Facebook liée à un Instagram dans `/me/accounts`. Jonathan administre la Page Bold Shift de Rafaela (associés) → son IG a été sauvé dans `instagramTokens` sous le clerkUserId de Jonathan. La connexion Meta a préséance sur Zernio dans `readSocialConnections` → tout Performances contaminé, photos quotidiennes des 24-25/08 figées avec les faux chiffres.

**Réglé le 25/08** :
- Purge ciblée : `_diagSocial:_purgeIgContamination` (connexion + photos, double verrou clerkUserId+instagramUserId).
- Callback : collecte TOUS les candidats puis exige la correspondance avec le compte IG déclaré (`instagramTokens.expectedIgHandle` = label Zernio, résolution owner identique à `saveFromServer`). Mismatch → refus avec message nommant les deux comptes. Sans label déclaré : un seul candidat passe, plusieurs = refus.
- Audit du matin (`_diagSocial:auditAudience`, invariant 6) : username du token Meta ≠ compte IG déclaré → alerte.

**Restes connus (préexistants, hors incident)** : photos quotidiennes « incohérentes » (subscribers=IG+YT sans LinkedIn) signalées par l'audit sur 2 comptes ; la valeur `vues` 15 968 vient des sources propres de Jonathan via Zernio (vérifié post-purge), pas de la contamination.

Voir [[feedback-brvndlab-chaine-affichage-unique-reseaux]] et [[project-brvndlab-social-connection-single-truth]].
