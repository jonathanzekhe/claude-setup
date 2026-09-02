---
name: Onboarding simplifié = post-paiement automation
description: Validé 2026-04-23. Suppression du gros questionnaire d'onboarding. Flow simple post-paiement Stripe : email + accès direct au dashboard.
type: project
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
## Décision

**Le gros onboarding questionnaire (23 questions, 5 phases) est OBSOLÈTE.**

Brvndlab est un SaaS pur. Les users arrivent par le contenu Jonathan (attribution déjà trackée via Smart Links), paient via Stripe, puis accèdent directement à l'app.

## Flow simplifié post-paiement

1. **Stripe checkout complété** → webhook fire
2. **Trigger URL Brvndlab** reçoit le webhook (URL à mettre dans la config Stripe)
3. **Automation backend** :
   - Création compte Clerk
   - Email de bienvenue envoyé automatiquement (credentials, lien d'accès)
   - Attribution source (quel Smart Link les a amenés) déjà tracée depuis avant le paiement
4. **Premier login** → direct au dashboard principal, pas de questionnaire

## Ce qui disparaît

- Questionnaire 23 questions
- Écran "On est prêt" avec auto-redirect
- Multi-step thème noir luxe
- Phase de setup manuelle par l'user

## Ce qui reste ou à créer

- Email de bienvenue automatique (template à designer)
- Éventuellement : page "Paiement confirmé" après redirect Stripe (facultative, courte)
- Dashboard principal avec **empty states** qui guident la première action (pas de questionnaire forcé, mais des CTA clairs : "Commencez par remplir votre Brand OS")

## Trigger technique (pour l'implémentation)

Le trigger URL = endpoint webhook Brvndlab (ex: `api.brvndlab.com/webhooks/stripe/payment-success`). Stripe y envoie l'event `checkout.session.completed`. L'endpoint :
1. Crée le compte user
2. Envoie l'email de bienvenue (via Resend / SendGrid)
3. Log la conversion dans Brvndlab tracking (attribution Smart Link)

## Notes UX futures

Si besoin d'améliorer plus tard la rétention J+1 :
- Checklist "Premiers pas" dans le dashboard (upload photo, connecter 1 canal social, créer premier contenu)
- Tour guidé ultra-court (3-4 étapes max)

Ces ajouts uniquement si la data montre que des users churn avant d'utiliser vraiment l'app.
