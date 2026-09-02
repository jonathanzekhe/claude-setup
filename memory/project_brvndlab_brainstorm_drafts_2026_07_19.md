---
name: brvndlab-brainstorm-drafts-2026-07-19
description: "Brouillon serveur du brainstorm (table brainstormDrafts, reprise auto cross-device), bouton Arrêter, fin sans saut brutal (bouton Voir le récap), chip sujet couleur funnel"
metadata: 
  node_type: memory
  type: project
  originSessionId: 26b311ed-ff18-48b0-9392-0c9b154ae853
---

Deuxième boucle brainstorming du 19/07/2026 (validée AskUserQuestion + tribunal 3 juges + superviseur 9/10), déployée prod (commit 314597a3) :

1. **Brouillon serveur** : table Convex `brainstormDrafts` — UN brouillon actif par personne ET par workspace (`clerkUserId` + `ownerClerkUserId` via resolveOwnerClerkUserId ; personnel, pas partagé aux collaborateurs). Champs : mode, messages JSON, baseSubject, lockedNiveau, resumeAngleId (retravail en cours), funnel, scriptDir/storyDir, clarity, attachments. Sauvegarde debounce 600ms sur `messages` (~2 writes/tour de chat), reprise AUTO au retour dans explore (même mode, pas de ?q= ni ?resume=), anti-race (messagesLenRef + draftHandledRef marqué au premier envoi), auto-cicatrisant (pas de .unique(), doublons résorbés). Effacé à la validation et au stop. DÉCISIONS Jonathan : reprise auto (pas de proposition), serveur cross-device, un nouveau chat d'un autre mode écrase l'ancien brouillon (assumé).
2. **Garde de sortie** (REMPLACE le bouton « Arrêter », rejeté par Jonathan « pas fan ») : brainstorm engagé (messages>1, pas conclu) → modal « Quitter le brainstorm ? » : Rester / Quitter (sauvegarde immédiate du brouillon puis navigue) / lien discret rouge « Abandonner ce brainstorm » (clearDraft + stoppedRef anti-résurrection). Quatre couches d'interception : clic `<a>` en capture (Cmd/Ctrl/Shift-clic laissé passer), **patch de router.push/replace sur l'instance partagée App Router** (catch-all : cloche de notifications, drawers, tout bouton qui redirige — bug remonté par Jonathan, la cloche passait au travers), flèche arrière (pushState ré-armé), fermeture d'onglet (beforeunload). La reprise auto reste le filet.
3. **Fin de brainstorm** : plus de router.push auto (script/carousel/story) — l'angle est sauvegardé, la phrase de clôture est FUSIONNÉE au dernier message de Lya (pas un message séparé qui l'éclipse) et un bouton « Voir le récap » remplace le composer. `updateAngle.catch(() => createAngle)` : un angle retravaillé supprimé entre-temps ne bloque jamais. Mode post inchangé (écran résumé).
4. **Chip sujet en retravail** : couleur du funnel de l'angle d'archive (TOFU #6FA8DC / MOFU #E89A4E / BOFU #DD7C6C), ambiance du mode inchangée.

Limites assumées : réponse IA in-flight perdue si on quitte pendant la génération ; flash possible de l'écran de direction avant reprise. Lié : [[brvndlab-brainstorm-loop-2026-07-19]].
