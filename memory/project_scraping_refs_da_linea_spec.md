---
name: project_scraping_refs_da_linea_spec
description: SPEC COMPLÈTE de la DA Linea + copy suisse pour les pages VividFlow fiduciaire (gabarit à appliquer aux 15 pages)
metadata: 
  node_type: memory
  type: project
  originSessionId: 047fe6b7-30cd-489d-bc0b-e2a4438db1c0
---

**SPEC COMPLÈTE (scellée 2026-07-15) — page "Agents IA pour fiduciaires" VividFlow.** C'est le GABARIT validé section par section avec Jonathan. À appliquer à l'identique sur les 14 autres pages (secteurs, types d'entreprise, cas d'usage), en adaptant seulement le vocabulaire métier. Page de réf assemblée : **scraping-refs.vercel.app/pages/comptable-v2.html**. CTA animé : **/pages/mockup-cta-a.html**.

## DIRECTION VISUELLE (DA Linea — lineads.framer.website)
- **Fond** : blanc `#fff` + **dotted grid** = `radial-gradient(circle, rgba(18,18,18,.10) 1px, transparent 1.3px)`, `background-size:26px 26px`. Toute la page. Jamais crème, jamais pattern d'une autre couleur.
- **Couleurs** : orange `#e34400` (hover `#c93d00`), encre `#121212`, corps `#57575a`, muted `#9a9a9e`, bord `rgba(18,18,18,.1)`.
- **Aucun élément arrondi type pill** pour les boutons (Jonathan déteste). Radius : boutons/icônes 10-12px, cartes 14-16px, badge eyebrow = seule exception pill 99px.
- Easing : `cubic-bezier(.22,1,.36,1)`.

## TYPOGRAPHIE (5 fonts, rôles stricts)
- **Titres h1/h2** : Inter Tight 500, letter-spacing -0.03em, line-height ~1.04.
- **Mot-accent (2e ligne de titre)** : **Instrument Serif Regular Italic**, weight 400, letter-spacing -0.5px, **couleur noir #121212** (PAS orange). C'est LA signature (style Lumina/Linea).
- **Corps** : Inter 400, #57575a.
- **Sous-titres cartes h3** : Inter Tight 600, 18px.
- **Eyebrows / labels / preuve** : Geist Mono, uppercase, tracking, orange.
- Fonts abandonnées définitivement : Newsreader, Satoshi, Fraunces, Sora, Geist Mono→(garder Geist Mono), Wremena (pas hébergeable).

## HERO (version A, scellé)
- Layout centré. Badge live "Secteur X" (pill blanc bord fin + point orange qui pulse + lift au hover). Titre découpe B équilibrée bas de casse : "Des agents IA pour" (Inter Tight) / "*votre <métier>*" (Instrument Serif italic noir), les 2 lignes se répondent en longueur (jamais 2e ligne 2× plus longue). Sous-texte court 1-2 phrases. UN SEUL bouton. Sous le bouton : **ligne de preuve A** = ★★★★★ orange + "**120+ entreprises** auditées" (chiffre RÉEL global, gras). Fond dotted.

