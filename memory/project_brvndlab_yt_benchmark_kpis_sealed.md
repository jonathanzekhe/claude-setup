---
name: project-brvndlab-yt-benchmark-kpis-sealed
description: "Benchmark YouTube Analytics scellé — X = vidéos sur 30 jours (« Vidéos ce dernier mois »), Y = « Taille d'audience » échelle log fixe (paliers 1K/10K/100K/1M), cartes avec vues moy. récentes + dernier post"
metadata: 
  node_type: memory
  type: project
  originSessionId: 4da45cad-ac26-4a8a-a6d5-d7ef2fcd36bf
---

Décision scellée le 2026-07-09 (mockup validé « J'adore, let's go, on push », prod a559b12, itération b0f57e7 après retour vocal).

Benchmark concurrents/références YouTube (Analytique › YouTube) :
- Axe X = vidéos publiées sur les 30 derniers jours. Libellé court : « Vidéos ce dernier mois » (Jonathan a refusé « Rythme de publication, 90 derniers jours » : trop long). Fenêtre 30 j exprès : une chaîne au bon rythme qui s'arrête tombe à 0 en quelques semaines, alors que la moyenne 90 j la faisait paraître encore active (cas Minozan soulevé par Jonathan). Jamais le total de vidéos à vie (récompense les chaînes mortes).
- Axe Y = « Taille d'audience » (wording de Jonathan, pas « Abonnés (échelle réelle) ») sur échelle log FIXE avec paliers gravés : 1K / 10K / 100K « grosse audience » / 1M « top du marché ». Jamais d'échelle relative min/max (faisait passer 6K pour le sommet). Perspective de Jonathan : grosse audience = 100K+, top = millions.
- Labels points : nom · abonnés · x/mois.
- Cartes concurrents : vues moy. récentes (30 dernières vidéos) au lieu de la moyenne depuis la création (biais d'ancienneté), + « Dernier post il y a X » (vert ≤30 j, neutre ≤90 j, rouge au-delà).
- Backend : `competitorVideoMetrics` renvoie freq (vidéos 30 j) / recentAvgViews / lastPostAt ; `social.refreshMyBenchmarkChannels` rafraîchit les lignes persistées (throttle 24 h via refreshedAt + plancher au changement de formule), déclenché au chargement de YoutubeContent.

Lié : [[project_brvndlab_brand_os_central]], [[feedback_sync_stack_doc_on_every_change]].
