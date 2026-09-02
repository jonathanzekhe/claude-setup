---
name: Pages légales (confidentialité, CGU, mentions légales)
description: Roadmap - pages légales à placer sous la page d'accueil / sign-in (privacy policy, CGU, mentions légales)
type: project
---

Ajouter les pages légales accessibles depuis la homepage (sous le bouton "Se connecter") :
- Politique de confidentialité (privacy policy)
- Conditions générales d'utilisation (CGU)
- Mentions légales

**Why:** Requis pour la review Meta (Instagram API) et pour tout SaaS B2B sérieux. Jonathan l'a mentionné dans le contexte auth (memory `project_brvndlab_auth.md`).

**How to apply:** Créer les pages dans `src/app/(legal)/` hors du route group `(app)` (pas de sidebar). Liens en footer de la homepage. Copy à rédiger avec Jonathan ou à générer puis valider.
