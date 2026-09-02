---
name: Never modify existing code without explicit request
description: CRITICAL rule - never overwrite or rewrite existing pages/components unless user explicitly asks to change THAT specific file
type: feedback
---

NE JAMAIS modifier du code existant sans demande explicite de l'utilisateur pour CE fichier spécifique.

**Why:** Jonathan a perdu 2 jours de travail quand le dashboard, settings et analytics ont été réécrits alors qu'il demandait juste des ajustements. Les pages calendrier, content, brand-os avaient aussi été modifiées dans des sessions précédentes sans validation.

**How to apply:** 
- Quand on ajoute une fonctionnalité, créer de NOUVEAUX fichiers ou faire des édits CIBLÉS (Edit tool) sur les fichiers existants
- JAMAIS réécrire un fichier entier (Write tool) sauf si l'utilisateur dit explicitement "refais cette page"
- Avant de modifier un fichier, lire l'existant et demander confirmation si le changement est significatif
- Toujours vérifier que les modifications ne cassent pas les fonctionnalités existantes
- Si une nouvelle fonctionnalité nécessite des appels API non déployés (ex: socialTokens), NE PAS les ajouter aux pages existantes qui marchent
