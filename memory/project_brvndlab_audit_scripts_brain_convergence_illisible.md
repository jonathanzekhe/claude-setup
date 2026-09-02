---
name: project-brvndlab-audit-scripts-brain-convergence-illisible
description: "Audit 14/08/2026 — scripts illisibles à l'oral car la seconde brain a convergé vers une voix \"essai écrit impersonnel\" ; la refonte réinjecte les mêmes règles et ne peut pas réparer"
metadata: 
  node_type: memory
  type: project
  originSessionId: f5658ee7-06a9-40cb-8dd3-c0e86e15ba48
  modified: 2026-08-14T13:03:49.542Z
---

Audit du 14/08/2026 sur le script « Il travaille tout la journée, rien n'avance » (contentItem js7d6ypfhe31f2t2xn93yy2qx58cegkc, prod accurate-cormorant-297). Jonathan n'arrivait pas à lire le script à voix haute et la refonte n'a fait que 3 micro-retouches.

4 causes identifiées (diagnostic livré, AUCUN fix appliqué, en attente de décision) :
1. La seconde brain ([[project-brvndlab-seconde-brain-comment-ecrire]]) a convergé vers ~40 règles qui prescrivent une prose écrite abstraite : « aller direct à la nominalisation », constat impersonnel, désindividualiser, vocabulaire imposé (infrastructure/pipeline/charge opérationnelle, occurrences 13). Les interdits durs bannissent tous les outils de l'oral (questions, tu, anecdotes, verdicts, figures). Set contradictoire en interne.
2. Compression impossible : fil verrouillé 5 étapes + 3 faits porteurs (règle dure) dans un Short de 193 mots, alors que le calibre appris dit 210-265 mots / une seule idée.
3. refonte-content réinjecte les mêmes profil + interdits durs + « ne casse pas ce qui marche » : structurellement incapable de réparer le style que les règles imposent.
4. Boucle toxique : la réécriture ratée est envoyée à optimizeBrain/distillFond dès qu'elle est APPLIQUÉE (pas validée), le système apprend de ses échecs.

Recommandations proposées : purge validée ligne par ligne de la brain (levier n°1), gate « lisible à voix haute » au-dessus des règles apprises, mode réécriture franche en refonte quand le créateur dit « illisible », plafonner le fil à 2-3 temps en Short, n'apprendre que sur le 2e feu vert.

