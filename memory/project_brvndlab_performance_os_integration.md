---
name: Performance OS integration to Brvndlab
description: Performance OS est un outil séparé existant de Jonathan (CRM financier Google Sheets) qui sera refondu et intégré à Brvndlab comme section après la finalisation du MVP Brvndlab.
type: project
---

## Contexte

**Performance OS** est un outil que Jonathan a déjà construit, stocké à `~/Downloads/performance_os.html` (plusieurs versions, 161KB, 3845 lignes). C'est un CRM financier et business tracker pour lui et ses clients.

## Ce que fait Performance OS

### Page Funnel
- Entonnoir de conversion visuel
- Alertes
- Tableaux par rôle : Media Buyer, Setter, Closer

### Page Chiffres
- Section **Sales** (basé sur date de signature) : contracté, objectif
- Section **Finance** (basé sur date de paiement) : encaissé, restant, taux de collecte, dépenses pub, CPA, ROAS
- Graphiques Chart.js

### Page Clients
- Tableau complet : offre signée, date de signature, échéance, contracté, encaissé, restant, statut (Payé, Partiel, En retard, En attente)
- Filtres : Tous, En retard, Aujourd'hui, Cette semaine, Partiel, En attente, Payé
- Layout mobile avec cards expandables

### Source de données
**Google Sheets connecté via Paramètres**. Mode démo actuel avec données fictives. Chaque utilisateur connecte son propre sheet.

### Style actuel
Dark mode obsidian, à refondre en **frosted bento light** pour cohérence avec Brvndlab.

## Décision validée 2026-04-08

**Performance OS sera intégré à Brvndlab APRÈS la finalisation du MVP Brvndlab.** On ne touche pas à Performance OS maintenant. On termine Brvndlab d'abord.

## Roadmap d'intégration (post-MVP Brvndlab)

1. **Refonte visuelle** de Performance OS en frosted bento light (front-end + récaps)
2. **Intégration dans Brvndlab** comme section "Performance" dans la sidebar du créateur, à côté de Dashboard, Brand OS, Contenu, Calendrier, Analytiques (reseaux sociaux)
3. **Distinction stricte** : Analytiques = stats réseaux sociaux, Performance = stats business (CA, MRR, clients payants, pub)
4. **Côté Coach** : vue agrégée du CA de tous les clients + accès à la fiche Performance de chaque client en lecture seule, pour coaching financier
5. **Alertes IA transverses** : paiements en retard, dépassement d'objectifs, clients qui galèrent financièrement
6. **Garder Google Sheets comme source** : chaque utilisateur connecte son propre sheet, pas de migration douloureuse

## Impact immédiat sur le MVP Brvndlab

**Décision validée 2026-04-08 :** Brvndlab doit afficher une version LÉGÈRE du tracking business dans le Dashboard créateur, en parallèle de Performance OS qui reste la version détaillée.

**Les 4 métriques obligatoires dans Brvndlab (version light) :**
1. **Chiffre d'affaires** (total contracté sur la période)
2. **Cash collecté** (encaissé réel)
3. **MRR** (revenu mensuel récurrent)
4. **Nombre de clients** (actifs payants)

**Philosophie :**
- Brvndlab = vue d'ensemble light, en 4 chiffres
- Performance OS = vue détaillée complète avec funnel, publicité, clients individuels, etc.

Les deux outils doivent exister en parallèle pour le client : il voit ses chiffres en un coup d'oeil dans Brvndlab et creuse dans Performance OS s'il veut le détail. Référence inspiration : Tom Young (Scale20) qui avait un bloc Performance similaire sur son dashboard.

Le bouton "Voir tout dans Performance" du bloc Brvndlab ouvrira la section Performance complète une fois l'intégration faite (post-MVP).

Applicable à la fois au Dashboard créateur (mon CA) ET au Dashboard Coach (CA agrégé de mes clients).

## How to apply

- Ne pas inclure Performance OS dans les mockups MVP sauf pour le bloc CA du Dashboard créateur
- Ne pas afficher de MRR/revenu dans le Dashboard Coach tant que Performance OS n'est pas intégré
- Quand on fera l'intégration, repartir du fichier existant `~/Downloads/performance_os.html` et ne pas reconstruire de zéro
