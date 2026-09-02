---
name: project_r2_template_system
description: "Système de deck R2 \"à trous\" générique + workflow client par client (template-theta-plum + schmid-signature-r2)"
metadata: 
  node_type: memory
  type: project
  originSessionId: 7640d91e-b7ba-4d16-9abf-0f8c26e5643b
---

Decks R2 VividFlow industrialisés en **template générique à trous**. Dossier racine : `VividFlow/bouquet-supreme-r2/`.

- **Template canonique** : `template/` → **template-theta-plum.vercel.app**. 5 pages (État des lieux · Contexte · Avant/Après · Maquette tableau de bord read-only · Schémas mémoire métier/fonctionnement/quotidien WhatsApp · CDC). Tout le contenu client = tokens `[NOM_ENTREPRISE]`, `[DIRIGEANT]`, `[SECTEUR]`, `[ETAT_LIEUX_CARTE_3..8_*]`, `[SUJET_*_AVANT]`/`[RESULTAT_*_APRES]`, `[KPI_*]`, `[MODULE_*_NOM/DESCRIPTION]`, `[PAYS_HEBERGEMENT]`, etc. Encadré « Guide de remplissage » discret en haut de chaque page (à retirer en version client). Règles dans `template/CLAUDE.md` + `template/TEMPLATE-GUIDE-R2.md`.
- **Workflow nouveau client** : dupliquer `template/` → `<client>-r2/`, retirer les fill-guides, remplir les tokens **uniquement avec le R1/CDC (jamais inventer)**, adapter le métier (modules, secteur), copier `vercel.json` (cleanUrls), `vercel --prod --yes --scope jonathanzekhe-4288s-projects`.
- **1er client réel** : **Schmid Signature** (Marine Jordan, expertise & gérance immobilière, Valais) → **schmid-signature-r2.vercel.app**. Vrai sujet R1 = communications de partout (mails/appels/WhatsApp/courriers) + suivi du temps par mandat + organisation. Point verrouillé : l'interprétation des expertises reste 100% humaine.

**Why:** Réutilisable pour toutes les niches (infopreneur, agence, cabinet, e-commerce, immo, santé, PME).
**How to apply:** Ton patron/boomer, zéro jargon (pas de stack/cockpit/CRM/Second Brain/Data OS), WhatsApp par défaut, em-dash banni, données visuelles, pas de footer. Voir [[project_r2_deck_avant_apres_pattern]] [[feedback_always_push_to_vercel]].

**Passe DA VividFlow (en cours, schmid-signature-r2)** : application section par section, 3 mockups validés à chaque fois. Tokens DA dans `shared.css` (--creme #F4F0EA, --orange #E26137, --olive #614D27, --noir #231F20, Fraunces serif titres, Inter UI, JetBrains Mono labels). **Header validé = "Variante B"** : carte blanche flottante sur crème, wordmark seul "Schmidt Signature" en Fraunces (pas d'icône, pas de "Support R2"), onglet actif en pill terracotta. Mockups variantes servis via pages annexes déployées (header-variants, edl-*-variants) puis implémentés en prod.
**État des lieux (index.html) = scellé**, layout "Proposition 2 · Titre + carte" : grand titre `État des lieux.` (lieux. en terracotta) + phrase de cadrage à gauche, carte synthèse Profil à droite (Zone/Gérance/Expertise + phrase quotidien + chips outils). Pas de "Préparé pour Marine". `Activités: 3` supprimé (ambigu = laissait croire 3 business). Reste à passer en DA : Contexte, Maquette, Schémas, CDC.
**Règles DA apprises de Jonathan** : (1) PAS de recolorage de la même structure — il veut de vrais partis-pris visuels différents. (2) Si une page a du vide autour du contenu, le remplir de façon PERTINENTE (titre, pleine page, sommaire) — surtout PAS de déco gratuite (pointillés/halos/"01/05"/cadre rejetés). (3) Jamais inventer de data.
**Typo deck = Inter** pour TOUT le contenu des pages (titres compris), PAS Fraunces. Fraunces reste uniquement sur le wordmark du header B. Labels en Inter uppercase (pas JetBrains Mono dans le contenu). État des lieux ramené en Inter le 05/06.
**Contexte (contexte.html) = scellé** : on a GARDÉ l'esthétique d'origine (2 cartes Avant/Après avec voile de révélation "+"), juste recoloré en DA + typo Inter + émojis Apple (👂⚙️) retirés. Carte "Avant" = icône ondes SVG au trait ; carte "Après / L'IA installée" = **logo VividFlow** (vividflow-icon.png copié dans le dossier deck, affiché plein cadre coins clippés). Reste : Maquette, Schémas, CDC.
**Récup d'images collées dans le chat = impossible** (ni fichier disque, ni presse-papiers). Pour un asset exact, demander à Jonathan de déposer le PNG dans le dossier deck et redéployer.


**MAJ 10/08/2026 (post-incident Jorge)** : la DA validée (crème/terracotta/olive, header Variante B, Inter) est désormais INTÉGRÉE dans `template/` : les 5 pages ont été re-tokenisées depuis les pages Schmid scellées (structure/CSS identiques, contenu 100% tokens, encadrés fill-guide réintégrés, assets vividflow-icon.png + isaiah.png présents). Nouveaux tokens : [ETAT_LIEUX_LIGNE_1..3_LABEL/VALEUR], [PHRASE_QUOTIDIEN(+_ACCENT)], [OUTIL_1..4], [CADRAGE_1..3_*], [OBJECTIF_PRINCIPAL], [ETAPE_1..6_DESCRIPTION], [DATE_DEMARRAGE], [OUTIL_REFERENCE_CONSERVE_*], [ENVIRONNEMENT_CONSERVE_*], [DECISION_*_STATUT], [IA_PREPARE_*_LABEL/VALEUR], [DOCUMENT_PREPARE]. Le template déployé template-theta-plum est PÉRIMÉ tant qu'on n'a pas redéployé. Règles process durcies : voir [[feedback_r2_transcript_complet_et_anticontamination]].