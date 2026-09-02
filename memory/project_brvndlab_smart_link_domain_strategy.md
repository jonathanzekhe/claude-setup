---
name: Stratégie de domaine Smart Links
description: Validé 2026-04-22. Smart Links namespacés par username par défaut. Option custom domain branded pour utilisateurs premium.
type: project
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
Pour éviter les collisions de slugs entre des milliers d'utilisateurs Brvndlab, les Smart Links sont gérés en 2 niveaux.

## Niveau 1 : par défaut (tous les plans)

Format avec **username en namespace** : `brvnd.co/@jonathan/pricing`

- Chaque utilisateur a son propre espace (`@username`)
- Zéro collision possible entre utilisateurs
- Garde la lisibilité du slug (`/pricing` au lieu de `/a7x2k`)
- L'username est choisi à l'onboarding, unique, modifiable

**Format alternatif** si pas de username défini : `brvnd.co/u/ab7x2k/pricing` (ID court + slug), mais l'username est le standard recommandé.

## Niveau 2 : Custom domain (plan Scale ou premium)

Format branded : `go.jonathanzekhe.com/pricing` OU `links.jonathanzekhe.com/pricing`

- L'utilisateur achète son propre sous-domaine ou utilise un domaine qu'il possède déjà
- Configuration via CNAME vers Brvndlab (DNS simple)
- Brvndlab génère et renouvelle automatiquement le SSL
- Tracking reste identique (webhook inchangé)
- Valeur ajoutée premium : look 100% branded, aucune mention Brvndlab visible

**Setup** :
1. L'utilisateur ajoute son domaine dans Intégrations ou Settings
2. Il configure un CNAME dans son DNS : `go.jonathanzekhe.com → brvnd-links.vercel.app`
3. Brvndlab détecte, valide, active le SSL automatiquement
4. Tous les Smart Links existants peuvent switcher sur le custom domain en 1 clic

## UI Smart Links

- Par défaut : afficher les liens avec `brvnd.co/@username/slug`
- Banner "Utiliser un domaine personnalisé" pour inciter à passer au premium
- Setting dédié pour configurer le custom domain
- Bouton "Switch sur mon domaine" sur chaque Smart Link existant si custom domain configuré

## Règles importantes

- Jamais de slug sans namespace (empêche les collisions)
- L'username est affiché dans le lien, donc choix important à l'onboarding (validation de disponibilité + suggestion de variantes)
- Le custom domain n'est pas obligatoire, c'est juste une option branding premium
