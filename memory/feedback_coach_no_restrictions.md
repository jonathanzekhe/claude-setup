---
name: Coach has zero restrictions
description: Jonathan as coach has no limitations anywhere in the app. No locked modules, no gating, no prerequisites.
type: feedback
---

Le coach n'a AUCUNE restriction dans l'app. Tout est accessible, tout est débloqué, tout est modifiable.

**Why:** Jonathan utilise la plateforme comme coach ET comme utilisateur. Il ne doit jamais être bloqué par les prérequis ou les gates qui sont destinés aux clients.

**How to apply:** Quand `me?.role === "coach"`, bypasser toutes les vérifications de verrouillage (vidéos prérequis, modules locked, etc.). Seuls les clients (role === "member") ont des restrictions.
