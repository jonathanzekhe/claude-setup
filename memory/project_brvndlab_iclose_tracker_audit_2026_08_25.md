---
name: project_brvndlab_iclose_tracker_audit_2026_08_25
description: Audit Smart Link/Leads + iClose + tracker brvnd.js du 25/08/2026 — verdicts prod et concurrents
metadata: 
  node_type: memory
  type: project
  originSessionId: 15ba0568-c44a-4f97-93c7-971cd7ed41fd
  modified: 2026-08-25T23:34:13.937Z
---

Audit du 25/08/2026 des modules Smart Link & Leads (prod accurate-cormorant-297).

**iClose N'EST PAS cassé.** Sync réel: 9 RDV lus → 6 rattachés PAR JETON (pas par proximité), 2 orphelins, 1 annulé. Le visiteur ressort avec nom+email+téléphone, visitorId `v_xxx` du redirect. Le rattachement dépend d'un jeton porté par le lien iClosed réécrit OU une question de formulaire iClosed (config client, PAS automatique). L'automate `iclosedSync.repriseAutomatique` tourne toutes les **15 min** (cron), pas 2. iClosed ne renvoie jamais `contact.createdAt` → pas d'ancre temps → proximité jamais tentée sur l'historique → orphelins définitifs. Le compteur `attribues` de sync.ts compte "jeton trouvé", pas "rattaché DB" (trompeur).

**Le tracker `brvnd.js` (src/app/brvnd.js/route.ts) existe et est LIVE** (app.brvndlab.com/brvnd.js). Une ligne à coller. Réécrit liens Calendly/iClosed(utm_content)/Stripe(client_reference_id), remplit champs cachés, capte email au submit. FAIBLESSE n°1: cookie posé en JS (document.cookie) → Safari ITP plafonne à 7j malgré le "90 jours". Fix = cookie côté serveur via sous-domaine first-party client (mais custom domain actuel CNAME→Vercel = re-plafonné aussi par CNAME-cloaking mitigation Apple).

**Concurrents: Mochi = Trakyo.** themochi.app (use.themochi.app → app.trakyo.io). Mochi = CRM Instagram-DM, Trakyo = moteur attribution YouTube dessous. Même groupe. Techno ~= brvnd.js. Leurs atouts: ThumbmarkJS Pro (fingerprint), in-app browser/deep link géré, dashboard install. Trakyo mono-canal YouTube (content_item_id obligatoire) → Brvndlab gagne en multi-réseau. Mochi tourne sur Dub (dub.co open-source) pour les liens.

**Corrections livrées (local main, NON déployé, compile OK):**
- convex/leadActions.ts: getLeadStats + getActionLeadIds filtrent !mergedInto (KPI ≠ table réparé)
- convex/tracking.ts: listVisitors lit large avant filtre mergedInto ; + recordTrackerPing/trackerStatus
- src/lib/tracking/redirect.ts: pas d'identityHash si IP vide
- src/app/brvnd.js/route.ts: iClosed → [utm_content,utm_term] + iclosed.(io|com) ; ping hello() au boot
- convex/schema.ts: table trackerInstalls
- src/app/api/track/hello/route.ts: endpoint signal de vie
- src/app/(app)/settings/suivi/page.tsx: voyant install par domaine

