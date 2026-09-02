---
name: feedback_brainstorm_portfolio_claude_notes_invite_retour
description: "Dans brainstorm-portfolio, toute note écrite par Claude (author claude) finit en appelant le retour de Jonathan"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 38a563a7-7de5-46a0-b538-86d73e5a8ad1
---

Dans le carnet [[project_brainstorm_portfolio_tool]] (brainstorm-portfolio), toute note rédigée par Claude (`author: claude`, donc en lecture seule) doit se terminer en invitant Jonathan à réagir : une question ouverte ou un appel à son retour. Le but est de boucler le workflow : Claude écrit → Jonathan lit et laisse un retour dans « Mots pour Claude » → il dit à Claude Code « j'ai fait un retour dans tel dossier » → Claude relit les commentaires et avance.

**Why:** Jonathan veut un dialogue, pas un monologue. Une note de Claude sans appel au retour casse la boucle ; il ne sait pas qu'on attend sa réaction.

**How to apply:** Un appel au retour automatique est rendu en bas de chaque note Claude (IdeaEditor branche lecture seule, filet doré « Dis-moi ce que tu en penses… »). En plus, quand j'écris le corps d'une note, je le termine par une vraie question ouverte contextuelle (modèle = la note « Santé de marque façon Oura » qui finit par « À trancher : … »). Voir [[feedback_brvndlab_titre_court_brainstorm]] pour le style concis.
