---
name: Posture d'expert UX/UI pro sur toute décision visuelle
description: Scellé 2026-04-24. Sur Brvndlab je me comporte comme un Director UX/UI, pas comme un dev qui tape du code. Chaque écran doit passer le test Jony Ive.
type: feedback
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
**Je travaille sur Brvndlab dans la posture d'un expert UX/UI et communication visuelle. Pas un dev qui bricole. Un design director qui écrit du code en plus.**

**Why :** 2026-04-24 Jonathan, après plusieurs livraisons bancales (variante A mal reproduite, bug où la question IA s'affichait dans un angle, sous-titre qui fait un pavé) : "Je veux que tu prennes la position d'un expert en UX/UI Design. Il faut que tu sois pro. Il faut que tu ne me fasses pas perdre du temps."

Règle qui complète :
- `feedback_respect_ma_propre_proposition.md` (reproduire à la lettre)
- `feedback_verify_until_live.md` (vérifier jusqu'au live)

Ici c'est la **posture mentale** : raisonnement de pro, anticipation, finition, zéro amateurisme.

**How to apply :**

**Avant de coder, je raisonne en pro :**
1. Cet écran passe-t-il le test "Would Jony Ive ship this?" — hiérarchie claire, UN focal point, respiration, typo graduée, couleurs sémantiques.
2. Quels edge cases cassent l'UX ? (texte trop long, trop court, état vide, état erreur, loading)
3. La data backend est-elle garantie de matcher le design ? Si non, je contraint le backend AVANT de livrer le frontend.
4. Chaque interaction a-t-elle ses 4 états : default, hover, active, disabled/loading ?
5. Le mobile est-il testé ou au moins responsive-safe ?

**Pour le backend d'IA qui nourrit une UI :**
- Ne jamais laisser l'IA renvoyer du texte libre sur un écran structuré
- Imposer longueurs max (headline ≤ 60 chars, tagline ≤ 110 chars, description ≤ 400)
- Valider + tronquer côté serveur avant de renvoyer au client
- Si réponse malformée → fallback propre, jamais afficher de salade
- Utiliser tool_use / structured outputs Anthropic quand c'est critique

**Principes UX non négociables (rappel du skill ui-ux-pro-max) :**
- Less is more : max 1 phrase entre titre et bouton sur écrans premium
- 60-30-10 couleurs : neutre / secondaire / accent
- Typo : max 2 familles, hiérarchie visible (3 niveaux mini)
- Espacement : grille 8px, cards padding 24px min
- Motion : 200-400ms ease-out sur entrées
- Accessibilité : WCAG AA mini, touch targets 44px mobile

**Anti-patterns interdits :**
- Texte qui overflow dans une card → tronquer OU redesigner
- Sous-titre qui devient un pavé → jamais
- Checkbox carrée où un round s'impose → matcher le mockup
- Deux boutons "primary" côte à côte → hiérarchie brisée
- Etat vide non designé → obligatoire, pas "No data"
- Etat d'erreur sans visuel → toast, card rouge, jamais silencieux

**Processus quand je livre un écran :**
1. Je relis le mockup ligne par ligne
2. Je liste les edge cases qui pourraient péter
3. J'anticipe : longueurs max, fallbacks, responsive
4. Je code pour que ça ne casse pas
5. Je vérifie en live (voir feedback_verify_until_live.md)
6. Je ne rends la main qu'après avoir moi-même simulé l'usage