**DÉPLOYÉ ET PROUVÉ EN PROD (26/08/2026, via VPS externe):**
- Git b6c80215→6b650c5b (rebasé 2x sur commits parallèles d'autres instances), Convex accurate-cormorant-297, Vercel Ready.
- Test E2E VPS (google-chrome/Playwright, UA iPhone SANS Headless): 2 Smart Links (YT 91d294ca + LinkedIn) → MÊME visiteur v_mt96xgse. Booking iClose réel → opt-in "TESTDEUX Verif"/test.audit.brvndlab.v2+...@gmail.com RATTACHÉ au bon v_mt97syag_it2240i4 (pas orphelin). AVANT le fix (booking#1, clic filtré HeadlessChrome): orphelin iclosed_email_ts. Contraste = preuve du fix.
- Dashboard install prouvé: ping /api/track/hello depuis VPS → ligne trackerInstalls créée (host déduit de Origin).
- Snippet brvnd.js prod contient utm_term + hello(). Endpoint hello HTTP 204.

**PIÈGE iClose booking (pour tests futurs):** react-tel-input défaut SUISSE +41 → fill('') puis type('+33...'). Calendrier verrouillé tant que formulaire pas validé. Ordre: prénom/nom/tel→Continuer→email→Continuer→jour→créneau→Confirmer. reCAPTCHA v3 invisible (pas bloquant).

**BUG BLOQUANT réparé:** doublon propriété `source` table inspirations schema.ts (2 instances parallèles) empêchait TOUT deploy Convex. Corrigé.

**Concurrents = 1 seul moteur:** Trakyo runtime décodé (script clair): cookie serveur 400j via /api/tm/process, ThumbmarkJS Pro, fallback TikTok 302 serveur, deep-link. Mochi pixel t.themochi.app/pixel.js aspire dub_id. Dub cookie = JS document.cookie 90j → PLAFONNÉ 7j ITP. NOTRE cookie est SERVEUR (Set-Cookie .brvndlab.com 2 ans) → on est DEVANT eux sur la persistance.

**RÉSIDU À NETTOYER (Jonathan):** annuler 2 RDV iClose test (26/08 14h et 15h). Fiches test: v_mt97syag, iclosed_test.audit+...; ligne trackerInstalls ma-page-test-brvndlab.com.

**PHASE 2 COOKIE FAITE ET PROUVÉE (26/08, commit c1c009f1→54710b82, Vercel Ready):**
- Nouveau endpoint /api/track/cookie: pose cookie SERVEUR brvnd_visitor 2 ans (Max-Age=63072000) via Set-Cookie HTTP → échappe au plafond 7j Safari ITP.
- Cross-site (page client → .brvndlab.com): SameSite=None+Secure. Same-site (domaine de suivi client): SameSite=Lax, cookie sur .sondomaine.com.
- proxy.ts: laisse passer /api/track/* sur domaines custom (sinon 307 vitrine).
- brvnd.js: persisterServeur(id) appelle /api/track/cookie avec credentials:include au boot. Cookie JS reste filet immédiat.
- Réglages>Suivi: bloc "Mémoire du visiteur" (2 ans actif par défaut) + guide DNS 1 CNAME (suivi.xxx → go.brvndlab.com, cible = getMine().cnameTarget).
- TESTÉ EN RÉEL: curl app.brvndlab.com/api/track/cookie → Set-Cookie 2 ans OK cross-site (.brvndlab.com None) ET custom (.monsite-client.com Lax via x-brvnd-domain). Snippet prod contient persisterServeur/COOKIE_URL/credentials.
- NOTE: sans domaine de suivi, cookie .brvndlab.com est TIERS → Safari peut le bloquer malgré None. Le domaine de suivi client (CNAME) = seule persistance 2 ans garantie sur Safari. Défaut marche partout sauf Safari strict.

**Phase 2 reste optionnel:** custom domain CNAME→go.brvndlab.com (Vercel) pour le domaine de suivi. Le proxy sert /api/track/* dessus.

**FIX VITESSE iCLOSE (26/08, commit 536aee05→ae7ef198, Vercel Ready):**
- CAUSE des 3 min: iClose POUSSE DÉJÀ chaque RDV en webhook temps réel vers /api/webhooks/iclosed/[secret]. Mais le handler ne le reconnaissait pas: type dans `hookType` ("Call booked"/"Contact created"), PAS `type`. Le code lisait event.type → isBooking=false → webhook archivait le raw sans créer le booking → polling 15min créait le RDV 1-3min après.
- FORMAT RÉEL webhook iClose "Call booked" (À PLAT racine): {hookType, contact:{firstName,lastName,email,phoneNumber,Utm:[{utmKey,utmValue}],ipAddress}, event:{uuid,...}, event_type, tracking:{utm_content,brvnd,utmKey_N/utmValue_N...}, invitee, questions_and_answers, call_booked_from}.
- JETON: tracking.utm_content = champ dédié du RDV courant (le plus fiable, lu en priorité) ; contact.Utm = historique cumulé des clics (tableau, dernier = plus récent).
- FIX route.ts: eventType lit hookType ; call=data.event ; contact=data.contact ; hintDepuisTableauUtm(contact.Utm) ; externalEventId=iclosed_call_<event.uuid> ALIGNÉ sur le polling (sync.ts forge iclosed_call_${call.id}) → webhook crée, polling confirme, pas de doublon.
- TESTÉ: webhook rejoué (payload réel) → HTTP 200 en 0.81s, opt-in rattaché au bon visiteur via tracking.utm_content. AVANT: 3 min. MAINTENANT: <1s.
- Webhook DÉJÀ branché côté iClose (6 raw reçus en direct). Signature Svix en mode observation (ICLOSED_SIGNATURE_ENFORCE non défini en prod). Appel API repli évité si jeton présent (reste rapide).
- webhookSecret iClose prod: CxMDlf2MLR32CUQEKE9eh6JiWcr40wiAnqtu30wlA5M ; URL affichée dans /integrations/iclosed.
- Clic→touchpoint mesuré ~1-2s (after() Next), déjà rapide, pas le goulot.
- ANTI-DOUBLON prouvé: event.uuid (webhook) == call.id (polling) sur 9/9 bookings réels (2484728,2485086,2485187,2485347... tous des 2 côtés). Idempotence par externalEventId testée (même webhook 2x = 1 booking). Commit 816c72cf: tracking.utm_content en 1er. Commit 14a6d597→3f44106f: booking créé UNIQUEMENT sous externalEventId aligné iclosed_call_<id> ; sans id alignable (jamais vu) → laissé au polling, jamais d'id divergent → doublon impossible par construction. Superviseur 9/10 puis trou résiduel fermé.
- Sync polling forge iclosed_call_${call.id} (sync.ts). Webhook lit event.uuid (==id) puis event.id en repli. Voir [[feedback_never_deploy_prod_without_explicit_validation]] [[project_brvndlab_smart_links_logic_validated]] [[project_brvndlab_leads_logic]] [[feedback_brvndlab_convex_shared_deploy_rule]].
