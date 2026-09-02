---
name: Prompts image-gen — verrous obligatoires
description: Règles structurelles pour prompts image-to-image VividFlow (préserve couleurs/cadrage)
type: feedback
originSessionId: 5b16ae01-2d64-4c7a-b0bb-48196b427279
---
Pour tout prompt image-to-image en image-gen (Gemini/ChatGPT/etc.) basé sur une réf fournie par Jonathan, TOUJOURS inclure ces verrous dans CHAQUE prompt (chaque appel est sans mémoire) :

1. **Préservation totale des couleurs** : *"Conserve à l'identique TOUS les éléments colorimétriques de la référence : peau, cheveux, vêtements, accessoires, couleur de fond. Ne modifie QUE la pose, l'expression, l'angle et le cadrage."*

2. **Cadrage protégé** (anti gros-plan) : *"Personnage visible depuis les hanches jusqu'au haut de la tête, centré, avec de l'air autour. La tête occupe environ 15% de la hauteur. PAS de plan rapproché sur le visage. Angle neutre à hauteur de poitrine."*

3. **Casquette/capuche bridée** (si applicable) : *"reste à sa taille naturelle et ne masque jamais les yeux"* — sinon l'IA fait des capots de moine qui éclipsent le visage.

**Why:** Sans verrous explicites, l'image-gen (1) re-colorise tout, (2) tombe par défaut sur portrait rapproché LinkedIn-style, (3) exagère les couvre-chefs. Vérifié sur ~15 itérations Kenzo/Mei/Zulu.

**How to apply:** Jonathan envoie 1 prompt par image (pas de template à compléter côté lui). Donc chaque prompt doit être autonome avec les 3 verrous baked-in + la personnalité spécifique à l'agent en milieu de prompt.
