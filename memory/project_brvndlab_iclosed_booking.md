---
name: Booking de l'appel de clarté via iClosed
description: État actuel : les appels de clarté Brvndlab sont bookés via iClosed. À terme, possible intégration directe dans Brvndlab avec création auto Google Meet et sync calendrier.
type: project
---

**État actuel :** Les appels de clarté Brvndlab sont réservés via iClosed (outil externe utilisé par Jonathan pour gérer ses appels de vente / clarté). À l'écran fin de l'onboarding, le bouton "Réserver mon appel de clarté" doit pointer vers iClosed dans un premier temps.

**Question ouverte :** Jonathan se demande si on peut intégrer le booking directement dans Brvndlab avec création automatique d'un Google Meet + sync avec le calendrier du client (Apple, Google, Outlook).

**Why:** Jonathan veut une expérience client fluide et entièrement encapsulée dans Brvndlab plutôt que de rediriger vers un outil externe à la fin de l'onboarding. C'est un point d'intégration produit important pour le ressenti premium.

**How to apply:**
- Pour le MVP, garder le redirect vers iClosed (la valeur ajoutée de iClosed pour les appels de vente/clarté est forte : recording, follow-up, etc.)
- Vérifier si iClosed propose un embed widget pour intégrer le booking directement dans Brvndlab
- Alternative à long terme : Cal.com (open source, embed gratuit, auto Google Meet, sync Apple/Google/Outlook) ou Calendly embed
- Option custom (Google Calendar API + Microsoft Graph + CalDAV Apple) à éviter pour le MVP, beaucoup de travail
