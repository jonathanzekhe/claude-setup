---
name: URL publique des mockups Brvndlab (partageable collaborateurs)
description: Tous les mockups UX consolidés dans un dossier + déployés sur Vercel pour partage avec collaborateurs non-locaux.
type: reference
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
## Dossier local

`/Users/businessmanagement/Documents/Claude AI/brvndlab-mockups/`

Contient tous les mockups HTML (55+ fichiers) + `index.html` (menu par module) + `vercel.json` (config deploy).

## URL publique (Vercel)

**https://brvndlab-mockups.vercel.app**

- Index par module : `https://brvndlab-mockups.vercel.app/`
- Page directe : `https://brvndlab-mockups.vercel.app/brvndlab-smart-link-10videos` (clean URL, sans .html)
- Noindex activé (X-Robots-Tag: noindex, nofollow)
- Partageable à n'importe qui (pas de login Vercel requis)

## Lien CANONIQUE Home (2026-06-23, demandé par Jonathan)

**https://brvndlab-mockups.vercel.app/brvndlab-home** = LE lien fixe de la Home assistant-first. Itérer = mettre à jour `brvndlab-home.html` puis redeploy, JAMAIS créer un nouveau fichier/lien (Jonathan se perd sinon). Règle générale : un sujet = un fichier canonique = un lien stable qu'on rafraîchit. État actuel de brvndlab-home : Home "pure" (ambiance brainstorm sombre, juste greeting + barre au repos ; formats/chiffres sortent DANS la réponse, pas en décor). Voir [[project_brvndlab_assistant_first_direction]].

Note : `vercel.json` ne doit PAS contenir `"public": true` (schema invalide, fait échouer le deploy). cleanUrls actif → lien sans `.html`.

## Comment redéployer

Depuis le dossier `brvndlab-mockups/` :

```bash
vercel --prod --yes
```

Le projet est déjà linké au compte `jonathanzekhe-4288`. Chaque redeploy update `brvndlab-mockups.vercel.app`.

## À utiliser quand

- Jonathan demande un lien partageable à ses collaborateurs (monteurs, Miniamaker, Head of content, etc.)
- On ajoute une nouvelle page mockup → la copier dans le dossier + redeploy
- Jonathan veut montrer un mockup à quelqu'un hors de son Mac