EXTENSION 14/08 (2e passe, question « trop de règles ? ») : OUI, ~90-100 directives empilées sur 11 couches par génération, majorité d'interdictions, aucune intention positive.
- BUG OBJECTIF trouvé : le détecteur de fautes flague encore le « ne » de négation (generate-script/route.ts:679) alors que la décision Jonathan est de GARDER le « ne » (HUMAN_RULES + règles dures éditeur). Faute incorrigeable → la boucle éditeur tourne TOUJOURS à 2 réécritures complètes sur chaque script, annulant la décision dégonflage du 31/07. Fix = supprimer cette ligne.
- 6 autres contradictions frontales : nominalisation (brain pousse / éditeur interdit), anaphore rafale (brain prescrit / détecteur tue), cascade de substantifs (brain prescrit / hook interdit), maxime finale (brain prescrit / CONTENT_RULES interdit), adresse « tu » (base impose / brain interdit + désindividualise), « en vrai » (éditeur l'introduit ligne 769 / interdit dur brain le bannit).
- Réponse à « ajouter une règle pour tout le monde ? » : NON, en enlever.

EXÉCUTÉ 14/08 (main libre donnée par Jonathan, commit 2b64a3af, déployé Vercel prod dpl_...3hjytpzrr, live sur app.brvndlab.com) :
1. Détecteur « ne » supprimé (generate-script) : plus de double réécriture systématique.
2. Identité copywriter senior + règle maîtresse « ce texte s'écoute, il ne se lit pas » en tête du prompt de génération ET de l'éditeur.
3. Short : respiration obligatoire si fil/faits denses (viser ~250-310 mots, jamais compresser).
4. Refonte : consigne en direct PRIME sur règles apprises + mode réécriture franche sur « illisible / je comprends rien » (micro-retouche = échec).
5. « en vrai » retiré des prescriptions éditeur et de CHAT_CONDUCT (banni par la brain).
6. PURGE BRAIN prod : 37 → 29 notes (backup complet : ~/dev/brvndlab-claude/backups/brainNotes-jonathan-backup-2026-08-14.txt). Supprimé : nominalisation directe, désindividualiser, accroche jamais-tu, rafale X.Y.Z., cascade substantifs, 3 clôtures maxime/impersonnelle (fusionnées en 1), 2 notes vocabulaire imposé (infrastructure/pipeline), anecdotes bannies (réécrite en dosage pro-vécu).
2e SALVE 14/08 après-midi (commit b92c6664, Convex + Vercel prod déployés, vérifiés live) — ANTI-REPOLLUTION demandée par Jonathan (« plus jamais de purge ») :
- OPTIMIZE_SYSTEM : sur CONFIRMATION (contenu validé sans retouche = texte 100% IA), le moteur ne CRÉE plus de note (boucle d'auto-confirmation identifiée = source des règles toxiques). PLANCHER ORAL non négociable (jamais de règle qui pousse vers l'écrit abstrait). Plus de listes de mots à privilégier dans la brain (vit dans le Brand OS).
- replaceNotes arg `reinforce` : occurrences ne monte que sur signal HUMAIN (correction/consigne) ; confirmation passive = report sans bonus. Vérifié déployé prod.
- Lya refonte : AUTO-CONTRÔLE avant chaque réponse (phrase vide de sens interdite, proposition collée à l'état affiché, prévenir si la correction déborde) + CALIBRE ±20% et plancher Short ~170 mots (demande explicite Jonathan : tournures robotiques vides + Lya doit vérifier son propre sens avant de proposer).
- Chat « Améliore ton script » (Haiku) : consigne prime + réécriture franche + auto-contrôle.
- Éditeur + juge : « phrases qui ne veulent rien dire » explicitement traquées.
Incident git résolu sans perte : le WIP brandDna d'hier soir était en fait déjà commité/poussé (bef7692f) ; un stash pop a dépilé par erreur wip-avant-plus-flat (feat/script-references), conflit annulé par checkout HEAD, les 2 vieux stashes intacts.
NON FAIT (volontairement) : détection du 2e feu vert dans la refonte avant apprentissage.

TEST RÉEL 14/08 14h36 : script 1 (Short, même sujet) = jour et la nuit, validé par Jonathan. 234 mots / ~88 s, phrases orales, faits intacts, zéro jargon. Feedback Jonathan sur ce test → RÈGLE 5 CONTENT_RULES ajoutée (commit c0461f28, déployé) : POSTURE D'EXPERT, pas de revendication « mes clients » en béquille récurrente ; possessif réservé à UNE preuve précise par contenu ; le fait reste exact, seul le cadrage passe en observation de marché. Exception miroir ajoutée au juge de matière (recadrage expert ≠ généralisation). Règle générale voulue par Jonathan pour TOUS les clients (script + carousel + story via CONTENT_RULES).
Affinage règle 5 (commit f40fc12c, déployé) : la désignation de l'audience vient du Brand OS du créateur (coachs, consultants, « les gens qu'on accompagne »...) et VARIE librement dans un même contenu ; la règle impose la posture, jamais une phrase toute faite (demande Jonathan : l'IA reste libre dans son expression, pas de nouveau tic « les entrepreneurs à ce stade »).
Reste du protocole : long YouTube + test refonte « je comprends rien », puis contrôle anti-repollution de la brain après validations.

Données utiles : la conversation de refonte vit en sessionStorage navigateur (non auditable serveur) ; les consignes exactes + diffs des réécritures appliquées sont dans la table vieEvents (kind "refonte") ; compteur refonteStats par titre.
