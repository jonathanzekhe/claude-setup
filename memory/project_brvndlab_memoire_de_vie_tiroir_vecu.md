---
name: project_brvndlab_memoire_de_vie_tiroir_vecu
description: "SCELLÉ+DÉPLOYÉ 30/07 : 3e tiroir du cerveau (mémoire de VIE, pattern LLM Wiki Karpathy) + apprentissage sur consignes de refonte + provenance notes + journal apprentissage"
metadata: 
  node_type: memory
  type: project
  originSessionId: 8f02ca45-319a-4069-b1c4-24b2383f96ed
  modified: 2026-07-30T16:04:23.457Z
---

Chantier bloc 4 scellé et déployé prod le 2026-07-30 (commits e4234a24, ed1de645, 47ba59b9). Suite directe de [[project_brvndlab_audit_chaine_ia_2026_07_30]].

**Architecture scellée par Jonathan : UN cerveau, TROIS tiroirs.**
Brand OS = QUI (identité stable). Seconde brain = COMMENT (forme d'écriture). NOUVEAU tiroir VÉCU = ce qu'il vit (faits datés, histoires, chiffres qui évoluent, choses vues/entendues). Présenté comme une seule mémoire, stores séparés. Sources : uniquement ce qui est dit DANS Brvndlab (brainstorms Lya, journal, refontes, scripts validés). PAS d'ingestion de contenu externe (rejeté pour l'instant).

**Pattern Karpathy LLM Wiki adopté (gist audité) :** sources brutes immuables = source de vérité (les mots de l'utilisateur, datés) ; fiches de synthèse maintenues par IA au-dessus ; index compact injecté ; passe d'entretien (lint) qui détecte contradictions/évolutions ; journal append-only. Rejeté : fichiers markdown/git/Obsidian (infra perso), curation manuelle.

**Implémentation (backend only, zéro changement frontend, contrainte tokens respectée) :**
- Tables Convex : vieFiches (slug/title/resume/body daté avec statuts vécu/entendu/inventé/links, max 30/user), viePending (questions spontanées, max 10), vieEvents (brut temps réel, zéro token), vieState (lastSweepAt), brainLog (journal apprentissages brain/fond/vie).
- Temps réel = écriture brute seulement : brain-validate et refonte-content enregistrent un vieEvent via after() (zéro IA).
- UNE passe Sonnet (feature vie_sweep, src/lib/ai/vieMemory.ts) par utilisateur par ~20h, déclenchée à l'activité (brain-validate, refonte, brainstorm-explore), SEULEMENT s'il y a matière nouvelle (events + journalEntries/journalNotes + brainstormDrafts). Échec = lastSweepAt intact, rejouable. Met à jour 1-3 fiches max, crée les questions en attente (« tu avais dit 120 audits en mai, là j'entends 150 : qu'est-ce qui s'est passé ? »), résout celles auxquelles la matière répond.
- Injection : resolveVieBlock (index + questions + posture « fais le lien et vérifie, n'invente jamais, inventé = marqué ») dans brainstorm-explore (Lya). Cap 2500 chars.
- Seconde brain : provenance zéro-token (replaceNotes préserve un compteur occurrences par texte normalisé ; « confirmée Nx » injecté dans le moteur = plus c'est haut, plus la note est préservée) + discernement MOT vs PRINCIPE gravé dans OPTIMIZE_SYSTEM (retour Jonathan : une règle vise ce qu'une tournure FAIT, jamais un mot en soi ; interdire des mots = amputer la langue).
- Apprentissage sur CONSIGNE de refonte (chantier 1 du bloc 4, déployé avant) : quand une réécriture est appliquée, la consigne exacte + diff partent à optimizeBrain (signal INSTRUCTION, n'apprend que le généralisable) + distillFond, via after(). Retour arrière n'apprend rien.

**Brain de Jonathan enrichie à la main (validé par lui) :** 25 -> 31 notes, 6 règles distillées de l'analyse de ses 5 refontes réelles (hook situation précise jamais généralité de groupe [reformulée niveau principe], scène concrète, conséquences observables, mécanisme en une phrase bénéfice, clôture maxime, une idée dite une fois). Contradiction signalée à trancher : son interdit existant « bannir anecdotes/exemples personnels détaillés dans le corps » vs ses refontes qui ajoutent ses 120 audits. PAS résolue, à lui de trancher.

**Diagnostic refontes (base du chantier, comptes séparés à sa demande) :** sur SON compte : hook réécrit 5/5, matière vécue ajoutée 3/5, corps entier changé 1/5. Idées rejetées : ingestion contenu externe (plus tard), mémoire de matière comme brique séparée (= ce tiroir vécu couvre).

**DÉCISION Jonathan (17h37 puis 17h56) : pas de MODULE Mémoire dédié (brouhaha), tout s'appelle « la seconde brain ».** La page /memoire standalone a été retirée (revert 3cbe0e70). À la place, surface FINALE validée (commit d620b912, déployée) : Réglages > Agentique avec sélecteur deux vues : « Profil d'écriture » (SecondeBrainCard existante, ne pas changer) et « Mémoire sémantique » (MemoireSemantiqueCard) : synthèse Brand OS en DÉPLIANT FERMÉ par défaut (décision : info importante, on va la chercher ; JAMAIS de lien de redirection vers /brand-os), fiches de vie dépliables + « Lya va creuser », journal d'apprentissage. Lecture seule, zéro redondance avec le profil d'écriture. La jauge maturité (SecondeBrainCard « Scripts N% ») = part des validations sans correction (getMaturity), expliquée à Jonathan le 30/07 (2 validations sur 8 non corrigées = 25%).

**Page /memoire construite puis retirée le même jour (commit 2dd3dfb8, revert 3cbe0e70) :** page client lecture seule owner-only, 3 tiroirs (Qui tu es = renvoi Brand OS ; Comment tu écris = notes par section avec pastille confirmée Nx + badges canal + maturité ; Ce que tu vis = fiches dépliables + « Lya va creuser ») + journal d'apprentissage (brainLog). Query vieMemory.getMyMemoirePage, entrée sidebar après Brand OS (owner lists only), route protégée via src/proxy.ts. DA Frosted Bento respectée (28/16/8, variables CSS, skeletons).

**Vérification en attente (à faire au retour de Jonathan) :** il fait une refonte avec une vraie consigne -> comparer sa brain (photo baseline 31 notes, scratchpad baseline-brain-jonathan.json) et vérifier brainLog + vieEvents + fiches créées après sweep. Rien observé en runtime encore, tout est statiquement vérifié + déployé (Convex accurate-cormorant-297 + Vercel, alias app.brvndlab.com Ready).
