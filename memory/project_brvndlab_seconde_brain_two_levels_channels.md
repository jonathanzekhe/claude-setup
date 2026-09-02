---
name: seconde-brain-deux-niveaux-de-force-canal-oral-crit
description: "La seconde brain distingue interdits DURS (marbre, RÈGLES ABSOLUES en fin de prompt) vs à-DOSER (direction), et canal oral (script) vs écrit (carousel/story/caption/LinkedIn). Le COMMENT ne vit QUE dans la brain, plus dans le Brand OS."
metadata: 
  node_type: memory
  type: project
  originSessionId: dc9dd1a0-579c-46e0-82a8-deab9e713138
  modified: 2026-07-29T16:30:24.331Z
---

Refonte du 2026-07-29 (déployée prod). Deux problèmes réglés : scripts qui ne respectaient pas les règles + brain qui ne semblait pas apprendre.

**Deux niveaux de force** (dans `resolveBrainBlocks`, src/lib/ai/secondBrain.ts) :
- Section `interdits` = MARBRE → bloc « RÈGLES ABSOLUES — NON NÉGOCIABLES » posé EN FIN de system prompt (mieux respecté qu'en tête). Génération + toutes retouches.
- Sections `ame`/`regles`/`calibres` = DIRECTION à doser → profil d'écriture, cadré « dose avec justesse ».
- Avant : un seul bloc mou « applique naturellement » où un interdit dur était traité comme suggestion.

**Canal oral vs écrit** : script = `"oral"`, carousel/story/caption/LinkedIn/story-chat = `"ecrit"`, refonte suit le format. Le moteur `optimizeBrain` préfixe `[Oral]`/`[Écrit]` les notes propres à un canal ; sans préfixe = universel. `resolveBrainBlock(token, channel)` filtre.

**Discernement silencieux** : le client ne dit jamais « enregistre » — il corrige, le moteur discerne (supprimé partout = interdit dur ; réduit = dosage), classe, préfixe. Cf. [[project_brvndlab_seconde_brain_comment_ecrire]] [[project_brvndlab_seconde_brain_optimisation]].

**Échecs tracés** : `optimizeBrain` ne perd plus une leçon en silence (timeout Sonnet, quota, JSON invalide) → `console.error [secondBrain] apprentissage PERDU`. Le diff (original IA vs version finale) était déjà transmis par les 3 éditeurs.

**Le COMMENT a quitté le Brand OS** : modules fantômes `style`/`voix` purgés en base, `getBrandDna` n'extrait plus ton/motsSignature/motsAEviter/styleEcriture. Data utile migrée via `brain.appendNotes` (ajout pur, source `migration_style`). Brand OS = QUOI/QUI/POURQUOI, brain = COMMENT.

**Nouvelle mutation** : `brain.appendNotes(clerkUserId, notes)` = ajout pur append-only, anti-doublon, jamais de suppression (règle : on ajoute, on n'efface jamais). `convex/purgeStyleModule.ts` = purge calquée sur purgeVoixModule.

Reste ouvert : reclasser les ~7 interdits appris AVANT cette distinction (certains sont des dosages mal rangés en interdits) ; le moteur convergera seul sinon.
