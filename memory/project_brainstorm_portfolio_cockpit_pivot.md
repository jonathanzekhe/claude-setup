---
name: project_brainstorm_portfolio_cockpit_pivot
description: "brainstorm-portfolio devient un micro-SaaS cockpit pour piloter TOUS les business de Jonathan+Thomas, pas juste du brainstorming"
metadata: 
  node_type: memory
  type: project
  originSessionId: 38a563a7-7de5-46a0-b538-86d73e5a8ad1
---

Le 2026-06-24, Jonathan a élargi [[project_brainstorm_portfolio_tool]] : ce n'est plus un carnet de brainstorming, c'est un **micro-SaaS de gestion multi-business** que Jonathan + Thomas ([[user_thomas_cto]]) utiliseront pour piloter TOUS leurs business (VividFlow, Brvndlab, futurs). Chaque business doit être entièrement répertorié. Mot d'ordre : « n'oublie jamais l'objectif » (le CA). Carte blanche, « aucune limite » de tokens/pensée/création.

**Direction validée par tribunal (4 angles + recherche web Notion/Linear/Sunsama/Tability) :**
- Garder le modèle git .md/.json, AUCUNE nouvelle base. Un module = un dossier à rôle ou un champ `_business.json`.
- Modules par business (plafond ~5) : Vue d'ensemble (état nommé + Objectif CA visible) · ICP/Substance « à qui on parle » · Notes · Brainstorming · Maquettes · To-do (livré).
- Home = cockpit cross-business calme (façon Sunsama/Oura, pas dashboard froid) : CA cumulé en tête + 1 carte/business (objectif CA, état en 1 phrase, prochaine action, ce qui bloque). Chaque écran répond à « c'est quoi mon prochain coup pour faire avancer le CA ? ».
- Lien substance → exécution → revenu (ICP → contenu/maquette → deal).
- Profils avec photo (Jonathan, Thomas) : réutiliser le pipeline avatar (`_avatars/users/<id>`, `/api/upload`, `AvatarImg`), stocker `avatar` dans AUTH_USERS + session, afficher header + commentaires.

**Garde-fous anti-bloat :** 1 vue par défaut/niveau, ≤5 modules, zéro KPI froid (un seul chiffre habillé), .md/.json seule vérité, règle « qu'est-ce que je supprime ? ». NE PAS construire : notifications/feed, analytics multi-business, rôles/permissions, tags/filtres avancés, kanban drag-drop, multi-workspace.

**Séquençage :** Phase 1 = Objectif CA + état par business, bandeau Vue d'ensemble en tête de page projet, profils photo. Phase 2 = cockpit business unifié + home cross-business. Phase 3 = polish (git log history, durcissement API). Voir [[feedback_brainstorm_portfolio_claude_notes_invite_retour]] et le style épuré [[feedback_zero_redondance]].
