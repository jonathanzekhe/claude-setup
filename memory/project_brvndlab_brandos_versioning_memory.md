---
name: project_brvndlab_brandos_versioning_memory
description: "Brand OS — Lya a la mémoire complète : versioning des fiches + undo à la parole (miroir de la refonte)"
metadata: 
  node_type: memory
  type: project
  originSessionId: 85669be3-5f8f-465a-b4ca-9c318860b9c4
  modified: 2026-07-26T23:25:32.975Z
---

La mémoire conversationnelle de Lya dans le Brand OS a été alignée sur celle de la refonte de scripts (27/07/2026, déployé Convex prod + Vercel). Objectif Jonathan : « Lya doit TOUT savoir » — ce qui a été dit, écrit, modifié, et pouvoir revenir en arrière, y compris interrogée depuis une autre section.

**Ce qui existait déjà :** conscience du chat (history→messages, règle 1bis « référence obligatoire sur du déjà-dit ») + conscience de l'état actuel des fiches (l'édition manuelle est vue, elle prime sur la version d'avant).

**Ajouté (miroir de contentItemVersions / snapshotVersion de la refonte) :**
- Table `brandOsResponseVersions` (schema.ts) : avant chaque écrasement dans `saveResponse` (convex/brandOs.ts), l'ancienne valeur est snapshotée. Dédup, plafond 20 versions/champ, isolé par owner. Snapshot en try/catch = best-effort (ne casse JAMAIS l'écriture de la réponse — mutation Convex transactionnelle).
- Queries `listBrandOsVersions` / `listBrandOsVersionsForModule` (isolées owner).
- Prompt interview (route.ts) : bloc « VERSIONS PRÉCÉDENTES » injecté + règle « RETOUR ARRIÈRE PAR LA PAROLE » : « remets ce que j'avais avant » → recopie VERBATIM l'ancienne valeur, jamais inventée si absente.
- Mémoire du chat : slice 30 → 60 tours.

**Le versioning est universel** (IA et édition manuelle passent par le même `saveResponse`). Limite connue : historique construit à partir du déploiement ; une fiche jamais réécrite depuis n'a pas de version antérieure. Tag "manuel" vs "ia" pas câblé (défaut "ia") — cosmétique, l'undo marche sans.

**Verrou par rang PRÉSERVÉ** (décision scellée [[project_brvndlab_module_order_rank_lock]]) : un module voit l'amont via getBrandDna(upToModule), jamais l'aval. Les versions sont fetchées pour le module courant. Voir [[feedback_validation_deux_temps_lya]], [[project_brvndlab_memoire_universelle_contenus]].
