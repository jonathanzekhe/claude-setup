---
name: project_vividflow_offres_etape1_sealed
description: "VividFlow /offres étape 1 scellée — copie originale gardée, mécanique projection heure/mois/année ajoutée"
metadata: 
  node_type: memory
  type: project
  originSessionId: 445fdd04-7aec-441e-9250-c18303792262
---

Refonte de vividflow.co/offres (funnel post-call), étape 1 "L'audit" **scellée** le 2026-07-13.

**Décisions figées :**
- Copie = **version A originale de Jonathan** conservée (ton posé VividFlow, "less is more"). Une réécriture façon Neocell a été testée puis **rejetée par Jonathan** : "ma version originale est meilleure".
- Ajout validé : **mécanique de projection** dans un bloc héros façon quiz.vividflow.co — tâches cliquables → compteur heures/sem → projette en **mois (×4.33) et en jours/an (semaine×52/9, journée de 9h)**. Calé sur la capture quiz (5h→29j). C'est LA mécanique que Jonathan a aimée d'emblée.
- DA exacte de la page prod (pas la charte deck) : fond `#FAF9F6`, titres **Satoshi 700**, badges/labels **Host Grotesk**, mono **Geist Mono** (substitut JetBrains Mono en mockup), body Inter gris `#56565A`, accent orange **`#E34400`**, cards blanches bordure `rgba(18,18,18,.12)` radius 20px, zéro ombre.
- Mockup : `scratchpad/vividflow-offres-modules.html`, servi via `python3 -m http.server 8770`.

**Ajustements visuels scellés (parti pris designer validé par Jonathan) :**
- Eyebrow = "Étape 01" seul (pas "· Point de départ"). Moins de texte, le titre "L'audit" porte le sens.
- Hint court = "Cochez vos tâches faites à la main" (au lieu de "Cliquez une tâche pour voir le temps qu'on vous rend"). 2 tâches pré-cochées à l'arrivée = pédagogie par l'exemple, pas par la notice.
- Lignes de tâches agrandies (`flex:1`, `justify-content:space-between`) pour combler le vide sous la dernière tâche et aligner les 2 colonnes en bas.
- "Le résultat : Votre plan IA personnalisé" retiré du flottant orphelin en bas de page → **intégré en pied du bloc projection sur fond noir** (`.proj-result`), devient le point d'ancrage final. Le bloc droit se lit d'un trait : 10h → 43h/mois + 58j/an → votre plan.
- Astuce technique screenshots : le MCP Playwright plantait ("waiting for fonts"). Contournement fiable = headless Chrome CLI : `"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless=new --screenshot=OUT --window-size=1120,900 --virtual-time-budget=3000 URL`.

