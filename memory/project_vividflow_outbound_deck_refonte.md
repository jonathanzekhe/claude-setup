---
name: project_vividflow_outbound_deck_refonte
description: "Refonte du deck outbound DM LinkedIn (template-outbound.vividflow.co) : pages scellées, mécanique par niche, et phase 215 à venir"
metadata: 
  node_type: memory
  type: project
  originSessionId: 40a072e9-246c-4d6a-bd30-8dcfbed7bd3f
  modified: 2026-08-06T07:31:39.767Z
---

Refonte scellée les 04-05/08/2026 pour l'outbound DM LinkedIn (50 connexions/jour, tutoiement en DM, vouvoiement dans le deck).

**Repo** : canonique `/home/hermes/workspaces/vividflow-outbound` (VPS, git init fait), miroir local `~/dev/vividflow-outbound`. Projet Vercel `vividflow-outbound`, wildcard `*.vividflow.co`. Déploiement SANS rebuild : `cd dist && vercel deploy --prod --yes` (le dist porte un vercel.json statique buildCommand null). Un `npm run build` complet régénérerait les 215 decks : interdit tant que la phase 215 n'est pas validée. `scripts/preview-only.mjs` régénère uniquement `dist/p/template-outbound`.

**Deck : 8 pages** (deck.js) : index, p2, p3, p5, p7 (slider solution), p8 (conversation bras droit, champ p7chat conservé), p9 (ex-p8 projection), fin (remplace booking, plus de RDV iClosed).

