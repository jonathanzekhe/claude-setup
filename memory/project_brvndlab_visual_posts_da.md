---
name: Feature posts visuels avec DA authentique
description: Vision Jonathan 2026-04-21 — integration generation visuelle (Gemini/Canva/image IA) dans la creation de contenu Brvndlab, avec accumulation progressive d'une Direction Artistique propre a chaque client.
type: project
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
Feature stratégique imaginée le 21 avril 2026 par Jonathan : intégrer un moteur de génération visuelle IA (Gemini cité explicitement, Canva MCP déjà connecté) dans la section Création de contenu pour produire des posts graphiques LinkedIn/Instagram avec une esthétique premium.

Principe clé : la Direction Artistique (DA) se nourrit au fur et à mesure. Au début le client upload ou choisit quelques références. Puis à chaque post validé, la DA s'enrichit. Après N posts, l'IA a appris le style unique du client et peut produire des visuels 100% alignés sur sa marque — pas des templates génériques.

**Why:** Différencier Brvndlab des outils génériques type Canva ou Buffer. Le visuel est le dernier maillon manquant dans le parcours idée → script → post. Aujourd'hui le client doit sortir de Brvndlab pour créer ses visuels, ce qui casse le flow. Une DA propre et évolutive = rétention forte + effet réseau (plus le client reste, plus son style est fin).

**How to apply:**
- Phase 1 (MVP visuel) : connexion à Gemini ou intégration via Canva MCP (déjà disponible). Le client choisit 3-5 références visuelles en onboarding.
- Phase 2 (DA fondée) : génération de templates basés sur ses références, déclinables par format (carousel LinkedIn, story Insta, post simple).
- Phase 3 (DA vivante) : chaque post publié/validé enrichit un "DA vault" qui devient la source de vérité visuelle du client.
- Placement produit : dans `/content/new/*` après validation du script, étape "visuel" avec preview + variations + edit.
- Cohérence Brand OS : la DA s'appuie sur le module "Style" du Brand OS (module 12).
- Modèles à tester : Gemini 2.5 image, Nano Banana, Flux, Ideogram (pour le texte dans l'image), Canva AI.
- MCP Canva déjà connecté — possible de commencer par là avec des brand kits dynamiques par client.

**Phasing recommandé:** Après la section Calendrier (validée 15 avril), c'est la prochaine grosse feature différenciante. Ne pas confondre avec le MCP Gemini Design qui est pour générer le frontend de l'app, pas les visuels client.
