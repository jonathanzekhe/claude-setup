---
name: project-brvndlab-inspiration-carte-vide-2026-08-20
description: "Panne carte vide Inspiration 20/08 : sessionid falsego RE-mort (403 logout_reason 8, à re-fournir par Jonathan) + post DN8VXEzjbm_ refusé par la page embed IG ; fix UI livré c0ef74aa (carte sans miniature résout ig-media au montage)"
metadata: 
  node_type: memory
  type: project
  originSessionId: c283bd88-a376-4a48-943e-ca359bbe6a56
  modified: 2026-08-20T18:05:24.482Z
---

Incident du 2026-08-20 (19:46) : Jonathan ajoute https://www.instagram.com/p/DN8VXEzjbm_/ (kind court) dans Inspiration, la carte reste entièrement vide (placeholder « I » seul).

**Trois causes empilées :**
1. `INSTAGRAM_SESSIONID` prod (compte falsego) MORT à nouveau : 403 login_required logout_reason 8, comme le 19/07 ([[brvndlab-ig-relay-stable]]). Procédure de rafraîchissement inchangée : se reconnecter à falsego sur instagram.com, DevTools > cookie sessionid, `printf '<valeur>' | npx vercel env add INSTAGRAM_SESSIONID production`, puis redeploy. Au 20/08 soir Jonathan ne l'a PAS encore refait.
2. Le relais VPS (http://76.13.52.163/ig-relay, en vie et OK pour 10/13 posts) ne peut rien pour CE post : la page embed d'Instagram répond « The link to this photo or video may be broken, or the post may have been removed » (utm_campaign=invalid). Post existant mais non embeddable (compte privé suivi par Jonathan, embed désactivé par l'auteur, ou contenu restreint). Même verdict pour deux items plus anciens : DcCDK1SvFdT et DZiv125Df9a. Le relais classe ça « page vide » et la route ig-media renvoie unavailable:true : c'est le comportement voulu.
3. BUG UI (corrigé) : une carte ajoutée pendant la panne n'a NI miniature NI poster en base ; `onThumbFail` (CardMedia, InspirationFeed.tsx) ne se déclenche que sur une `<img>` en échec, donc jamais sans image. Résultat : ni poster frais ni état « Post indisponible », carte muette. Fix : même résolution `fetchIgMedia` déclenchée au montage quand `thumbs.length === 0` (IG/LinkedIn). Commit `c0ef74aa` sur main, déployé Vercel 19:56 (dpl_E7hpk1uzUxezAXyLxae9U3GLrF6y, app.brvndlab.com).

**Effet attendu** : la carte DN8VXEzjbm_ affiche « Post indisponible » (honnête tant que la session est morte). Si le sessionid est rafraîchi, l'API privée re-résout ce post (poster + MP4) sans re-déploiement, la carte revit seule.

**Vérification live** : impossible via le compte robot ([[reference-e2e-robot-brvndlab]]) : /inspiration REDIRIGE le robot viewer vers /home (module non accessible à ce rôle). Vérifié à la place : build Vercel cloné sur c0ef74a, tsc + eslint OK, chaîne relais/API privée testée en direct.
