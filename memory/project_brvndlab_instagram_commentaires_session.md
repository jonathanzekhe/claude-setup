---
name: brvndlab-instagram-commentaires-session
description: "Commentaires Instagram récoltés en session connectée via l'API web interne (18/08). Modèle LinkedIn, zéro mot de passe. Table instagramCommentaires."
metadata: 
  node_type: memory
  type: project
  originSessionId: 100d0ff3-e583-486e-ade2-ef55a5f52457
  modified: 2026-08-18T14:30:36.394Z
---

Résolu le 2026-08-18, boucle corrective (3 tours). Jonathan voulait les commentaires Instagram par publication comme pour LinkedIn, résultat immédiat, sans passer par le support du fournisseur.

**SOURCES ÉLIMINÉES (testées en réel, tour 1)** :
- API Graph Meta directe : table instagramTokens VIDE, aucun token en base.
- Fournisseur Zernio : `/accounts/{id}/posts` rend commentCount + likeCount + légende, JAMAIS le texte des commentaires. `/inbox/comments` = piège (rend les PUBLICATIONS, 62 items = 62 permaliens distincts). 25+ endpoints balayés. La permission `instagram_business_manage_comments` EST accordée côté fournisseur mais aucun endpoint ne l'expose (byokCredentials.isActive=false).

**LA SOLUTION QUI MARCHE (tour 2-3)** : session Instagram connectée dans le navigateur Playwright (le client se logue lui-même, comme LinkedIn — ZÉRO mot de passe stocké). Depuis la page, `fetch('/api/v1/media/{MEDIA_ID}/comments/?can_support_threading=true&permalink_enabled=false', {headers:{'x-ig-app-id':'936619743392459'}, credentials:'include'})` rend texte + user.username + user.full_name + user.profile_pic_url + comment_like_count + created_at, paginé par next_min_id. Le MEDIA_ID réel s'extrait du HTML de la page du permalien (`"media_id":"(\d+)"`), car nos externalId en base sont les IDs du FOURNISSEUR (6a82b8...), pas les media_id Instagram.

**BACKEND** : table `instagramCommentaires` (mediaExternalId, commentId, texte, auteur, nom, avatarStorageId, likes, at, deMoi). `instagramCapture.ingererCommentairesMedia` (rapatrie les avatars dans ctx.storage — les liens cdninstagram expirent), `commentairesDeMedia` (query publique, rend avec URLs stockées, cloisonnée par owner). Affichage : composant `CommentairesInsta` dans InstagramContent.tsx, greffé dans l'aperçu (Sheet), photo + @username + nom + badge « Toi ».

**PROUVÉ** : 19 commentaires de Raphaela (iam.rcf) sur 7 publications, avatars stockés. `convex data instagramCommentaires --prod | grep -c user_3GP7ib` = 19.

**RÉCOLTE AUTOMATISÉE PAR L'EXTENSION (18/08, v0.8.0)** : app.brvndlab.com ne peut PAS appeler l'API interne d'Instagram (CORS « Failed to fetch », prouvé). Solution : l'EXTENSION Brvndlab (tourne sur instagram.com, permission host déjà là) intercepte déjà JSON.parse — elle VOIT les réponses /media/{id}/comments/ que la page charge quand le client ouvre un post, SANS appel ni mot de passe. Ajouté à extract.js (estBlocCommentaires/litCommentaires + viewerDe), interceptor.js (relais), background.js (POST vers /extension/instagram-comments + ig:username en session pour le badge « Toi »). Serveur : route `/extension/instagram-comments` (http.ts, auth jeton extension, bornage) + `_mediaParPermalien` (rattache code court→externalId). Dès qu'un client ouvre sa section IG et regarde une publication → commentaires en temps réel. Endpoint prouvé 401 sans jeton. RESTE : Jonathan installe v0.8.0 et confirme le bout-à-bout ; pousser la maj aux clients déjà équipés (< 0.8.0).

**ANCIEN RESTE (résolu ci-dessus)** : le déclencheur manuel est remplacé par l'extension. Voir [[brvndlab-linkedin-abonnes-extension-source]] (même méthode, 222 commentaires LinkedIn) et [[brvndlab-instagram-ordre-lecture]].
