---
name: Nomenclature "Intégrations" et non "Connexions"
description: Validé 2026-04-22. On parle toujours d'"Intégrations" dans Brvndlab, jamais de "Connexions" pour les outils tiers.
type: feedback
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
Dans toute l'interface Brvndlab, on utilise le mot **"Intégrations"** pour désigner les connexions vers des outils tiers (Stripe, Whop, YouTube, Instagram, TikTok, iClosed, Calendly, Notion, etc.).

**À bannir** :
- "Connexions" (ambiguïté avec connexion/login)
- "Connecter mon Stripe" (utiliser "Intégrer" ou "Lier")

**À utiliser** :
- "Intégrations" comme nom de section dans Settings
- "Intégrer Stripe" sur le CTA
- "Intégration connectée" / "Intégration non connectée" pour les statuts

**Why:** Jonathan a pointé que "Intégrations" est le terme standard en SaaS (Notion, Linear, Stripe, etc.) et évite la confusion avec "Connexion" qui peut aussi signifier "sign-in". Cohérence avec l'écosystème SaaS et clarté immédiate.

**How to apply :**
- Dans tous les mockups, sidebar Settings, labels de sections, textes d'aide.
- Dans le code existant : renommer le dossier `/settings/connexions` → `/settings/integrations` et tous les libellés associés.
- Dans la base mémoire, si une règle mentionne "Connexions" au sens tiers, la reformuler.