**Étape 2 VALIDÉE (2026-07-14) : variante C · Rayonnant.** Schéma d'architecture inspiré de Kalvi (go.kalvi-ai.fr/faq), reconstruit dans la DA VividFlow. Structure : « Vous, le client » (bloc noir, en haut) → « Agent orchestrateur » (gros bloc orange, SANS glow/box-shadow) → « Mémoire · Cerveau d'entreprise » (pill sable) → 6 pôles d'opérations qui rayonnent (courbes bézier depuis la mémoire) : Marketing, Vente, Administratif, Technique, Relation client, Prospection. Chaque pôle affiche 2-3 outils en chips mono d'emblée (Réseaux/Analytics/Email, CRM/Agenda/Email...), numérotation discrète 01-06 en coin, détail complet (desc + tous les outils) au clic dans un panneau noir. PAS de nom d'agent (Sora/Kenzo abandonnés, Jonathan a tranché). Mockup : `scratchpad/vividflow-etape2-v2.html` (onglet C).
Process : 3 directions UI (A organigramme / B couches / C rayonnant) auditées par tribunal 3 agents (juge hiérarchie, juge ICP dirigeant, juge craft anti-slop). Tribunal split (B pour le message, C pour l'ICP), corrections appliquées aux 3 (glow retiré de C, labels « Couche 0X » retirés de B, bus unique pour A, outils visibles partout). Jonathan a choisi C.

**COPIE + ÉTIQUETTES de l'étape 2 finalisées (2026-07-14), fichier `scratchpad/vividflow-etape2-final.html`. Tout validé par Jonathan.**
- Titre sur UNE ligne (white-space:nowrap + clamp) : « Votre équipe d'agents IA sur mesure ». Lede validée (couche qui se pose sur l'existant).
- Bloc haut = « Vous » tout court (pas « opérateur de croissance IA »). Bloc central = « Agent orchestrateur » tout court (pas de label au-dessus). Bloc mémoire SUPPRIMÉ. C'est l'orchestrateur qui parle au dirigeant/fait la synthèse (pas de 7e agent « Pilotage », ce serait un doublon).
- 6 agents nommés par CAS D'USAGE (pas département, pas nom d'agent type Sora) : **Génération de leads / Support client / Équipe commerciale / Marketing / Opérations / Administratif**. Chaque bloc = format 2 niveaux : ligne mono « ● AGENT IA » avec point vert qui pulse (statut actif) + titre cas d'usage. Puis 4 étiquettes visibles (2 lignes équilibrées).
- Étiquettes auditées par tribunal 3 agents (couverture / résonance ICP / crédibilité). Règles scellées : **basculer vers tâches/bénéfices, garder max 1 outil-preuve** ; **jamais de marque précise en dur** (« Meta Ads »→« Publicité ciblée », « LinkedIn »→« multicanale ») car ça exclut ceux qui ne l'utilisent pas ; **promesses risquées retirées** (« Comptabilité »→« Préparation comptable », « SEO » retiré, « Réponses 24/7 »→« Réponses instantanées »).
- Au CLIC sur un agent : panneau noir s'ouvre en bas avec la liste COMPLÈTE des douleurs concrètes (5-6 items, 2 colonnes, puces cochées orange). C'est là qu'on déballe toutes les douleurs (Devis, Avis clients, Onboarding, Confirmations RDV/no-shows...), pas dans les étiquettes du bloc. Bloc = scannable, détail = convainc.
- Règle générale confirmée : [[feedback_condenser_jamais_supprimer_texte]], titres courts, moins de texte, jamais trop spécifique sur les plateformes.

**Étape 3 VALIDÉE (2026-07-14), fichier `scratchpad/vividflow-etape3-final.html`.**
- Le CERCLE mensuel initial a été REJETÉ par Jonathan (« manque de logique, un cercle qui tourne évoque un cycle mécanique, or le message = présence continue à ses côtés »). Direction retenue = **« présence continue »** : badge « Votre responsable IA » (point orange qui pulse, JAMAIS de vert : DA = crème/noir/orange #E34400 uniquement) + frise horizontale à 3 gestes + bandeau résultat.
- Titre : **« Votre partenaire de croissance IA »** (pas « bras droit », pas « opérateur de croissance IA » ici : c'est le volet partenariat long terme). Lede : « On devient votre responsable IA externalisé. Au quotidien, on veille, on conseille et on fait évoluer vos agents, à vos côtés. » (« au quotidien », pas « chaque mois »).
- Copy des 3 gestes auditée par tribunal 3 agents (cohérence / ICP / voix). Enseignement clé : le copy « on veille / on conseille » était TIÈDE (décrivait ce qu'on fait, pas ce que le dirigeant ressent). Format à 3 étages (label/titre/sous-titre) rejeté = trop lourd. **Format final = titre-accroche court + 1 ligne concrète (2 niveaux)** : « Toujours devant » (On installe ce qui compte avant vos concurrents) · « L'esprit libre » (L'IA, c'est nous qui la portons, plus vous) · « Jamais seul » (Un allié qui connaît votre boîte, au quotidien). Arc émotionnel : avance concurrentielle → décharge mentale → allié.
- Prix : **1 500 CHF / mois** (PAS 2 500). Bandeau résultat identique aux étapes 1-2 (label empilé + prix Inter Tight orange).

**LES 3 ÉTAPES DE /offres SONT VALIDÉES.** Reste à intégrer les 3 mockups dans la vraie page prod vividflow.co/offres (fichiers : etape1 dans `vividflow-offres-modules.html`, etape2 dans `vividflow-etape2-final.html`, etape3 dans `vividflow-etape3-final.html`). Servis via `python3 -m http.server 8770`.

**Contexte :** le concurrent go.kalvi-ai.fr/faq a scrapé la structure /offres de Jonathan et l'a enrichie de modules interactifs. On s'en inspire (interactivité) sans copier (pas de garantie "50k€ ou remboursé", pas leurs 7 rôles). Voir [[feedback_audit_avant_imiter_concurrent]].