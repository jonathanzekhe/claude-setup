---
name: project-brvndlab-acces-liens-morts-rail
description: "Liens morts du rail collaborateur (Pipeline, To do list) et Brand OS en consultation seule — corrigés et déployés le 27/08/2026, avec tests dérivés des sources"
metadata: 
  node_type: memory
  type: project
  originSessionId: 2e912521-910d-4e17-ac9a-8f2771374d97
  modified: 2026-08-29T04:23:49.490Z
---

Trois sources décident de ce qu'un collaborateur voit et peut ouvrir. Quand elles divergent, un lien s'affiche et ne mène nulle part :
- rail : `COLLABORATOR_*_ITEMS` dans `src/components/AppSidebar.tsx`
- garde client : `COLLABORATOR_ALLOWED_ROUTES` dans `src/hooks/useRouteGuard.ts`
- miroir serveur : `MODULES_PAR_ROLE` dans `convex/collaborators.ts`

Corrigé et déployé le 27/08/2026 (commit 850ccfb2) :
- **Pipeline** absent des deux tables pour les 6 rôles dont le rail le montre (monteur, clippeur, minimaker, graphiste, videographe, headofcontent). Constaté en live le 21/08 avec un compte collaborateur.
- **To do list** : `/todo` est une page de COMPTE (comme `/settings`), pas un module allouable. Ajouté à `alwaysAllowed`.
- **Brand OS en consultation seule** : règle produit de Jonathan. `requireWriteAccess` ne bloquait que si `readOnlyModules` contenait « brand-os », donc uniquement quand la case était cochée à la main — un collaborateur en mode édition pouvait le modifier. Verrou désormais INCONDITIONNEL et côté serveur. Le bouton d'édition reste visible dans l'UI (9 pages Brand OS) : chantier non fait, la donnée est protégée mais l'expérience est imparfaite.

Trois tests dans `tests/acces/` dérivent ces règles des sources au lieu de les recopier, donc zéro maintenance :
- `railVsGarde.test.ts` — tout lien du rail doit être ouvrable ; le client ne doit jamais accorder ce que le serveur refuse (le sens inverse ne casse rien, il ne bloque pas).
- `brandOsLectureSeule.test.ts` — le verrou existe, précède `readOnlyModules`, et toute mutation de `brandOs.ts` est gardée (`requireWriteAccess` pour le contenu, `requireCoach` pour le gabarit).
- `cloisonnementModules.test.ts` — étendu aux PAIRES de modules (66 cas) : un siège réel a plusieurs modules, et testé avec un seul le bug du 20/08 restait invisible.

Préexistants, non touchés : `tests/viralite.test.ts` (import mort après le renommage `/reseaux` → `/performances`) et le webhook Calendly de `routesSmoke`.

**Le compte robot E2E n'existe plus dans Clerk** (`audit.robot+brvndlab@vividflow.co`, supprimé avant le 27/08) : la vérification live décrite dans [[reference-e2e-robot-brvndlab]] est inopérante tant qu'il n'est pas recréé.

Voir [[feedback-brvndlab-chaine-affichage-unique-reseaux]] — même principe : une seule source d'affichage.
