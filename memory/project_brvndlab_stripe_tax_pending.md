---
name: Stripe automatic_tax désactivé (TODO réactiver)
description: La route /api/checkout/subscription a `automatic_tax` désactivé en attendant que l'adresse de siège VividFlow soit configurée dans Stripe Tax.
type: project
originSessionId: 350b6a57-b622-435f-a833-486678499247
---
`src/app/api/checkout/subscription/route.ts` : la ligne `params.set("automatic_tax[enabled]", "true")` a été commentée le 2026-05-11 parce qu'en mode live Stripe refusait toutes les sessions avec : "You must have a valid head office address to enable automatic tax calculation in live mode."

**Why :** sans adresse de siège configurée dans Stripe Tax (dashboard.stripe.com/settings/tax), Stripe rejette tout `automatic_tax[enabled]=true` en live. Brvndlab étant un SaaS B2B FR/UK avec TVA, cette feature reste importante à terme (reverse-charge intra-UE).

**How to apply :**
- Une fois que Jonathan configure l'adresse VividFlow LTD dans Stripe Tax settings, retirer le TODO et remettre la ligne `params.set("automatic_tax[enabled]", "true")` dans la route.
- Avant de remettre : tester via `curl -u $STRIPE_SECRET_KEY_LIVE: https://api.stripe.com/v1/checkout/sessions --data-urlencode "automatic_tax[enabled]=true" ...` qu'aucune erreur n'est levée.
- Tant que désactivé : pas de calcul de TVA automatique côté Stripe. Acceptable en bootstrap, à revoir avant scale EU.
