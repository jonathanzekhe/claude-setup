---
name: Mémoire dorée - Agents IA concrets + Plan de release stratégique
description: Scellé 2026-04-24. Les 4 agents de Mémoire dorée ont une fonction technique précise. Plan : 3-6 mois stealth data collection puis release publique comme feature premium cerise sur le gâteau.
type: project
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
## Les 4 agents IA de L'Oracle (fonctions concrètes)

**Chaque agent doit être un vrai worker IA backend, pas du front-end décoratif.**

### Agent Scout (découverte)
- **Rôle** : détecter les nouveaux acteurs et niches qui émergent
- **Tech** : scrape continu YouTube/Instagram/TikTok/LinkedIn via Apify + IA de détection de patterns "newcomer rising fast" (growth curve, follower acceleration, keyword clustering)
- **Click action** : liste triée des découvertes des 7 derniers jours (nouveaux acteurs prometteurs + niches qui prennent forme), sortable par vélocité/potentiel

### Agent Stratège (recommandations personnalisées)
- **Rôle** : proposer 3-5 actions prioritaires pour Jonathan spécifiquement
- **Tech** : cross-reference Mémoire dorée + Brand OS Jonathan + capacités Brvndlab via Opus 4.6 (raisonnement multi-facteurs)
- **Click action** : action board du moment avec actions ranked par impact/effort

### Agent Historien (archive + comparaisons)
- **Rôle** : recontextualiser avec tout l'historique depuis janvier 2026
- **Tech** : accès base de données complète + IA de diff/comparaison temporelle
- **Click action** : timeline view avec sliders temporels (30j / 6 mois / 1 an), comparaison côte à côte, evolution graphs

### Agent Veilleur (alertes temps réel)
- **Rôle** : détecter les signaux critiques qui franchissent des seuils
- **Tech** : cron jobs Convex + seuils configurables + notifications push + email
- **Click action** : centre d'alertes actives avec configuration des seuils et historique des alertes déclenchées

## Autres composants techniques requis

- **L'Oracle search** : Opus 4.6 avec toute Mémoire dorée en contexte (embeddings vectoriels pour la recherche sémantique)
- **Rapports complets** : template standardisé généré par Opus + export PDF via serverless function
- **Ranking Top niches** : query agrégée temps réel sur table memoireDoree
- **Autocomplete** : suggestions basées sur queries passées + queries populaires
- **Exports** : PDF / JSON / CSV via serverless

## Stack technique nécessaire

1. **Pipeline scraping** : Apify pour YouTube/IG/TT/LinkedIn
2. **Enrichissement IA** : Opus (analyse stratégique) + Sonnet (qualification) + Haiku (formatage)
3. **Indexation vectorielle** : embeddings pour recherche sémantique
4. **Cron jobs** : Convex scheduled functions pour alertes et monitoring
5. **Generation PDF** : serverless (Resend / Puppeteer / etc.)

## PLAN DE RELEASE STRATÉGIQUE

**Validé 2026-04-24.** Jonathan va faire **3 à 6 mois de stealth data collection** avant de rendre Mémoire dorée accessible.

### Phase 1 (3-6 mois) : Stealth mode
- Mémoire dorée TRACK tout en backend mais accessible uniquement à Jonathan
- Jonathan utilise la data pour orienter Brvndlab en interne
- Construction de la masse critique de signaux (businesses, acteurs, prix, tendances, pain points)
- Calibration des agents IA avec feedback Jonathan
- Affinement des reports, autocomplete, rankings

### Phase 2 (release publique) : Cerise sur le gâteau
- Mémoire dorée devient accessible aux users Brvndlab comme **feature premium**
- Probablement réservée au tier Scale ou créée comme add-on
- Positionnement : "le vault market intelligence le plus complet du marché francophone"
- Avantage compétitif énorme : 3-6 mois de data accumulée avant que les concurrents y pensent

### Implication stratégique

Cette phase 1 stealth est CRUCIALE. C'est ce qui va rendre Mémoire dorée irrésistible à la release. Sans les 6 mois d'archive, le produit n'a pas son punch. Avec, c'est impossible à copier pour un concurrent qui démarre à zéro.

**Jonathan dit : "Ça, c'est vraiment la cerise sur le gâteau."**

Cette feature sera l'un des plus gros arguments de vente Brvndlab au moment de la release. À préserver stratégiquement dans les décisions produit.

## Règle d'implémentation

Tout élément ajouté à l'UI de Mémoire dorée doit avoir un backend réel qui le soutient. Jamais de décoration pure. Si on ajoute un bouton "Générer rapport", il faut qu'il génère réellement. Si on ajoute un agent, il faut qu'il fasse quelque chose de concret.

C'est la feature la plus stratégique de Brvndlab. Elle doit être impeccable en production, pas juste belle en mockup.
