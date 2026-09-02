---
name: Smart Links · pattern d'URL scellé (8 mai 2026)
description: Domaine officiel brvndlab.co. Pattern par défaut brvndlab.co/{business-handle}/{slug}. Pas de @. Custom domain optionnel reste en place.
type: project
originSessionId: e37cd837-5455-4560-bcc5-81b6b082a9c8
---
Pattern d'URL final pour les Smart Links scellé le 8 mai 2026.

## Domaine

**`brvndlab.co`** (pas `brvnd.co` qui était l'ancien short domain prévu).

## Pattern par défaut

```
brvndlab.co/{business-handle}/{slug}
```

- `{business-handle}` = handle court défini par l'utilisateur à l'inscription. Auto-slugifié depuis le nom du business renseigné. Modifiable dans Settings.
- `{slug}` = slug auto-généré (`yt-comment-scaler-05mai-demo`)

**Pas de `@` devant le handle**. Slash propre, comme Vercel ou Linear.

## Exemples

- `brvndlab.co/jonathan/yt-comment-scaler-05mai-demo`
- `brvndlab.co/vividflow/ig-story-08mai-demo`
- `brvndlab.co/cohorte/news-mardi-pricing`

## Configuration du business handle

À l'inscription, l'utilisateur passe par une **étape dédiée** :
1. "Quel est le nom de ton business ?" → "VividFlow Brand Studio"
2. Brvndlab génère le handle auto : `vividflow` (slug propre, pas d'espaces, pas d'accents)
3. Affiche le preview : `brvndlab.co/vividflow/...`
4. L'utilisateur peut modifier le handle proposé tant qu'il n'a pas validé
5. **Une fois validé, le handle est SCELLÉ À VIE.** Plus modifiable.

**Pourquoi immuable** : un handle est un identifiant public. Tous les Smart Links qu'il a partagés (description vidéo YouTube, post Insta, bio, email) pointent sur ce handle. Si on permet le changement, les visiteurs cliquent sur un lien mort. Perte d'opportunités business directes.

Pattern iClosed-like : tu choisis ton namespace une fois, tu vis avec.

**Si l'utilisateur veut vraiment changer (cas exceptionnel)** : il faut passer par le support manuel + audit des risques. Pas un bouton "Modifier" libre dans l'UI.

## Custom domain (premium)

Reste en place tel quel (Phase 1 déjà livrée). Pattern :

```
go.{user-domain}/{slug}
```

Exemple : `go.jonathanzekhe.com/yt-comment-scaler-05mai-demo`

Pas de namespace business dans le custom domain (puisque le domaine est déjà unique à l'utilisateur). Slug uniquement.

## Comparaison

| Mode | Pattern | Quand |
|------|---------|-------|
| Brvndlab (default) | `brvndlab.co/{business-handle}/{slug}` | À l'inscription, par défaut |
| Custom domain (premium) | `go.{user-domain}/{slug}` | Quand l'utilisateur configure son DNS |

## Section domaine séparée de la liste des liens

Sur la page `/smart-links` principale (que l'utilisateur visite tous les jours), **NE PAS afficher** :
- Le handle business
- Le custom domain

Ces deux sections vivent dans une **page dédiée** : `/smart-links/domain` (ou équivalent). L'utilisateur la visite **une seule fois pour la configurer**, puis n'y revient quasiment plus.

Sur la page principale, un lien discret "Configurer mon domaine →" pointe vers cette page de config.

## Achat de domaine intégré (roadmap)

Sur la page `/smart-links/domain`, prévoir une troisième sous-section : **achat d'un nom de domaine** directement depuis Brvndlab (pattern Vercel Domains). L'utilisateur cherche `tonsite.com`, voit dispo + prix, achète, configuration auto.

Provider candidat : Vercel Domains API ou intégration registrar tiers.

## Pièges à éviter

- Ne pas confondre business handle et username Clerk (ce sont 2 choses différentes)
- Pas de `@` dans le pattern URL
- Le handle doit être unique à travers tout Brvndlab (vérification dispo)
- Routes système réservées : `app`, `admin`, `api`, `auth`, `r`, `_next`, `dashboard`, etc. (ne pas autoriser comme handle)
- **Handle SCELLÉ après validation initiale**. Pas de bouton "Modifier" libre dans l'UI. Cas exceptionnels gérés par support manuel.
- Section domaine séparée de la liste de liens. Page dédiée, pas mélangée.
