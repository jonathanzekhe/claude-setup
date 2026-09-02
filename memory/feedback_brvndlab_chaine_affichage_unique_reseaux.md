---
name: brvndlab-chaine-affichage-unique-reseaux
description: "Règle scellée 17/08 — une seule chaîne serveur alimente l'affichage réseaux ; tout champ ajouté en base doit traverser TOUTE la chaîne jusqu'à l'écran ; l'audit auditAudience (5 invariants) verrouille."
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 100d0ff3-e583-486e-ade2-ef55a5f52457
  modified: 2026-08-17T09:46:49.724Z
---

Demande explicite Jonathan (17/08) : « fais en sorte que pour moi et tout utilisateur ça passe au bon endroit, ça ne doit pas se reproduire ».

**Why** : la journée du 17/08 a montré le même schéma trois fois — une donnée existe en base mais un maillon intermédiaire de la chaîne d'affichage la perd (fusion `historyLive` qui hardcodait likes:null, cron pipeline qui archivait les social_post, préséance qui laissait un compteur contaminé gagner). L'utilisateur voit alors des tirets/du vide alors que la donnée est là.

**How to apply** :
1. L'affichage réseaux passe par UNE chaîne serveur : `zernioPublish.historyLive` (tableau des posts, fusion live+importés, likes/coms inclus), `analyticsSocial.readSocialConnections` (état de connexion), `accountMetricsDaily` (compteurs). Ne jamais créer un deuxième calcul parallèle sans dédup ET sans raison ; la fusion client de Metrics.tsx n'est qu'un filet de secours si historyLive échoue.
2. Quand on AJOUTE un champ en base (ex : likes écrits par l'enrichissement), vérifier qu'il traverse chaque maillon jusqu'à l'écran — le maillon qui mappe à la main (map avec liste de champs) est l'endroit où ça se perd.
3. Après tout chantier réseaux/audience : `npx convex@1.42.1 run _diagSocial:auditAudience --prod` — 5 invariants : photo cohérente, pas de followersCount sur connexions LinkedIn, report abonnés jamais perdu, AUCUN social_post archivé, imports lisibles (JSON valide avec body). Tous comptes confondus, pas seulement Jonathan.
4. Vérifier le rendu final dans le navigateur (session Playwright authentifiée), jamais seulement la base.

Voir [[brvndlab-linkedin-abonnes-extension-source]] et [[brvndlab-social-connection-single-truth]].
