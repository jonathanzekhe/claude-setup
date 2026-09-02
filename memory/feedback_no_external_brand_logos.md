---
name: Pas de logos officiels de plateformes externes dans l'UI
description: Ne jamais afficher les logos officiels Instagram/YouTube/TikTok/etc. dans des éléments dynamiques. Rester réaliste, on ne peut pas connaître le logo si l'utilisateur tape le nom librement.
type: feedback
originSessionId: e37cd837-5455-4560-bcc5-81b6b082a9c8
---
Ne jamais afficher les logos officiels Instagram, YouTube, TikTok, LinkedIn, etc. dans des éléments dynamiques.

**Why:** Brvndlab détecte la plateforme depuis du texte libre tapé par l'utilisateur. Donc on a le NOM mais pas le LOGO. Mettre un logo officiel revient à inventer une donnée qu'on n'a pas (et c'est aussi un risque de propriété intellectuelle). Jonathan a explicitement signalé : "comment il peut avoir le logo d'Instagram, je suis curieux comment il peut savoir ?"

**How to apply:**
- À la place d'un logo officiel, utiliser un disque coloré avec l'initiale ou un dégradé neutre.
- Ou encore plus simple : pas de visuel à gauche, juste le nom en typo bold.
- **Exception OAuth connecté** : si la plateforme est branchée via OAuth officiel côté Brvndlab (YouTube, Instagram, TikTok via `youtubeTokens`/`instagramTokens`/`tiktokTokens`), le logo officiel devient OK. On a une vraie connexion validée par le provider, donc afficher le logo n'invente rien.
- **Exception Radar Liste (2026-05-14)** : Jonathan a demandé explicitement les vrais logos officiels colorés (Instagram gradient, YouTube rouge, TikTok cyan/magenta) dans la table Radar/Liste. Le composant `PlatformGlyph` dans `src/app/(app)/radar/page.tsx` rend les vrais logos officiels. C'est validé pour cette surface (info reconnaissable en un coup d'œil dans une table dense). Les SVG monochromes "stylisés" étaient jugés "bizarres".
- Newsletter : pas un réseau, utiliser une icône email générique (enveloppe Lucide Mail).
- Plateformes non-connectées (LinkedIn, X tant que pas d'OAuth) : pas de logo, juste initiales ou icône neutre.
- Règle générale : connexion officielle OU demande explicite Jonathan = logo OK. Détection inférée / typée à la main par défaut = pas de logo.
