---
name: project_brvndlab_pipeline_cycle_de_vie_2026_08_26
description: "Cycle de vie contenu Pipeline Brvndlab — désassociation, variantes, confettis publication (26/08/2026, déployé)"
metadata: 
  node_type: memory
  type: project
  originSessionId: 15ba0568-c44a-4f97-93c7-971cd7ed41fd
  modified: 2026-08-26T09:17:46.345Z
---

Chantier pipeline/publier livré et déployé le 26/08/2026 (commits jusqu'à 181974d5, Convex accurate-cormorant-297 + Vercel Ready).

## Modèle de données (source: audit code)
- Contenu = table `contentItems`, champ `status`: brouillon | draft | production | montage(mort) | scheduled | published | archived.
  Labels UI: "Post à valider"=draft, "Production"=production, "Prêt à programmer/Pré-programmé"=scheduled SANS scheduledAt, "Programmé"=scheduled AVEC scheduledAt.
- Vidéo = table `rush_assets`, champ `status`: a_recuperer|recupere|a_traiter|en_cours|a_revoir|valide. Lien vidéo→contenu = `scriptItemId` (index by_script). Variante = `variantOf` (index by_variantOf) + `variantTitle`. Nature CALCULÉE par assetNature() (livraison vs rush), PAS un champ.
- Association portée par la VIDÉO (scriptItemId), pas par le contenu.

## Règles cycle v2 (Jonathan)
- Associer ne bouge PAS le statut. C'est la RÉCUPÉRATION (autoRecupere via markDownloaded) qui passe en Production.
- Récupéré (en_cours/recupere/a_revoir) → Production. Validé (valide) → Pré-programmé (scheduled sans date). SEUL chemin vers scheduled = valide.
- a_recuperer/a_traiter (associé mais pas récupéré) → reste draft, aucun mouvement.

## Ce qui a été corrigé (26/08)
- **Désassociation** (convex/rush.ts linkScript, branche else "délier"): AVANT ne faisait que retirer le lien. MAINTENANT:
  (a) le contenu RECULE à draft ("Post à valider") s'il ne reste AUCUNE vidéo non-trashed liée (une archivée=en montage compte encore). Jamais published/archived.
  (b) la vidéo libérée: on lève `archived` (sinon invisible du picker) + applyAssetStatus→"valide" (la reloge dans dossier Validé), en try/catch (un rush brut throw sinon, mais le délier doit aboutir). scriptItemId retiré AVANT applyAssetStatus → pas de propagation pipeline parasite (vérifié superviseur).
- **reparerContenusVides** (internalMutation, à lancer via npx convex run rush:reparerContenusVides): remet en draft les scheduled(sans date)/production sans vidéo. Lancé 26/08 → 2 contenus réparés ("Ta data c'est l'otage", "Votre entreprise n'a pas de mémoire"). Idempotent.
- **Variantes associables** (listVideosAssociables + AssocierVideo.tsx): chaque racine du picker joint ses variantes (by_variantOf, exclut trashed/archived/déjà-liée/non-vidéo) affichées SOUS elle avec leur variantTitle, cliquables pour associer la variante précise. Pas de brouhaha dans la liste principale.
- **Confettis publication** (InstagramComposer + YoutubeComposer): une publication IMMÉDIATE (when===null / !scheduledMs) déclenche CelebrationOverlay ("Merci"/"Ton contenu est publié") puis router.push("/home"). Une PROGRAMMATION (date future) garde le retour discret goBack, pas de confettis.
- **Bouton "Reconnecter via Facebook (musique)" retiré** (integrations/page.tsx): plus de musique sur les Reels.

## Vérifs
- tsc 0 erreur app+convex. Superviseur 8.5/10 (propagation parasite neutralisée confirmée), 3 points corrigés (commentaire archived, garde rush try/catch, filtre archived variantes).
- Réparation 2 vides confirmée en prod (draft 9→11, seuls 2 items updatedAt récent).
- linkScript NON testable CLI (auth Clerk) → geste réel désassociation à valider par Jonathan dans l'app.
- CelebrationOverlay = composant existant (src/components/CelebrationOverlay.tsx, canvas-confetti, onComplete à 1750ms).
