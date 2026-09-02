---
name: project_brainstorm_portfolio_tool
description: "Outil perso \"carnet de projets\" sur Vercel — mood board multi-business d'idées et mockups, source de vérité en git, bouton Valider/Retenir qui commit."
metadata: 
  node_type: memory
  type: project
  originSessionId: 38a563a7-7de5-46a0-b538-86d73e5a8ad1
---

**brainstorm-portfolio** = mood board perso de Jonathan, utilisé au quotidien pour brainstormer sur tous ses sujets (pas que Brvndlab).

- URL prod : https://brainstorm-portfolio.vercel.app (scope Vercel `jonathanzekhe-4288s-projects`).
- Repo : `~/dev/brainstorm-portfolio` (hors iCloud) + GitHub privé `jonathanzekhe/brainstorm-portfolio`. Next.js 15 App Router, Tailwind, déploiement CLI `vercel deploy --prod` (pas d'auto-deploy GitHub).
- **Source de vérité = les fichiers .md du repo** (esprit Obsidian, versionné). Le Vercel n'est qu'une vitrine qui lit le repo via l'API GitHub au runtime en prod (FS en local).
- **Hiérarchie 3 niveaux** : Business (Brvndlab, VividFlow…) → Dossier/sous-projet (ex. "Home — refonte") → contenu. Tout vit dans un dossier.
- Dans un dossier : onglets **Idées / Mockups / Corbeille**. La corbeille est un statut, jamais une suppression.
- **Flow mockup** (sa façon de bosser) : je propose 3 variantes A/B/C plein écran, il clique **Retenir A** → choix atomique : A=chosen+note validated, B&C→corbeille (récupérables via Rouvrir). Le clic commit dans git via `/api/update` (lib/persist.ts) → je relis exactement sa décision scellée.
- Esthétique : **papier** (fond crème #fbfaf6, encre, filets fins, ombres douces, serif Fraunces, accent terracotta sourd). Pas de dark SaaS, pas de hashtags.
- **Création depuis le site** (v2) : boutons « + Nouvelle idée / Nouveau dossier / Nouveau projet » via `/api/create` (écrit un .md ou _folder/_business.json). Plus besoin d'éditer les fichiers à la main.
- **DA projet** (v3) : chaque projet a une photo de profil (upload, réduite à 256px côté client, stockée sous content/_avatars, servie au runtime par `/api/img`), ou un emoji, ou une initiale colorée. Description et couleur éditables via panneau « Éditer » (`/api/meta` patch _business.json). Icônes colorées : idée = ampoule ambre, maquette = écran bleuté. Palette dans `lib/theme.ts`.
- **Archivage** (v3) : projets et dossiers archivables (statut `archived`, sections « archivés » avec Restaurer). Suppression douce, rien n'est perdu. Pas de hard-delete dans l'UI.
- **Motion** : inclinaison 3D douce au survol des cartes (`components/Tilt.tsx`) + apparition en cascade. Toasts de confirmation.
- **Règle copy** : zéro tiret cadratin nulle part (UI + contenu + réponses).
- Routes API : update, create, meta, upload, img. Projet test « brdv » présent dans le repo (créé par Jonathan), archivable.
- Suivi : avancement par projet (validés / en cours) sur la home + fil « Repris récemment ». Couleur olive `valid` distincte de l'accent terracotta.
- Langage volontairement simple/boomer : « Mes projets », « Maquettes » (pas « mockups »), « Rechercher », dates lisibles (« 22 juin », « hier »). Polish 2026 : toasts de confirmation, skeletons de chargement, onglets en pilule, focus clavier, icônes idée/maquette.
- Deux tribunaux passés le 2026-06-24 (correction + UX/modernité). Corrigés : validation serveur des patchs, anti-double-clic, desync onglet/aperçu, lien mort vers maquette routé par type, dédupe corbeille, retry 409.
- **Section Idées riche (v4)** : une idée est modifiable dans l'app (composant IdeaEditor) : corps éditable, couleur, insertion d'images (/api/attach, downscale 1280, servies par /api/img depuis content/_attachments) et de vidéos (embed YouTube/Vimeo/Loom dans le rendu markdown). Commentaires « Mots pour Claude » stockés dans le frontmatter `comments` du .md (je les relis et j'agis dessus).
- **Bouton IA = Claude Sonnet** (`claude-sonnet-4-6`, SDK @anthropic-ai/sdk) via `/api/assist` : 3 modes Clarifier/Développer/Résumer, panneau Remplacer/Ajouter/Ignorer. **Nécessite `ANTHROPIC_API_KEY` dans Vercel** ; sans clé l'API renvoie 503 proprement (bouton inactif).
- **Suppression définitive** (v4) : `/api/delete` récursif (projet entier, dossier, ou idée) avec confirmation en 2 temps (DeleteButton). Distinct de l'archivage. Nettoie les dossiers vides en local.
- **Dette ouverte (importante)** : toutes les routes d'écriture (`/api/update`, `/api/create`, `/api/meta`, `/api/upload`, `/api/attach`, `/api/delete`) n'ont aucune auth ; l'URL Vercel étant publique, n'importe qui qui tombe dessus peut créer/modifier/uploader/**supprimer**. Avec le delete c'est plus sensible. À fermer (protection Vercel mot de passe, ou secret partagé) quand Jonathan le décide. Voir [[feedback_brvndlab_repo_path_and_git_rules]].
