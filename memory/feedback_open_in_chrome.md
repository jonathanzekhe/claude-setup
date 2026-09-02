---
name: Toujours ouvrir les liens dans Chrome jamais Safari
description: Pour toute commande `open` d'un fichier HTML ou URL pendant une session, utiliser Google Chrome explicitement. Safari interdit.
type: feedback
originSessionId: 430ab5a3-2c63-4d5a-9691-7fb2b8e37726
---
Toujours utiliser `open -a "Google Chrome" <fichier-ou-url>` pour ouvrir un mockup, une preview Vercel ou un site quelconque. Jamais `open <fichier>` seul (qui lance Safari par défaut sur le Mac de Jonathan).

**Why:** Jonathan utilise Chrome comme navigateur principal (devtools, extensions, sessions, sync). Safari = environnement parallèle qu'il ne consulte pas — un mockup ouvert dans Safari ne lui sert à rien.

**How to apply:** Dès qu'on doit ouvrir un fichier HTML local, une URL Vercel preview, un dashboard ou un screenshot rendu, préfixer `open -a "Google Chrome"`. Idem pour `xdg-open` ou équivalents si la situation se présente. Si Chrome refuse une URL `file://`, démarrer un mini serveur local plutôt que retomber sur Safari.
