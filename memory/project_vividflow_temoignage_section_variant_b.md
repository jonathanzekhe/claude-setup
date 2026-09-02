---
name: project_vividflow_temoignage_section_variant_b
description: Section témoignage VividFlow — variante B (cinéma plein cadre + modal étude de cas) validée le 02/06/2026. En attente de la vidéo cliente.
metadata: 
  node_type: memory
  type: project
  originSessionId: 0d5e04f5-4b67-49a0-9a26-c4a289990f13
---

Nouvelle section "Témoignage client" à ajouter sur vividflow.co (index.html prod, dossier `site-mockups/`). Une seule cliente pour l'instant, traitée comme pièce maîtresse.

**Variante choisie : B — Cinéma plein cadre + modal.** Vidéo 16:9 immersive plein cadre, citation incrustée en bas, étoiles + nom/secteur. Le clic ouvre l'étude de cas en **modal/overlay** (pas de page dédiée, pas de dépliage inline). Jonathan a dit "incroyable".

Mockup des 3 variantes : `site-mockups/temoignages-variants.html` (live: vividflow.co/temoignages-variants.html). La fonction JS `caseStudyHTML()` génère le contenu étude de cas réutilisable.

**Bloqué : pas encore de vidéo.** Ne rien implémenter en prod tant que Jonathan ne revient pas. Il reviendra préciser : où héberger la vidéo (.mp4 / YouTube / Vimeo / Loom), le vrai contenu (nom cliente, secteur, citation, chiffres avant/après) et comment l'utiliser. Contenu actuel = placeholder `[ Nom cliente ]` / `[ Secteur ]`.

Structure étude de cas (modal) validée implicitement : Contexte → Ce qu'on a installé (agents) → Avant/Après → Résultats chiffrés → citation → CTA Réserver un appel. Voir [[feature_iterate_on_prod_not_mockup_variants]] et [[feature_never_deploy_prod_without_explicit_validation]].
