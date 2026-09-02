---
name: project_brvndlab_undo_and_autosave_brainstorming
description: "Brainstorming éditeurs — autosave silencieux, undo par section/slide (incl. après refonte), audit surlignage"
metadata: 
  node_type: memory
  type: project
  originSessionId: 85669be3-5f8f-465a-b4ca-9c318860b9c4
  modified: 2026-07-25T10:12:04.142Z
---

Éditeurs de contenu Brvndlab (`src/app/(app)/brainstorming/{script,carousel,new/story}/page.tsx`), sealed 25/07/2026.

**Autosave silencieux** : script + carousel enregistrent tout seuls en base 1,4s après la dernière modif (debounce + `savingRef` anti-double-création). Story l'avait déjà (useEffect sur storyData). Le bouton « Sauvegarder » manuel est remplacé par un indicateur discret : Enregistrement… / Modifié / Enregistré. Décision Jonathan : jamais de bouton save manuel, standard Notion/Linear.

**Undo « Revenir à la version précédente »** : bouton `Undo2` par section/slide, s'affiche quand un snapshot pré-modif existe (`prevSection` script, `prevSlide` carousel/story). Déclencheurs qui remplissent le snapshot : affinage section, affinage passage (surligner→Affiner), ET refonte globale (fix 25/07 — avant, la refonte ne créait AUCUN undo par section). Carousel garde en plus un undo global via `prevData` (« Version précédente » dans le panneau Ajuster).

**Surlignage → Affiner/Commenter** (composant `src/components/SelectableText.tsx` + logique inline script) : « Affiner » (onRefine) est TOUJOURS monté, aucun gate. « Commenter » (onComment) est gated par `savedItemId` (donc quasi immédiat depuis l'autosave). Audit 25/07 : PAS de gate rôle/permission/compte → la feature n'est pas cassée pour l'ensemble des utilisateurs. Un cas client isolé (compte perso, Chrome, rien qui apparaît) n'a PAS pu être reproduit ni instrumenté ; conclu comme cas isolé, pas bug produit. Voir [[feedback_verify_until_live]].
