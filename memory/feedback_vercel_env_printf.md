---
name: vercel env add → printf, pas echo
description: Push d'env vars Vercel via CLI : toujours utiliser printf, jamais echo (ajoute un \n dans la valeur).
type: feedback
originSessionId: 350b6a57-b622-435f-a833-486678499247
---
`echo "valeur" | vercel env add NAME production` capture la valeur AVEC le `\n` final.
Conséquence : la valeur côté runtime = `"valeur\n"` au lieu de `"valeur"`. Stripe, Clerk, et toute API qui valide strictement renvoient une erreur (ex: `No such price: 'price_xxx\n'`).

**Why :** vu en live le 2026-05-11 sur Brvndlab. Les 4 Price IDs Stripe (`STRIPE_PRICE_*`) poussés via `echo` ont tous échoué côté Checkout avec `No such price: 'price_xxx\n'`. Re-poussés via `printf` (sans newline) → tout marche.

**How to apply :**
- Toujours `printf "valeur" | vercel env add NAME production`
- Vérifier après push : `vercel env pull /tmp/x.env --environment=production --yes && grep NAME /tmp/x.env | xxd` — la valeur entre `"..."` doit se terminer exactement à `"`, pas avant un `0a` parasite.
- S'applique aussi à toute commande qui stream une valeur dans un système qui la stocke verbatim.
