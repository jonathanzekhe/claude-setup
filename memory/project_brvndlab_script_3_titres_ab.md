---
name: project_brvndlab_script_3_titres_ab
description: "Script — 3 variantes de titres pour A/B tester les hooks (dans l'éditeur, pas le résumé)"
metadata: 
  node_type: memory
  type: project
  originSessionId: 85669be3-5f8f-465a-b4ca-9c318860b9c4
  modified: 2026-07-27T23:53:59.437Z
---

Feature déployée 28/07/2026. Jonathan veut pousser 3 variantes de titres par vidéo pour A/B tester les hooks : la vidéo ne bouge pas, seuls les titres changent.

**Comportement :**
- Génération AUTO à chaque script : la route generate-script produit `titleVariants` = 3 titres d'ANGLES différents (tension / promesse / curiosité), pas 3 reformulations. Garde-fou : TOUJOURS exactement 3 (dédup + complète avec le principal si <3 + slice(0,3)).
- `title` = LE titre principal (celui de la vidéo / du contentItem). Les 3 variantes dans `ScriptData.titleVariants[]`.
- UI : bouton « 3 titres » discret dans la barre d'actions de l'éditeur de script, REPLIÉ par défaut (showTitleVariants=false). Déplié = les 3 variantes ; clic sur une variante = la promeut en titre principal (★ suit). Classes .tvbtn/.tvbox/.tvitem, tokens var(--), thème light/dark OK.
- Le RÉSUMÉ/récap n'est JAMAIS touché (pages séparées : récap = angles/[id]/recap affiche angle.title, pas scriptData.title). Jonathan voulait le résumé propre à 1 titre.

**Robustesse (tribunal 9/9) :**
- Round-trip via le JSON de `description` (buildDescription `...scriptData` + JSON.parse au reload). Aucun changement de schéma Convex.
- Anciens scripts (pas de titleVariants) : bouton masqué par `(titleVariants?.length ?? 0) > 1`, pas de crash.
- Choix persisté : setIsDirty → autosave → updateContent (title séparé + description). PDF : titres alternatifs dans le meta.
- ANGLE MORT CORRIGÉ : la refonte chat renvoie un scriptData sans titleVariants → on MERGE les variantes préservées (page.tsx setScriptData callback) pour que l'A/B test survive à une refonte.

**BACKFILL anciens scripts (28/07/2026) :** les scripts générés AVANT la feature (dont les postés) n'avaient pas de titleVariants → bouton masqué → Jonathan « je les vois nulle part, même les postés ». Fix : nouvelle route `/api/generate-titles` (génère 3 titres A/B depuis titre+contenu d'un script existant, toujours 3). Effet backfill dans script/page.tsx : à l'ouverture d'un script SANS variantes, génère auto + persiste (setIsDirty → autosave → buildDescription inclut titleVariants). One-shot par script (titleBackfillRef = savedItemId ?? title), puis persisté → jamais régénéré. Les nouveaux scripts (déjà 3 titres) jamais touchés (garde `length > 1`). Spinner « 3 titres… » pendant la génération. Ne persiste QUE si variantes distinctes (si l'IA rate, pas 3 lignes identiques). Reload re-tente si échec (ref réinitialisé).

**Portée choisie :** affichage dans l'ÉDITEUR de script uniquement (Jonathan a écarté calendrier/liste pour ne pas encombrer). Option calendrier/liste faisable si redemandé (extractContentInfo côté calendar/page.tsx).

Fichiers : src/app/api/generate-script/route.ts (génération), src/app/api/generate-titles/route.ts (backfill), src/app/(app)/brainstorming/script/page.tsx (type + UI + PDF + merge refonte + effet backfill).
