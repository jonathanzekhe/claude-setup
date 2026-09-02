---
name: project-brvndlab-audit-chaine-scripts-2026-08-17
description: "Audit 17/08 de la chaîne scripts — patterns IA récurrents, causes mécaniques, décisions validées (fluidité + ponts globaux), chantiers en attente de go"
metadata: 
  node_type: memory
  type: project
  originSessionId: c99c1a5f-8ac2-4c26-aa2c-c338404e736f
  modified: 2026-08-18T13:18:40.658Z
---

Audit du 17/08/2026 sur la chaîne de génération de scripts Brvndlab (17 aiOriginal scannés du 31/07 au 17/08).

**Patterns IA confirmés (dans les générations brutes, AVANT les corrections de Jonathan) :**
1. Hooks violant des interdits de brain confirmés 18x (généralité de groupe, question directe) : récurrent sur plusieurs semaines.
2. Staccato / séries sèches ("pas de cash, pas d'équipe, pas de survie") : le tic IA n°1 que Jonathan corrige à chaque refonte.
3. Jargon anglophone (LTV, referrals, closing, pitcher) réapparu 1h15 après l'apprentissage de l'interdit.
4. Verbatims adressés collés sans recadrage du pronom (le "tu" bascule viewer→prospect).
5. Longueur au-dessus du calibre appris (brain dit 63-100s, base autorise 2 min).

**Causes mécaniques :**
- L'éditeur ([route.ts:776](src/app/api/generate-script/route.ts)) et le critique (:869) reçoivent brainBlocks.profile mais JAMAIS hardRules (interdits). Seule la génération (:407, :449) les a. La dernière passe qui écrit ne connaît pas les règles → régressions systématiques.
- Les triades isolées sont whitelistées (:655 "restent humaines, non flaguées").
- L'optimiseur de brain converge (anti-inflation) : 3 refontes le 17/08 → 1 seule note nouvelle.
- Aucune règle de pont entre sections dans la base (seul le juge de fil détecte un "saut sans transition" quand un fil existe).

**Règle de discernement CRITIQUE apprise ce jour :** toujours séparer ce que Jonathan a écrit à la main (editedSections, ex. "45 minutes" = son vécu) de ce que l'IA a produit (aiOriginal, jamais écrasé). Ne JAMAIS flaguer ses corrections manuelles comme des fautes. Après une refonte, sortie IA et retouches manuelles se fondent dans la même couche → attribution par recoupement aiOriginal/snapshots.

**Décisions validées par Jonathan (17/08) :** fluidité des phrases + ponts de section en section = règles de BASE pour TOUS les utilisateurs (retirer la whitelist staccato). Le registre (soutenu/relâché, jargon ou pas) reste par profil dans la brain.

**DÉPLOYÉ le 17/08 soir (commits 500fbfd9 + c0972f7e, Convex + Vercel, vérifié live) :** fluidité globale (détecteur findDrySeries + juge + éditeur + génération), ponts obligatoires entre sections, interdits de brain jugés comme fautes par le juge, brain non silencieuse (log Vercel), discernement cause-unique dans l'optimiseur (une réécriture pour le RYTHME ne bannit pas les mots qu'elle emporte), mutation brain:adminDeleteNoteById (CLI admin).

**Fausse note "bannir jargon (LTV, referrals, funnel)" SUPPRIMÉE de la brain de Jonathan** (il ne l'a jamais dite ; l'optimiseur l'avait inférée à tort de sa correction staccato du script delivery). 31 notes restantes, vérifié.

**Décisions Jonathan 17/08 :** durée des Shorts = LIBRE, portée par la valeur, jamais de calibre imposé ("laisser le flow se faire", 45 s comme 1 min 30) — chantier calibre ABANDONNÉ, la note calibres/fact reste une habitude douce. Chantier encore OUVERT : recadrage des verbatims adressés (le "tu" qui bascule) — Jonathan n'a pas compris la question, à réexpliquer avec un exemple avant/après.

**DÉPLOYÉ 17/08 soir, 2e vague (commit d52115dc, Convex + Vercel, vérifié live) :** (1) Garde-fou dire/faire dans refonte-content + generate-script chat : détecteur CLAIMS_REWRITE, un rejeu forcé, sinon message honnête "rien n'a été modifié" ; les réponses tronquées avec blocks/apply n'affirment plus jamais une action non appliquée. (2) Veilleur de cohérence proactif : route /api/coherence-check (juge UNIQUEMENT les coutures autour d'une section corrigée à la main, seuil haut, jamais le texte du créateur) ; branché sur la fermeture d'édition manuelle dans script/page.tsx (coherenceWatchRef) ; ouvre le panneau refonte tout seul (seed sessionStorage refonte_chat:script:<titre>) ou pousse l'événement brvnd:refonte-proactive si déjà ouvert ; RefonteInterview écoute cet événement. Lya signale, Jonathan décide. Verbatims adressés (option A cadrage) déployés aussi (1f5dcfbd).

