---
name: project_vividflow_faq_videos_home
description: "FAQ home vividflow.co (#faq) — 10 questions de /comprendre, chaque réponse ouvre une vidéo (lecteur Wistia), format details du site conservé"
metadata:
  node_type: memory
  type: project
  originSessionId: e36b2602-f661-40d5-ab17-c52cb8081ab9
---

FAQ de la home vividflow.co (`#faq` / `.faq-section` dans index.html du repo site-mockups).

**Refonte 2026-07-21** : l'ancienne FAQ avait 8 questions génériques IA « datées » (époque immobilier, réponses pas comme Jonathan voulait). Remplacées par les **10 vraies questions de la page [[project_vividflow_faq_videos]] `/comprendre`** (page « Plus de clarté avant votre appel », 10 vidéos), avec **une vidéo dans chaque réponse** au lieu du texte.

**Les 10 questions (ordre exact, source /comprendre)** : 1. Comment ça s'applique à mon activité ? · 2. Combien de temps pour avoir des résultats ? · 3. Mes équipes vont-elles être remplacées ? · 4. C'est quoi un employé IA ? · 5. Est-ce que mes données sont sécurisées ? · 6. Quelle est la différence avec Claude et ChatGPT ? · 7. Mon business est-il trop complexe à automatiser ? (reformulé en question le 2026-07-21, était une affirmation) · 8. Et si l'IA fait une erreur grave ? · 9. Combien ça coûte vraiment de travailler avec VividFlow ? · 10. Comment se passe la mise en place ?

**Implémentation** :
- **Format visuel FAQ du site CONSERVÉ** (exigence Jonathan « les mêmes formats de mon site ») : `<details class="faq-item">` + `<summary>` avec `.faq-q` et l'icône `.faq-icon` (le `+` qui devient `−` orange plein à l'ouverture, `.faq-item[open]`). Titre section « Questions *fréquentes* » inchangé.
- Les 10 items sont **générés en JS** (tableau `QUESTIONS`) dans `#faq-list`. La réponse `.faq-a` contient le **lecteur vidéo `.ph`** (repris tel quel de /comprendre, façon Wistia : vitrine autoplay muet + invite « Cliquez pour le son » + barre orange play/temps/scrub/volume/plein écran, logo vf).
- Vidéos = fichiers locaux **`site-mockups/videos/faq-1.mp4` … `faq-10.mp4`** (94 Mo total, + `videos/vf-logo.png`). Ce ne sont PAS des YouTube.
- **Chargement à la demande** (clé perf) : chaque video en `preload="none"` ; le lecteur n'est câblé (`wire()`) et la vidéo chargée QU'À l'ouverture du `<details>` (event `toggle`). Évite de charger 94 Mo au chargement de la page.
- **« GOLD » — ouvrir = play AVEC LE SON, fermer = coupe (2026-07-21)** : le `toggle` appelle `activateVideo(v,ph)` à l'ouverture → le « + » fait office de bouton play, la vidéo démarre du début AVEC le son (le clic d'ouverture du summary est un geste utilisateur → le son passe la politique autoplay ; sinon fallback muet + bouton « Cliquez pour le son » reste dispo). À la fermeture (`item.open===false`) → `v.pause();v.muted=true;v.loop=true;classList.remove('live')` = « ferme le clapet ». `activateVideo` coupe déjà les autres vidéos → une seule sonore à la fois même si plusieurs questions ouvertes. Vérifié : ouvert playing=true/muted=false/live=true, fermé paused=true/muted=true.
- Le reveal `vf-motion` (`.faq-section .faq-item`) ne casse pas l'affichage (items générés opacity 1 vérifié). Pas d'overflow mobile, vidéo visible desktop + mobile.

Source du contenu et du lecteur : `~/dev/site-mockups/comprendre.html` (page /comprendre, robots noindex). Lié à [[project_vividflow_faq_videos]].