**Scellé** :
- Page fin : titre "Cette projection est une première brique.", phrase M1 avec champs `finEntreprise` (auto-dérivé de coverName par build.mjs) et `finNiche` (obligatoire, bloque le build si vide), signature "Jonathan Zekhe / CEO VividFlow · Votre partenaire de croissance IA" avec photo, sans signature manuscrite, sans "Présenté par VividFlow". Anti-vente : aucun CTA, la vente se fait dans le fil DM.
- p7 : titre "Voilà la solution.", carrousel 5 cartes du site (agents qui parlent, orchestrateur, cerveau outils, dataOS, mémoire agentique) en iframes `/solution/*.html?embed`, autoplay 7s desktop / 10s mobile, badge "LA SOLUTION" masqué en embed. Variables par niche marquées en preview via `?embed&holes=1` (nicheAgents/nicheOutils/nicheKpis/nicheMemoire).
- p7 mobile (<560px) : 5 slides natifs remplaçant les iframes. Agents = carte focus B SCELLÉE (un agent à la fois, bulle crème #EFE8DB AU-DESSUS de l'avatar avec pointe vers le bas, sans guillemets, badge tâche orange qui devient "✓ fait" vert, sans points de navigation). Cerveau = hub avec traits animés. Tout doit être en mouvement, transitions douces.
- Cohérence : mêmes 4 agents partout (commercial, relation client, administratif, planification), avatars illustrés assumés (choix de marque validé).
- Logos outils niche services techniques : bexio, WinBIZ, TWINT, WhatsApp + Google/Outlook (dans templates/logos-outils/).

**Phase 215 FAITE le 05/08/2026** : les 215 decks portent la nouvelle structure.
- `niches.json` à la racine = 9 familles (avocats 71, fiduciaires 54, recrutement 26, conseil 16, assurances 15, finance 14, immobilier 14, services-techniques 3, notaires 2). Chaque famille définit : 4 agents (l/rl/task/say/act/done), 10 outils (clés logos), 8 KPIs dataOS, 4 questions mémoire. Les avatars et positions restent FIGÉS, seuls les libellés métier changent.
- Chaque `content/<slug>.json` porte `famille` (racine) + `fields.finNiche` (niche au pluriel, ≤45 car., obligatoire).
- Les 5 cartes `templates/solution/*.html` ET `templates/p7.html` (slider mobile) lisent un bloc `<script type="application/json" id="niche-data">`. `build.mjs` le remplace par le preset de la famille via `injectNiche()`. Ne jamais recoder de contenu en dur dans ces fichiers.
- Build : `npm run build` (215 decks + aperçu). Déploiement : `cd dist && vercel deploy --prod --yes`.
- Vérifié : pages index/p2/p3/p5 byte-identiques à l'ancienne prod, 214/215 sous-domaines servent les 4 nouvelles pages, contenu par famille contrôlé sur les 215 en local et par échantillon en live.

**Outils métier par niche (06/08/2026)** : Jonathan a rejeté les outils génériques plaqués (TWINT, Notion) comme une faute grave de crédibilité. TWINT = paiement entre particuliers, aucun usage B2B ; Notion inconnu des fiduciaires/avocats/immobilier suisses. Ces quatre sont bannis dans `scripts/set-outils.py` : **twint, notion, slack, stripe**. Règle : 6 outils métier réels minimum, 4 génériques maximum (Outlook, Drive, Sheets, Agenda, Calendly, WhatsApp).
Outils validés par famille : fiduciaires = Crésus, Abacus, Dr. Tax, WinEUR, bexio, Swissdec, Sage · avocats = Swisslex, timeSensor, Vertec, Jus Mundi, Skribble · notaires = Terravis, Crésus, Skribble, DocuSign, Abacus · recrutement = Interiware, Arca24, jobup.ch, swissstaffing, LinkedIn · prévoyance/finance = Sobrado, BrokerStar, FINMA, Skribble, Salesforce.

**Récupérer un logo, méthode qui marche** : `python3 scripts/fetch-logos.py cle=domaine` (simpleicons → site officiel → SVG inline → Wikipedia par ARTICLE → clearbit/favicon). Puis `python3 scripts/set-outils.py <famille> <10 clés>` qui refuse doublons, outils bannis et logos manquants.
**PIÈGE MAJEUR** : la moitié des logos récupérés automatiquement étaient FAUX (Abacus → banque chinoise, Swissdec → SUVA, Terravis → CFF, Skribble → CFF, LinkedIn → drapeau pirate). **Toujours générer une planche de contrôle et REGARDER les logos avant de les intégrer.** Certains sont blancs sur fond transparent (Crésus, Dr. Tax) : les recolorer en #1a1815 en gardant l'accent de marque. Les logotypes suisses sont larges (Abacus 5.7:1) : tuiles rectangulaires 76x48 desktop / 64x42 mobile, `object-fit:contain`.

**Deux pièges rencontrés, à retenir** :
1. `jpf.vividflow.co` appartient au projet Vercel `vividflow-pitchdeck-r2` (pitchdeck client Groupe JPF, actif). Le deck outbound jpf existe dans dist mais n'est PAS servi. Ne pas déplacer ce domaine sans décision de Jonathan.
2. `content/arkion.json` est immuable côté VPS (`chattr +i`, propriétaire root) : rsync échoue dessus. La version à jour vit dans le miroir local `~/dev/vividflow-outbound`, d'où le build doit être lancé.
3. Le bac à sable coupe les requêtes HTTP répétées en boucle shell : vérifier le live par appels espacés ou par lots, sinon faux négatifs massifs.

**Pilote 5 decks corrigé et LIVE (06/08/2026)** : favre / peter-kim / valeur-plus-sa / pittet-associates en pile Microsoft (outlook, excel, whatsapp, linkedin, teams + 5 outils métier), notge en pile Google. Chaque fiche `content/<slug>.json` porte `outilsDeck` (10 clés, prime sur le preset famille) + `tailleDeck` (petite/moyenne/grande → `scaleKpis` dans build.mjs met les CHF et compteurs du dataOS à l'échelle). Le hub mobile p7 choisit 5 métier + messagerie + WhatsApp + LinkedIn (plus de slice aveugle). `verifier-decks.mjs` : socle flexible + détection d'écosystèmes mélangés (voir [[feedback_regle_composition_outils_metier]]). Vérifié `--live --tous` : 214/215 conformes (jpf = 404 connu). Prochaine étape quand Jonathan valide : industrialiser la classification par site web sur les 210 restants.

**DM d'ouverture validé** : "Bonjour (prénom) ! Enchanté 🤝 Je me suis permis de faire une projection personnalisée autour de (entreprise). Serais-tu contre que je te la partage ?" (tutoiement, choix Jonathan+CTO).