**3e vague 17/08 nuit (commit aa523c32, Convex + Vercel, vérifié) :** bug "brouillon écrasé" élucidé : la régénération d'un MÊME angle réutilise l'item existant (anti-doublon voulu, findByAngleFormat) et remplaçait sa description SANS snapshot → la version précédente (corrections manuelles comprises) était détruite. Fix : snapshotVersion(reason "avant régénération") avant chaque updateContent de régénération. Récupération : la version condensée écrasée de "Un bon client" (332 mots, extraite du dump de session 18:16) réinjectée dans contentItemVersions via nouvelle internalMutation contentItems:adminInsertVersion (garde-fou expectedClerkUserId). RÈGLE : un angle+format = UN item ; pour "comparer deux versions", c'est l'historique de versions, pas deux brouillons.

**BOUCLE CORRECTIVE 18/08 matin (5 commits a8a88f8c→8dd2a872, tribunal 3/3 SHIP, déployé Vercel, vérifié live) :** les 3 pages (script/carousel/story) ont désormais le MÊME contrat : snapshot avant régénération d'angle ET à chaque refonte (snapshottedRef supprimé partout), autosave avec échec visible + stop à 3 + retry au clic (story : saveState simple + debounce 1,4s + persistance sessionStorage), erreurs d'affinage/pipeline/régénération affichées avec le message serveur (quota 429 compris), veilleur de cohérence branché sur les 3 points (manuel="me" coutures seulement, IA="ai" relecture copywriter franche) via /api/coherence-check généralisé 3 formats. Garde-fou dire/faire réécrit dans src/lib/ai/claimsRewrite.ts (piège JS : \b ne marche pas avec accents/apostrophes courbes → WB custom) + suite de tests claimsRewrite.test.mjs (24 cas, tester le VRAI module compilé, jamais reconstruire la regex en parsant le source). Convex non touché ce matin (pas de deploy nécessaire).

**18/08 après-midi (commits 8cefe177 + 7dd968c2, tribunal SHIP, live vérifié) :** (1) Veilleur → PASTILLE rouge sur le bouton Refondre (décision Jonathan : jamais d'ouverture forcée du panneau, le message attend dans la conversation, ouvrir consomme la pastille), 3 formats. (2) Bug "message fantôme" élucidé : la conversation refonte est persistée en sessionStorage PAR ONGLET (survit à la déconnexion), sans péremption, clé par TITRE, et le panneau n'affiche que la DERNIÈRE réplique IA → rouvrir des heures plus tard rejouait une vieille réponse hors contexte comme si elle était neuve. Fix : péremption 45 min (savedAt), clé par itemId (prop storeId), seeds du veilleur alignés. (3) RITUEL DE PREUVE DE DÉPLOIEMENT : après chaque deploy, `npx vercel inspect app.brvndlab.com` doit montrer l'URL du deployment attendu, et le clone propre doit logger le SHA attendu AVANT de déployer : ce rituel a attrapé en réel un deploy parti sans le commit (push bloqué par le WIP d'une autre session, clone sur l'ancien SHA). Toujours vérifier le SHA du clone ET l'alias du domaine.

**Leçon coordination multi-sessions :** une autre session Claude travaille souvent dans le même worktree ; jamais de stash/checkout globaux (mon stash pop a réappliqué son vieux stash "wip-avant-plus-flat" → conflit) ; pour un deploy Vercel déterministe, cloner GitHub main proprement dans le scratchpad et déployer depuis le clone.

Voir [[project-brvndlab-chaine-copywriting-scellee]] et [[feedback-refonte-scripts-discernement-recommandations]].
