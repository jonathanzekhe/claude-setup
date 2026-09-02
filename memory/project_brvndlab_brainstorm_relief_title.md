---
name: project_brvndlab_brainstorm_relief_title
description: "Home brainstorming Brvndlab — direction D3 Relief validée + titre \"Graisse\" scellé"
metadata: 
  node_type: memory
  type: project
  originSessionId: cfa37736-4b73-443e-a44a-79c8e0ddb2fd
---

Écran d'accueil du module **Brainstorming** (Brvndlab) — direction visuelle **D3 · Relief** validée par Jonathan (2026-06-29).

Layout scellé :
- 3 cartes flottantes en relief (tilt 3D ±16° au curseur, translateZ sur tuile/titre/CTA), cartes `224×300px`, tuile `80px`, gap `22px`.
- Les 3 formats : **Script vidéo** (#E89A4E orange), **Carousel** (#6E9BD1 bleu), **Story** (#A595E6 violet).
- Titre + cartes dans le **même flux vertical centré** (`flex-direction:column; gap:52px`) — surtout pas le titre en `position:absolute` (créait un écart énorme, rejeté).
- Thème clair/sombre supporté (toggle lune/soleil), défaut sombre.

Titre validé = variante **"Graisse"** : `On crée quoi` en poids 500 + `aujourd'hui` en poids 900, **monochrome** (couleur `--text`, plus aucun orange/jaune ni surlignage bleu — tous deux rejetés). Taille `clamp(34px,4.4vw,56px)`.

Source de la réplique exacte : `brvndlab-brainstorm-...vercel.app` (prototype HTML standalone). Vrai code app : [project_brvndlab_brand_os_central] → `brvndlab-app/src/app/(app)/brainstorming/page.tsx` (HOME_QUESTIONS + HOME_DOORS).

Mood board (mockups validés) : `~/Documents/Claude AI/brvndlab-mockups/d3-relief-final.html`. Explorateur 10 titres : `d3-relief-couleurs.html`.

Suite en cours : définir les écrans **après** le clic carte = l'**interview brainstorming** (états d'attente + copy), à valider avant build. Voir [feedback_brainstorm_start_from_existing] et [feedback_never_invent_features].
