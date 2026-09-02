---
name: Radar Tendances retirée du MVP (2026-05-08)
description: Onglet Tendances supprimé de la nav Radar. Code backend (radarTrends, radarNiche, radarDiscovery) + composants (RadarNicheBandeau, AdjacentProfilesSection) conservés dormants. À ré-activer quand conditions remplies.
type: project
originSessionId: e37cd837-5455-4560-bcc5-81b6b082a9c8
---
Décision : retirer l'onglet "Tendances" du Radar pour l'MVP.

**Why** :
- Avec 6 refs/concurrents seulement, pas assez de masse pour patterns émergents
- Mécanique de discovery (featured channels + YT trending) trop fragile en V1 — featured channels API renvoie souvent vide, drift de niche possible
- Sur-construction : ~600 lignes de code (radarNiche.ts, radarDiscovery.ts, radarDiscoveryHelpers.ts, RadarNicheBandeau.tsx, AdjacentProfilesSection.tsx) pour un livrable qui ne livre pas de valeur visible
- Jonathan a explicitement préféré shipper sans plutôt qu'avec une feature complexe qui ne marche pas

**État du code (à 2026-05-08)** :
- ✅ Onglet "Tendances" retiré du subNav Radar
- ✅ Bloc `{subNav === "tendances" && ...}` supprimé de la page
- ✅ Composants `RadarNicheBandeau` + `AdjacentProfilesSection` non importés (mais fichiers conservés)
- ✅ Type `SubNav` réduit à "feed" | "liste" | "cartographie" | "favoris"
- ✅ Lien "Tendance liée" dans la modal d'étude vidéo retiré
- 🟡 Backend Convex conservé dormant : `radarTrends.ts`, `radarNiche.ts`, `radarDiscovery.ts`, `radarDiscoveryHelpers.ts`
- 🟡 Schema conservé : champs `country` + `youtubeCategoryId` sur `competitorTracking`, tables `radarNiche` + `adjacentProfiles`

**How to apply** (si on veut ré-activer plus tard) :
- Conditions à remplir AVANT de re-proposer la Tendances :
  1. Soit Jonathan a >20 refs/concurrents trackés (vraie masse)
  2. Soit on a trouvé un mécanisme de discovery éprouvé (pas YouTube featured channels qui retourne souvent rien)
- Pour réactiver : remettre l'onglet dans subNav + le type SubNav, ré-importer les composants, re-ajouter le bloc {subNav === "tendances" && ...}, ajouter Tendance liée dans la modal d'étude
- Ne pas re-proposer Tendances comme priorité tant que ces conditions ne sont pas remplies
