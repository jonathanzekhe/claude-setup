---
name: reference_vividflow_direction_page
description: "Page Vercel récapitulative de la direction VividFlow scellée le 20/08/2026 (positionnement, offre 2 étages, communication, quiz)"
metadata:
  type: reference
---

**https://vividflow-direction.vercel.app** : one-pager DA Linea (Satoshi/Instrument Serif/#E34400/crème) qui résume la direction du 20/08/2026. Source : [[project_vividflow_pivot_2026_08_20_partenaire_croissance]]. Code : `~/dev/vividflow-direction/index.html`, projet Vercel `vividflow-direction`. Sert de document de référence à partager (Thomas, Rafaela). Si le pivot évolue, mettre cette page à jour, pas en créer une nouvelle.


**Page sœur : https://vividflow-funnel.vercel.app** : la carte du FUNNEL (schéma bout en bout, les 2 portes du filtre, les 5 phases de questions, les 4 cas A/B/C/D, les 3 profils de sortie provisoires, KPI). Code : `~/dev/vividflow-funnel/index.html`, projet Vercel `vividflow-funnel`. Tout en clair (demande explicite : rien de sombre). Les noms des 3 profils restent à sceller avec Jonathan.

**Prototype quiz v3 : https://vividflow-quiz-v3.vercel.app** : parcours COMPLET cliquable (landing → 15 questions scellées → 3 réassurances voix Jonathan → analyse → identité en fin → résultat par profil avec score/frein/VSL placeholder/calendrier placeholder + sortie sous-seuil contenu gratuit). Q6 adaptative CA, €/CHF via Q2, E2E testé Playwright 21/08. Code : `~/dev/vividflow-quiz-v3/index.html`. PROTOTYPE : rien de branché (pas de Meta, pas de Convex, pas d iClosed, pas de diagnostic Sonnet). La prod quiz.vividflow.co reste intacte tant que Jonathan n a pas validé.

**MAJ 21/08 : prototype v3 refait PIXEL PERFECT sur la DA du quiz live** (quiz.vividflow.co repris code pour code : moteur de slides superposées fade+translateX, options dashed radio gauche, orange #e0531e, Inter Tight/Inter/Geist Mono, topbar logo fixe, particules de sélection, vibration mobile, formulaire identité lignes + indicatif drapeaux ronds). Réassurances v2 : R1 teaser (validée), R2 raccourcie ("Ajouter n'a jamais structuré : ce qui te manque, c'est l'architecture."), R3 = projection positive ("ce type de frein se lève vite une fois localisé") ; attribution = photo jonathan-ceo.jpg + "Jonathan · Partenaire de croissance IA". Q5 variante A. E2E Playwright complet OK (Q6 adaptative CHF, profil, prénom, priorité).