## BOUTON (scellé)
- Orange plein `#e34400`, **radius net 10px**, texte Inter medium 15px casse normale (pas mono caps), **flèche dans un carré 32px radius 7px** à droite (fond blanc translucide `rgba(255,255,255,.18)`, flèche blanche). Hover : orange foncé + carré se décale translateX(2px). Sur fond orange (CTA), le bouton devient BLANC (fond #fff, texte #121212, carré-flèche orange plein).

## STATS (variante B, scellé)
- Grid 4 colonnes, gap 16px. Chaque stat = carte blanche, bord `rgba(18,18,18,.1)`, radius 14px, padding 28px, centré. Chiffre Inter Tight 600 40px ORANGE. Label gris 13px dessous. Hover : bord orange + translateY(-3px) + ombre.

## DÉFIS (forme C + icône 03, scellé)
- Grid 2 col, gap 18px. Carte blanche, bord fin, radius 16px, padding 28px. **Numéro index "01/02/03/04"** Geist Mono 12px gris en haut à droite. Hover lift + bord orange.
- **ICÔNE style 03** : carré 48px radius 12px, contour fin `rgba(18,18,18,.1)`, fond blanc, icône trait ORANGE stroke 1.7. PAS de relief 3D/neumorphism (abandonné, incompatible Linea plate).

## SOLUTIONS (3 agents)
- Grid 3 col, gap 18px. Même carte que défis + icône 03 (SANS numéro index). Titre agent + 1 phrase courte + liste puces à checkmarks (case 18px radius 6px fond `rgba(227,68,0,.1)`, check orange).

## CTA FINAL (version A calendrier animé, scellé)
- **Panneau orange plein** gradient `135deg #ff5a1f→#e34400`, radius 26px, padding 56px, grid 2 col (texte gauche / calendrier droite), ombre orange profonde. Titre Inter Tight blanc + italique blanc. Sous-texte 1 LIGNE. Bouton BLANC (voir règle bouton). 
- **Calendrier DYNAMIQUE** (glass rgba blanc + blur) : JS client `new Date()` (fonctionne en navigateur) → affiche le VRAI mois courant, nb de jours exact, alignement lundi=1re colonne, jours passés grisés. **Créneau = aujourd'hui + 3 jours ouvrés** (saute samedi/dimanche), bascule au mois suivant si fin de mois. **Motion en boucle** : le créneau se sélectionne (fond blanc + ✓), statut "Choix du créneau"→"Créneau sélectionné"→"Réservé", barre de confirmation "Mardi X mois · 14h00 réservé" apparaît, reset après ~5s, recommence. Respecte prefers-reduced-motion. Zéro maintenance, marche sur toutes les pages / tous les mois.

## COPY — MARCHÉ SUISSE (voir [[feedback_copy_neocell_vividflow_rules]] pour détail)
- Clients = SUISSES. Copy 100% suisse, jamais franco-français.
- "cabinet comptable" → **fiduciaire** ; "IS" → **impôt sur le bénéfice** ; "liasses fiscales" → **bouclement** ; "déclarations sociales" → **décomptes AVS et charges sociales** ; SUPPRIMER "facture électronique/e-reporting" (UE, pas CH) ; "plan comptable" → **droit comptable (CO), Swiss GAAP RPC**. TVA suisse 8,1% (jamais taux FR). Nombres FR : **99,7%** (virgule).
- Vocab CH crédible : bouclement, révision (contrôle ordinaire/restreint), décompte TVA, AVS/AI/APG, LPP, LAA, impôt à la source, certificat de salaire, QR-facture, IDE.
- Jamais "gratuit" (→ retirer). Bouton = "Réserver mon audit". CTA titre "Prêt à libérer du temps de conseil ?". Sous-bouton "45 min avec un expert IA, sans engagement." Retirer surdose "automatique". Descriptions agents = 1 phrase courte. Casser deux-points en enfilade des défis. "3x de ROI en moyenne".

**INDUSTRIALISATION FAITE (2026-07-15)** : les 15 pages générées et déployées live (scraping-refs.vercel.app/pages/<slug>/). Pipeline : extract-content.js (extrait copy Neocell brut) → agents adaptent copy suisse+règles (adapted/out_*.json) → page-template.html + generate-final.js (injecte dans le gabarit Linea). **Tribunal de 5 juges passé** : DA 15/15 conforme (CSS+script au byte près), copy suisse conforme. Corrections appliquées : bugs `<` non échappés dans stats (leads/support/immobilier → `&lt;`), titres d'agents harmonisés "Agent + casse de phrase" partout (comptable était Title Case, 5 pages usage sans "Agent"), titles dédupliqués, casse badges (Secteur/Type + minuscule sauf acronymes), euro→franc + puissance→moyens (startup), immobilier hero + services chaîne interne cohérence. RÈGLE badge : "Secteur X"/"Type X"/"Cas d'usage X", terme en minuscule (sauf acronyme type SaaS B2B). RÈGLE titres agents : toujours "Agent <fonction>" en casse de phrase. RÈGLE stats avec `<` : écrire `&lt;` en HTML.

**LIVE EN PROD (2026-07-15)** : les 15 pages sont intégrées et déployées sur **vividflow.co** (projet Vercel **site-mockups**, dossier `~/dev/site-mockups/etudes-de-cas/`). Structure URL finale : `vividflow.co/etudes-de-cas/<cat>/<page>` où cat = `secteur` / `type-entreprise` / `cas-usage`. Slugs URL : secteur/fiduciaire, secteur/immobilier, secteur/sante, secteur/avocat, secteur/industrie ; type-entreprise/saas-b2b, type-entreprise/agence, type-entreprise/societe-de-services, type-entreprise/startup, type-entreprise/grande-entreprise ; cas-usage/generation-de-leads, cas-usage/support-client, cas-usage/equipes-commerciales, cas-usage/marketing, cas-usage/operations. Servi nativement par sous-dossiers index.html (pas de rewrite). Ces pages vivront dans la future section "Études de cas" du site VividFlow (Jonathan refait tout le site autour). **SÉCURITÉ** : nettoyage complet fait — 0 trace Neocell/Kalvi/no-sage, 0 URL/asset externe suspect, seules ressources externes = Google Fonts. Mockups de conception archivés dans ~/dev/scraping-refs/_archive/ (retirés de toute prod). Le vieux hub scraping-refs.vercel.app existe encore mais n'est plus la source officielle. **Page index "Études de cas"** créée : `~/dev/site-mockups/etudes-de-cas/index.html` → live sur **vividflow.co/etudes-de-cas** (DA Linea, hero + 3 sections : Par secteur / Par type d'entreprise / Par cas d'usage, 15 cartes cliquables vers les pages détaillées). **Lien "Études de cas" ajouté au header de vividflow.co** (index.html) : nav desktop entre "Agents IA" et "Comment ça marche" + menu mobile (renuméroté 01-05). Prochaine étape annoncée par Jonathan : refonte complète de la landing page vividflow.co. Voir [[feedback_always_push_to_vercel]], [[feedback_verify_until_live]].

Voir [[project_scraping_refs_neocell]] (hub, pipeline, trim), [[feedback_copy_neocell_vividflow_rules]] (copy+suisse détaillé), [[feedback_no_em_dash]], [[feedback_tone_mature_saas]].
