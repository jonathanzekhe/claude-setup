---
name: project_brvndlab_rush_download_3_qualites
description: Rush — le menu de téléchargement a 3 boutons (Original / 1080p / 720p) et chacun livre vraiment sa qualité, encodage navigateur via mediabunny
metadata:
  type: project
---

Décision scellée le 28/08/2026, livrée et vérifiée en session réelle sur app.brvndlab.com.

**La règle, mot de Jonathan** : « quand je télécharge, je veux Original, 1080p ou 720p, et chaque bouton télécharge DANS ce format-là ». Peu importe ce que vaut l'original : c'est l'original, au moins on est sûr. Il ne veut PAS qu'on lui demande si la qualité existe — « il s'adaptera ».

**Ce que fait chaque bouton** (`DownloadMenu` dans `src/app/(app)/rush/a/[id]/page.tsx`) :
- **Original** : `asset.sourceUrl`, le fichier tel qu'importé, octet pour octet. Métadonnée = résolution mesurée + poids.
- **1080p / 720p** : livrent vraiment cette hauteur. Trois chemins dans l'ordre : (1) source déjà à cette hauteur ou en dessous → on sert la source, ré-encoder n'inventerait aucun détail ; (2) demande 720p et un proxy existe → on sert le proxy ; (3) sinon on fabrique.

**La fabrication** : `src/lib/videoTranscode.ts`, librairie `mediabunny` (WebCodecs sous le capot), sortie MP4/H.264 **avec la piste audio conservée**. Import dynamique : 507K isolés dans leur chunk, chargés seulement au clic. Ne PAS confondre avec le proxy 720p de `rushMedia.ts`, généré à l'import via MediaRecorder (temps réel, .webm) pour la lecture fluide.

**Pourquoi pas de transcodage serveur** : Convex n'embarque pas ffmpeg et plafonne la durée de ses actions. Un vrai worker d'encodage est un chantier à part, non lancé.

**Garde-fous** : repli sur la source si l'encodage échoue (codec absent, mémoire) ; les boutons 1080p/720p sont masqués si WebCodecs manque (Safari ancien) plutôt que de promettre un format non productible. Un clic aboutit toujours à un fichier.

**AUCUN SOUS-TEXTE** (29/08) : les trois entrées sont des titres nus — « Original », « 1080p », « 720p ». Les métadonnées calculées (résolution, poids, « à préparer », « qualité source ») ont été retirées : Jonathan ne veut pas de sous-texte sous un titre. Ne pas les réintroduire.

**Vérifié en live** le 29/08 : 3 entrées, zéro élément `.rush-dl-meta` dans le menu.

**Why:** Jonathan doutait que « 1080p · original » soit vraiment l'original, ses vidéos étant filmées en 4K. Le code était honnête mais n'offrait aucun 1080p réel. Il a redemandé trois fois les trois boutons : ne plus proposer d'alternative, livrer.

**How to apply:** Ne jamais proposer une qualité que Brvndlab ne sait pas produire. Tester les boutons en Chromium **headed** : un headless sans WebCodecs n'affiche que « Original » et donne un faux négatif. Voir [[project_brvndlab_chantier_rush_pipeline_2026_08_25]].
