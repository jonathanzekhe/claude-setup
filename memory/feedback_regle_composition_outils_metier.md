---
name: feedback_regle_composition_outils_metier
description: "Comment composer une liste d'outils métier crédible : socle universel obligatoire, diversité des catégories, jamais 3-4 concurrents du même type"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 40a072e9-246c-4d6a-bd30-8dcfbed7bd3f
  modified: 2026-08-06T07:31:30.236Z
---

Quand on affiche les outils qu'une entreprise utilise (carte « cerveau connecté à vos outils métier » du deck outbound, ou tout visuel équivalent), la liste doit ressembler à un vrai parc logiciel, pas à un annuaire de concurrents.

**Le socle universel, toujours présent** : Gmail, Google Sheets, Google Agenda, WhatsApp, LinkedIn. Tout le monde les utilise, quel que soit le métier. Jonathan préfère Gmail à Outlook. Google Drive est optionnel, son intérêt n'est pas démontré.

**Jamais plus d'un ou deux outils de la même catégorie.** Trois ou quatre CRM côte à côte, ou quatre portails immobiliers, c'est absurde : une entreprise n'en utilise pas quatre. Un ou deux suffisent pour que le dirigeant reconnaisse le sien.

**Why:** Sur le deck outbound (06/08/2026), afficher plusieurs logiciels concurrents du même segment décrédibilise immédiatement la carte auprès d'un dirigeant qui connaît son marché. L'effet recherché est « ils connaissent mon métier », pas « ils ont copié une liste d'éditeurs ».

**RÈGLE DÉFINITIVE (validée par Jonathan le 06/08/2026)** : *le site classifie, le marché décide, le public visible corrige.*
1. Le site web du prospect sert UNIQUEMENT à classifier : micro-métier exact (courtier ≠ gérance ≠ promoteur ; conseil M&A ≠ conseil RH) et taille réelle (page équipe, bureaux).
2. On ne devine JAMAIS l'outillage interne (outils cachés, maison) : pour chaque catégorie, on affiche l'outil LE PLUS CONNU du marché pour ce micro-métier à cette taille — le pari du généraliste gagne toujours.
3. Seule exception : un signal PUBLIC et visible sur leur site (annonces publiées sur tel portail, lien Calendly) se suit tel quel.

**Les 8 questions, une tuile chacune** : acquisition métier (portail/annuaire sectoriel) · acquisition réseau (LinkedIn, socle) · logiciel du micro-métier · pipeline/suivi d'équipe (rien sous ~10 personnes, CRM léger au-dessus) · communication interne (WhatsApp si petit, Slack/Teams si structuré — l'interdit Slack est LEVÉ pour les structures qui en ont la taille) · encaissement · État/réglementaire · signature & contrats (renommage de "engagement", terme rejeté par Jonathan).

**La grille de sélection : les 5 moments de vérité, calibrés à la TAILLE de l'entreprise.**
Chaque tuile métier répond à une question, une seule tuile par question :
1. Par où arrive l'argent ? (acquisition : plateforme de mise en relation, annuaire, place de marché)
2. Où se fait le travail ? (le logiciel métier ouvert toute la journée)
3. Où l'argent est-il encaissé ? (facturation/comptabilité)
4. Qu'est-ce qui est imposé de l'extérieur ? (portail de l'État, registre, norme)
5. Qu'est-ce qui engage juridiquement ? (signature, envoi qui fait foi)

**La taille de l'entreprise est un critère de sélection à part entière.** Un cabinet de 5 personnes n'utilise pas Salesforce ni un ERP de groupe ; il utilise bexio, Crésus, des outils à sa taille. Les prospects du deck outbound sont des TPE/PME (2-30 personnes) : choisir les outils que CETTE taille utilise vraiment, pas les plus connus du secteur.

**Cohérence d'écosystème (Jonathan, 06/08/2026)** : une entreprise vit dans UN écosystème bureautique. Gmail + Teams dans la même liste est incohérent (Meet est Google, Teams est Microsoft, personne ne switche les deux). Un deck est soit pile Google (Gmail, Sheets, Agenda), soit pile Microsoft (Outlook, Excel, Teams). Le vérificateur (`verifieSocle`) bloque tout mélange. Socle flexible : WhatsApp + LinkedIn toujours ; Gmail OU Outlook ; Sheets OU Excel.

**Logo LinkedIn** : toujours l'ICÔNE carrée bleue « in » (`linkedin.webp`), jamais le logotype « LinkedIn » en toutes lettres (illisible en petit, rejeté par Jonathan).

**KPIs à l'échelle de la taille** : les montants du dataOS suivent `tailleDeck` (petite = preset, moyenne = CHF ×8 / compteurs ×4, grande = CHF ×45 / ×12, arrondi 3 chiffres significatifs). CHF 148'400 de honoraires mensuels chez un cabinet de 61 avocats décrédibilise autant qu'un mauvais outil.

**How to apply:**
- Composer par CATÉGORIES différentes, pas par notoriété : logiciel métier (1-2 max), comptabilité/facturation (1), portail ou registre officiel de l'État (souvent oublié, très crédible), signature électronique, communication, bureautique.
- Les outils étatiques et réglementaires sont d'excellents choix : ils sont incontournables, non concurrentiels, et prouvent la connaissance du métier (registres, portails fiscaux, plateformes de déclaration).
- Adapter au MARCHÉ, pas seulement au métier : outils suisses pour des prospects suisses, outils français pour un marché français. La liste n'est pas transposable telle quelle d'un pays à l'autre.
- Vérifier la diversité avant d'appliquer : si deux entrées font la même chose, en retirer une et la remplacer par une autre catégorie.

Voir [[project_vividflow_outbound_deck_refonte]] pour le mécanisme technique (niches.json, scripts/set-outils.py) et [[feedback_toujours_verifier_le_live_avec_un_agent]] pour la vérification obligatoire.
