---
name: schmid-template-strict
description: "Les decks projection client VividFlow se dupliquent depuis Schmid Signature en TEMPLATE STRICT (remplissage de variables), jamais en inspiration libre"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 953ca4f5-4db3-4bb3-9158-0a87f30f8a96
---

Pour tout nouveau deck de projection client VividFlow (vividflow.co/<slug>), Schmid Signature est un TEMPLATE STRICT : même structure, mêmes pages, mêmes CTA, mêmes blocs, même mécanique. On remplace uniquement les variables (nom, prénom du décideur, métiers, tâches, icônes liées aux labels).

**Why:** Le 2026-06-12, première version CC Concept construite en "inspiration libre" (écrans créatifs ajoutés, conclusion réinventée) rejetée intégralement par Jonathan. Le template est scellé, la valeur est dans la personnalisation des variables.

**How to apply:**
- Cloner les 8 fichiers Schmid (`cover, -2..-5, -7, -8, -booking`) avec les mêmes noms suffixés, créer un `deck-<client>.js` avec sa liste PAGES (deck.js Schmid intouchable).
- P2 suit la structure "Entre [activité 1], [activité 2] et [activité 3], votre activité demande de garder une vision claire sur [enjeu concret]". Jamais une bio d'entreprise.
- Catégorie P5 : nommer le type d'entreprise précisément sans se tromper ("entreprises de services techniques"). Interdit : "entreprises comme X", niche trop réductrice, ou "entreprises de service" seul.
- Vérifier par `diff` contre les fichiers Schmid : seules les variables doivent différer.
- URL finale : https://vividflow.co/<slug> (deploy prod du projet site-mockups), jamais d'autre domaine.
