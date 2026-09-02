---
name: Brand OS = source de vérité centrale du SaaS
description: Principe architectural fondamental — le Brand OS alimente TOUS les autres modules Brvndlab et ne doit jamais être traité comme une feature isolée
type: project
---

Le Brand OS est le **nerf de la guerre** de Brvndlab et du coaching de Jonathan. C'est la source unique de vérité que TOUT autre module du SaaS doit consommer.

**Why:** Jonathan a explicitement validé ce principe le 2026-04-07 après avoir validé la refonte complète du Brand OS (9 sections : Story, Mission, Audience, Message central et primaire [fusion problématiques+offre], Voix, Personnalité, Style de communication, Valeurs, Personas). Sa phrase exacte : "tout doit vraiment être le nerf de la guerre du contenu, tout ce qu'on fait vraiment tout le temps... ça, c'est vraiment le nerf de la guerre de mon accompagnement : le Brand OS". Sans cette coordination, le SaaS devient une collection d'outils déconnectés au lieu d'un système intégré qui matérialise son coaching.

**How to apply:** À chaque fois qu'on conçoit ou modifie une feature dans Brvndlab, se demander d'abord "comment cette feature consomme le Brand OS ?". Spécifiquement :

- **Création de contenu** (scripts, hooks, posts, brainstorms) : tous les prompts IA doivent injecter le Brand OS complet (Audience, Message, Voix, Personnalité, Style). Sans Brand OS rempli → pas de génération possible.
- **Market Radar / Research concurrents** : doit afficher les mêmes 3 concurrents définis dans Message central section 04, pas une liste générique.
- **Personas auto-générés** : régénération en temps réel à partir d'Audience + Problématiques + Offre + Valeurs.
- **Calendrier / planification** : angles de contenu = sub-problèmes générés (cold/warm/hot × activité/investissement) dans le Message.
- **Analytics** : taggage des contenus par sub-problème adressé pour mesurer quel niveau de conscience performe.
- **Onboarding** : forcer le remplissage minimum du Brand OS (au moins Audience + Message) avant de débloquer les autres sections.

Le Brand OS structuré en 9 sections est validé visuellement, avec verrouillage progressif (chaque section débloque la suivante) et vidéos modules pré-requises pour la section Message central. Voir mockups dans Brvndlab/brvndlab-app/public/mockup-brand-os*.html.
