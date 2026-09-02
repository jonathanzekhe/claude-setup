---
name: Heatmap d'usage clients (post-dev)
description: Installer une heatmap après finalisation du dev pour voir où les clients consomment le plus la solution. Outil interne d'optimisation produit.
type: project
originSessionId: e37cd837-5455-4560-bcc5-81b6b082a9c8
---
Installer une heatmap d'usage après la finalisation du dev MVP.

**Objectif :** voir la chaleur d'usage par module / par bouton / par flow. Identifier où les utilisateurs cliquent le plus, où ils stagnent, où ils abandonnent.

**Why:** Aujourd'hui on n'a aucune visibilité sur l'usage réel. Le Client Intel V2 capture des events mais pas avec la granularité d'une heatmap. Une heatmap permet de voir d'un coup d'œil "ah, personne n'utilise le module X, on peut le simplifier" ou "tout le monde stagne sur l'étape Y, problème UX là".

**How to apply:**
- Solution candidate : Hotjar, Microsoft Clarity (gratuit, RGPD-compliant), PostHog session recording.
- À installer SEULEMENT après le MVP complet (priorité basse jusque-là).
- Anonymisé conformément RGPD (UK + EU GDPR sur VividFlow LTD).
- Visible uniquement à Jonathan (Founder access) — feature interne, pas exposée aux users.
- Liaison potentielle avec Mémoire dorée (data agrégée pour décisions produit).
