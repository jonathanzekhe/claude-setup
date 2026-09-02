---
name: Toujours fournir le lien cliquable vers la preview live
description: À chaque livraison de mockup, le lien Vercel preview doit apparaître en clair, cliquable, dès la première ligne utile de la réponse.
type: feedback
originSessionId: 430ab5a3-2c63-4d5a-9691-7fb2b8e37726
---
À chaque fois qu'un mockup est déployé (Brvndlab, VividFlow, ou autre), inclure l'URL Vercel preview comme **lien Markdown cliquable** (`[texte](url)` ou URL nue auto-linkée) au début de la réponse — pas enfoui dans un paragraphe technique, pas après les insights. Jonathan ouvre directement, pas le temps de chercher.

**Why:** Sa première action après "fini" est d'ouvrir le lien. Cacher le lien dans le texte ou ne donner que le chemin de fichier local lui fait perdre du temps. Il l'a explicitement demandé après la première livraison motion-mockups.

**How to apply:**
- Bloc dédié en tête de réponse : `**Preview live :** https://xxx.vercel.app`
- Si plusieurs URLs (preview + prod + dashboard), les lister toutes
- Toujours `open -a "Google Chrome"` en parallèle (cf. feedback Chrome)
- Pour les références de fichiers, garder le format `[file.tsx](path/file.tsx)` mais ne pas confondre fichiers locaux et URL preview
