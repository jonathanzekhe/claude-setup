---
name: reference-e2e-robot-brvndlab
description: "Procédure E2E navigateur sur app.brvndlab.com avec le compte robot (Clerk sign-in token consommé par programme), pièges connus et état du compte"
metadata: 
  node_type: memory
  type: reference
  originSessionId: c99c1a5f-8ac2-4c26-aa2c-c338404e736f
  modified: 2026-08-18T10:53:41.010Z
---

**⚠️ 27/08/2026 — COMPTE SUPPRIMÉ de Clerk** : `audit.robot+brvndlab@vividflow.co` ne répond plus (API Clerk : aucun utilisateur pour cet email, sign-in token en 404). Toute la procédure ci-dessous est inopérante tant que le compte n'est pas recréé et réinvité comme collaborateur viewer.

Procédure validée le 18/08 pour tester app.brvndlab.com en session réelle SANS toucher aux sessions de Jonathan :

1. **Jamais le profil Playwright MCP partagé** (mcp-chrome-085981e) : il porte les sessions LinkedIn + Clerk actives de Jonathan. Toujours un Chromium isolé via script Playwright standalone (npm i playwright dans le scratchpad).
2. **Connexion compte robot** audit.robot+brvndlab@vividflow.co (Clerk user_3HsAzOydtsA7VbnyE1jpWDjdEkJ) : créer un sign-in token via l'API Clerk (`POST /v1/sign_in_tokens`, clé CLERK_SECRET_KEY dans brvndlab-app/.vercel/.env.production.local), puis le consommer PAR PROGRAMME dans la page : `window.Clerk.client.signIn.create({strategy:"ticket", ticket})` + `Clerk.setActive`. Le paramètre d'URL `__clerk_ticket` est IGNORÉ par la page de connexion maison, et le login mot de passe déclenche une vérification par code email Clerk (illisible côté backend : la table Convex loginCodes sert un AUTRE flux et reste vide). Le ticket contourne le code par conception.
3. **ÉTAT DU COMPTE ROBOT (mis à jour 26/08)** : il est désormais collaborateur EDITOR (rôle métier headofcontent, scope content_and_calendar) du compte de Jonathan — il PEUT écrire (vérifié en réel sur /todo le 26/08 : création acceptée). Les tests « rejet lecture seule » ne sont plus possibles avec ce compte ; toute écriture de test doit être NETTOYÉE immédiatement. Historique : il était VIEWER du compte de Jonathan (_diagAccess.inviteRobot). resolveEffectiveContext le rattache au compte de Jonathan en lecture seule → TOUTE mutation d'écriture (contentItems:create...) est rejetée "Accès en lecture seule". Parfait comme garde-fou (impossible de polluer les données de Jonathan), mais les tests de PERSISTANCE (autosave qui aboutit, snapshots) sont impossibles avec ce compte tant qu'il est viewer. Pour les tests d'écriture il faudrait le sortir de la collaboration (_diagAccess.revokeRobot) et vérifier son autorisation d'accès propre, décision à valider avec Jonathan.
4. **Écrire un script de test sans IA** : semer sessionStorage `script_generated` (JSON ScriptData avec sections) puis ouvrir /brainstorming/script : l'éditeur s'ouvre avec le contenu semé. Crayon = bouton aria-label "Éditer le texte à la main" / "Terminer l'édition".
5. Vérifié en réel le 18/08 : le veilleur de cohérence fonctionne de bout en bout (édition manuelle cassant un pont → POST /api/coherence-check 200 → panneau refonte s'ouvre SEUL avec un message qui cite le passage, nomme les sections et propose sans imposer) ; le badge "Sauvegarde impossible, clique pour réessayer" apparaît après exactement 3 tentatives échouées. Hors ligne, Convex NE rejette PAS : il met en file d'attente (badge d'échec = rejets serveur uniquement, pas de perte réseau).
6. **Trouvaille UX à traiter un jour** : un collaborateur viewer peut ouvrir l'éditeur, taper du texte et voir "Sauvegarde impossible" au lieu d'un vrai état lecture seule (le crayon ne devrait pas lui être proposé).

Voir [[project-brvndlab-audit-chaine-scripts-2026-08-17]].
