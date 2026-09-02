---
name: project_brvndlab_youtube_oauth_google_validation
description: "YouTube = vrai OAuth Google (pas juste handle), bloqué par mur validation Google non passée"
metadata: 
  node_type: memory
  type: project
  originSessionId: 90c48264-84b2-43dd-becd-9dfd4eca82d4
---

La connexion YouTube dans Brvndlab utilise un VRAI OAuth Google (pas seulement la connexion par handle/URL). Flow : src/app/api/auth/youtube/start/route.ts → callback/route.ts. Le code est correct et fonctionnel.

**Scopes demandés** : youtube.readonly, yt-analytics.readonly, yt-analytics-monetary.readonly (+ openid/email/profile). Le scope monétaire déclenche la revue Google la plus stricte.

**Projet Google Cloud** : compte `hey@vividflow.co`, client_id `1066840706586-1le7aq56gm664aerejtd1irks3u67d2t.apps.googleusercontent.com`. Claude n'y a PAS accès.

**Blocage 2026-07-12** : écran "Google n'a pas validé cette application" pour les clients. Cause = OAuth consent screen en mode Testing / app non vérifiée par Google. Ce n'est PAS un bug de code.

**Débloquer un client tout de suite** : Google Cloud Console (hey@vividflow.co) → APIs & Services → OAuth consent screen → Test users → ajouter l'email Google du client. Max 100 testeurs.

**Solution définitive** : soumettre l'app à vérification Google (2-6 semaines ; page confidentialité + domaine vérifié + justification scopes). Décision en attente : retirer ou non le scope yt-analytics-monetary (Jonathan indécis 2026-07-12) — le retirer allègerait la validation.

**Env prod OK** : GOOGLE_OAUTH_CLIENT_ID + YOUTUBE_OAUTH_REDIRECT_URI présents en prod (sinon redirect vers ?oauth=unavailable). Cf. [[project_brvndlab_integrations_not_a_module]] pour l'accès à la page.
