---
name: brvndlab-script-length-cta-funnel-fix
description: "Fix 2026-07-18 — longueur scripts GÉNÉRALISTE (150 wpm fixe, JAMAIS modulée par le débit Brand OS), Sans CTA étanche (question d'engagement = CTA), funnel froid/tiède/chaud verrouillé (funnelLocked)"
metadata: 
  node_type: memory
  type: project
  originSessionId: 26b311ed-ff18-48b0-9392-0c9b154ae853
---

Fix majeur brainstorm Brvndlab (2026-07-18, plaintes clients), déployé prod (tribunal 3 agents ×2 passé) :

1. **Longueur scripts** (`src/app/api/generate-script/route.ts`) : barème GÉNÉRALISTE — décision explicite de Jonathan : NE JAMAIS moduler la longueur par le débit de parole du Brand OS (il a rejeté une v1 DEBIT_WPM Posé 120/Très rapide 180 : « je m'en fous, je veux un truc généraliste »). Constante `WPM = 150` (sert uniquement à la durée estimée). Cibles : short 60-90 s = 170-250 mots (plancher 160), long 14-18 min = 2200-2700 mots (plancher 2000). Plancher appliqué aux DEUX formats dans la boucle éditeur (3 rounds : juge IA sur les 2 premiers, dernier round = fautes déterministes seules, retry sur parse fail). maxTokens 2500 (short) / 8000 (long).

2. **Sans CTA** : `noCta` transmis du récap (`script_context`/`story_context`) → génération, chat de retouche, affinage section, affinage passage ; persisté dans le `ScriptData` (survit à la réouverture). RÈGLE JONATHAN : une question d'engagement finale (« dis-moi en commentaire ce que tu en penses », « et toi ? », toute fin en question au spectateur) EST un appel à l'action → interdite en Sans CTA ; la dernière phrase doit être une AFFIRMATION. Détecteur déterministe sur la dernière section : regex CTA + tournures d'engagement + fin en « ? », avec garde anti-amputation (contenu pédagogique qui PARLE de likes/liens ≠ CTA). Story : `withCTA = funnel==="BOFU" && !noCta`.

3. **Funnel choisi respecté** : clic sur une problématique (froid/tiède/chaud) dans le composer d'explore → `lockedNiveauRef` → `createAngle` avec funnel forcé (froid=TOFU, tiède=MOFU, chaud=BOFU) + champ `angles.funnelLocked` (nouveau, optionnel dans le schema). Le récap affiche/transmet ce choix ; sinon comportement historique (funnel déduit de la structure via OBJ_BY).

Restes assumés (non traités, mineurs) : pas de plafond max de mots ; détecteur CTA sur la dernière section seulement ; retouches STORY ne connaissent pas noCta ; le verrou funnel ne se retire pas après envoi du chip (voulu). Jonathan envisage de retirer la question « Débit de parole » du Brand OS (pas fait, en attente de sa décision). Lié : [[brvndlab-brand-dna-synthesis]].
