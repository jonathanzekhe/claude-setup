---
name: wispr-flow-meetings-local
description: "Les enregistrements de réunions Wispr Flow sont lisibles en local, sans MCP, dans ~/Library/Application Support/Wispr Flow/meetings/"
metadata: 
  node_type: memory
  type: reference
  originSessionId: 3b3cd24f-851e-4822-bcf1-d96bb749c989
  modified: 2026-08-12T11:51:54.544Z
---

Quand Jonathan dit qu'un transcript est "sur Wispr", pas besoin du serveur MCP Wispr Flow (souvent absent de la session) : les meetings sont stockés en local dans `~/Library/Application Support/Wispr Flow/meetings/<uuid>/`. Le fichier `refined.ndjson` contient le transcript propre (une ligne JSON par segment : `timestamp`, `text`, `speaker.id`), `live.ndjson` la version brute, `upload.ogg` l'audio. Identifier le bon meeting par la date de modification du dossier et un grep d'une phrase connue. Utile car les collages de transcripts dans le chat sont tronqués à 50 000 caractères.

Exemple : R2 Jorge Santos du 12/08/2026 = meeting `ba8ac3b8-c382-4486-b480-c79162b2f89d`, extrait vers [[jorge-santos-realelec-offre]] `VividFlow/bouquet-supreme-r2/jorge-santos-r2/transcript-r2-2026-08-12-complet.md`.
