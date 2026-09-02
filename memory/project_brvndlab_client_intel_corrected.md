---
name: Client Intel = analyse comportementale pour retention, PAS pour upsell
description: Correction 2026-04-24. Client Intel n'est PAS un outil de sales recommendations. C'est un outil d'analyse comportementale user pour améliorer le produit et augmenter la LTV.
type: project
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
## Correction de direction

**Client Intel n'est PAS :**
- ❌ Un moteur de recommandations d'upsell (consulting 1-1, upsell tier, mastermind, etc.)
- ❌ Un outil de sales qui pousse des actions commerciales à Jonathan
- ❌ Un CRM pour orchestrer des offres premium

**Client Intel EST :**
- ✅ Un outil d'**analyse comportementale par user**
- ✅ Un détecteur de **blocages et frictions** dans l'usage du produit
- ✅ Un radar de **besoins non couverts** (features manquantes détectées par les searches, les questions IA, les actions abandonnées)
- ✅ Un moniteur de **santé d'engagement** par user
- ✅ Un signal de **gaps produit** à combler pour améliorer la rétention

## Pourquoi cette direction

Rappel de la stratégie Brvndlab (memory existante `project_brvndlab_retention_strategy.md`) :

> "Le vrai jeu n'est pas d'upseller les users, c'est de les garder si longtemps qu'ils deviennent très rentables au prix SaaS de base."

Jonathan ne vend pas de consulting, pas de mastermind. Il veut juste **garder ses users longtemps** (1, 2, 5 ans). Plus ils restent, plus la LTV grandit mécaniquement.

Pour ça, il faut :
1. **Détecter les blocages** pour les débloquer (tutoriels, support, features)
2. **Détecter les besoins** pour améliorer le produit
3. **Détecter les désengagements** pour relancer (aide, pas vente)
4. **Comprendre les comportements** pour orienter le roadmap produit

## Structure Client Intel corrigée

**Banner IA (top) :**
Surfacer des insights produit, pas des actions commerciales.
- "5 users bloqués sur la feature X"
- "3 feature requests récurrentes détectées"
- "2 users en chute d'engagement"

**KPIs :**
- Users très engagés
- Users en baisse d'activité
- Users bloqués (friction active)
- Feature gaps détectés
- Taux d'activation mensuel

**Filtres (par comportement) :**
- Engagement : très actif / actif / en baisse / dormant
- État : bloqué / en friction / fluide
- Modules utilisés
- Complétion Brand OS
- Signal : feature request / friction / désengagement

**Fiche user (tabs) :**
1. Santé & engagement (score, trend, status)
2. Usage par module (Brand OS %, Contenu, Research, etc.)
3. Blocages & frictions (où il coince)
4. Besoins identifiés (ce qu'il cherche et qu'on n'a pas)
5. Activité (chronologique)
6. Profil
7. Notes privées Jonathan

**Actions disponibles pour Jonathan :**
- Envoyer une ressource d'aide (pas de vente)
- Planifier un call de support (pas de pitch)
- Ajouter le besoin au backlog produit
- Créer un tutoriel pour ce pattern
- Marquer comme "gap produit"

## Ce qu'on supprime

- Onglet "Actions IA" avec recos consulting/upsell/affiliate/mastermind
- Toute reco avec CTA "Envoyer pitch" ou "Générer template"
- Maths de gains potentiels ("Proposez coaching 1200 €")
- Badge "Prêt pour consulting", "Prêt pour Founder", etc.

## Ce qu'on garde du v2

- Structure sidebar + layout
- Table avec filtres
- Drawer fiche
- Affiliation tab (si user est aussi affilié, factuel, pas commercial)
- Notes privées
- Badge "Privé vous seul"

## Répétition importante

**Les patterns agrégés** (vue macro sur tout le user base : "47% des users niche Sport cherchent du closing DM") appartiennent à **Mémoire dorée**, pas à Client Intel.

**Les patterns individuels** (ce user spécifique cherche, bloque, consomme) appartiennent à **Client Intel**.

Les deux partagent les mêmes données backend mais servent deux usages distincts.
