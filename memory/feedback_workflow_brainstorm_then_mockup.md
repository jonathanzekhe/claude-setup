---
name: Workflow Jonathan, brainstorm puis mockup direct
description: Méthode de travail validée avec Jonathan, on brainstorme, on valide, puis on livre un mockup visuel. Jamais de réponse texte sans mockup quand c'est visuel.
type: feedback
---

Quand on bosse sur une feature ou un écran Brvndlab, le flow est toujours :
1. Brainstorm rapide ensemble (questions, options, choix)
2. Validation des choix par Jonathan
3. **Livraison directe d'un mockup HTML** dans `Brvndlab/brvndlab-app/public/`
4. Lien `file://` envoyé pour qu'il l'ouvre dans le navigateur

**Why:** Jonathan ne peut pas se projeter sur du texte ou des descriptions. Il a besoin de VOIR le rendu pour donner du feedback. Si on lui propose des ajustements en mots, il perd patience. Le mockup est l'unité de communication, pas la prose.

**How to apply:**
- Dès qu'on parle d'un écran, d'un composant, d'un layout, d'un design : la sortie attendue est un fichier HTML mockup, pas une explication.
- Ne jamais demander "tu valides cette direction ?" sans avoir un visuel à montrer en parallèle.
- Le brainstorm peut être en texte, mais la conclusion est toujours un mockup livré.
- Toujours envoyer le lien `file:///Users/businessmanagement/Documents/Claude%20AI/Brvndlab/brvndlab-app/public/[nom-fichier].html` pour qu'il l'ouvre.
- Suivre la règle CLAUDE.md du projet : passer par Gemini Design MCP (`create_frontend`, `modify_frontend`) avec le `design-system.md` complet, jamais coder le frontend à la main.
