---
name: project_brvndlab_rush_suppression_page_asset
description: Rush — la suppression existe aussi sur la page du fichier (/rush/a/id), pas seulement dans la vue dossier
metadata:
  type: project
---

Livré et vérifié en live le 29/08/2026.

**Le trou comblé** : la suppression n'existait QUE dans la vue dossier du projet (`/rush/p/<id>`, menu « Options du fichier » sur la carte). On ne pouvait pas jeter une vidéo depuis l'écran où on la regarde — précisément là où on constate qu'elle est ratée.

**Ce qui a été ajouté** dans `src/app/(app)/rush/a/[id]/page.tsx` : bouton de suppression dans la barre du haut (à droite, après le sélecteur de version), modale de confirmation, puis retour au projet via `goBack()`.

**ICÔNE SEULE, pas de mot** (29/08) : Jonathan trouvait que « Supprimer » prenait trop de place. Classe `rush-iconbtn rush-iconbtn--danger`, `aria-label="Supprimer le fichier"` (sans texte le bouton n'aurait plus de nom accessible). Le rouge n'apparaît QU'AU SURVOL : une corbeille rouge en permanence tirerait l'œil vers l'action la plus destructive. Taille calée sur l'échelle de CETTE barre (27px, comme le sélecteur de version voisin) et non sur les 36px génériques du bouton icône, sinon il dépasse.

**Quelle mutation** : `deletePipelineAsset`, PAS `removeAsset`. La première suffit au niveau `edit` (décision 12/08 : « le module marche à la confiance, tout membre peut nettoyer »), donc un monteur collaborateur peut supprimer sa propre livraison ratée. `removeAsset` exige l'accès `full` et le bouton serait rejeté pour la moitié des utilisateurs. Le bouton est conditionné à `canEdit`, comme les autres actions destructives de la page.

**Rien n'est détruit** : la suppression met à la CORBEILLE, récupérable 30 jours (verrou posé après l'incident du 25/08). Le texte de la vue dossier annonçait « Suppression définitive, sans retour possible » — faux et anxiogène, corrigé le 29/08 pour dire la corbeille et 30 jours, avec l'action « Mettre à la corbeille ».

**Why:** Trouvé pendant la vérification du menu de téléchargement, signalé à Jonathan, qui a demandé de le régler au passage.

**How to apply:** Tester en Chromium **headed** (voir [[project_brvndlab_rush_download_3_qualites]]). Note d'UX relevée mais non traitée : fermer le menu de téléchargement avec Échap démonte toute la barre d'outils, bouton Supprimer compris ; re-cliquer sur la pastille la referme proprement.
