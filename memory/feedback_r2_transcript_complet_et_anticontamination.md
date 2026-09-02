---
name: feedback_r2_transcript_complet_et_anticontamination
description: "Règles R2 post-incident Jorge Santos : transcript TLDV complet obligatoire, jamais cloner un deck client, balayage anti-contamination bloquant"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 67140454-59d4-4218-a6b4-3aeaf57ba10f
  modified: 2026-08-10T10:49:48.804Z
---

Incident Jorge Santos (10/08/2026) : le deck R2 de l'électricien avait été cloné depuis le deck Schmid (gérance immobilière) « pour hériter de la DA », et généré depuis le RÉSUMÉ TLDV. Résultat : 6 restes immobilier dans le CDC, promesse inverse du besoin ERP du client, et perte des signaux de conversion (fille relais IA, kickoff janvier, critère de décision liste de prix suisse, transition parallèle 3-6 mois).

**Why:** Le résumé TLDV perd les signaux fins qui font la conversion, et un clone de deck client garde toujours des restes du métier précédent. Les commerciaux copient-collent les decks sans revoir l'appel : chaque incohérence part telle quelle chez le prospect.

**How to apply:**
1. Nouveau deck R2 = dupliquer UNIQUEMENT `bouquet-supreme-r2/template/` (la DA validée y est intégrée depuis le 10/08/2026, tokens préservés). Jamais un deck client.
2. Source de contenu = transcript COMPLET via l'API TLDV (`search-meetings` → `get-meeting-transcript`). Le résumé ne suffit jamais. ACCÈS TESTÉ le 10/08/2026 : le connecteur claude.ai tldv remonte le transcript intégral horodaté (appel Jorge 6a76f0e8af3cfb00130be7ac retrouvé et lu en entier). Procédure pas à pas dans template/TEMPLATE-GUIDE-R2.md (choisir la réunion par durée + vérifier l'identité dans le texte ; si le serveur tldv n'est pas connecté : STOP et demander la reconnexion, pas de repli sur résumé). Pas de fiche d'appel commerciale : refusée par Jonathan, le Data OS couvre déjà ça. MODÈLE : les decks R2 se génèrent en Claude Fable (claude-fable-5), repli Opus 5 ; agent 100% autonome, aucune question en cours de route, seul blocage admis = connecteur tldv non authentifié.
3. Dérouler la checklist d'extraction du guide (critère de décision, interlocuteur relais, timing, plan de transition, circuits, objections, charges).
4. Balayage final bloquant : greps anti-client-précédent (immobili|gérance|expertise|immeuble|mandat|locataire|propriétaire|schmid|marine|valais + après Jorge : realelec|jorge|santos|électric|tayo), tokens oubliés `\[[A-Z_0-9]*\]`, em-dash. Zéro hit exigé.
5. Position sur l'outil existant identique sur les 5 pages (garder OU quitter, jamais les deux).
Règles complètes : `template/TEMPLATE-GUIDE-R2.md` + `template/CLAUDE.md`. Voir [[project_r2_template_system]] [[feedback_toujours_verifier_le_live_avec_un_agent]].
