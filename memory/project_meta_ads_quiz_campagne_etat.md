---
name: project-meta-ads-quiz-campagne-etat
description: "État campagne Meta Quiz Dirigeants Suisse Romande — 3 pubs publiées PAUSED, verrou sécurité levé, jeton systok déplacé"
metadata: 
  node_type: memory
  type: project
  originSessionId: f7f9ffd7-90d5-4ea5-8dff-348591673eb4
  modified: 2026-08-03T22:08:04.080Z
---

Campagne Meta « Quiz - Dirigeants Suisse Romande » (compte VividFlow Agency act_2107713119537689), état au 2026-08-03 :

- **3 pubs publiées en PAUSED** (review Meta) : Quiz 1 = 120245774772680662 (vidéo 1082028124156992), Quiz 2 = 120245778922050662 (vidéo 1017883297698599), Quiz 3 = 120245778958280662 (vidéo 1494004045865471). Chacune : 3 textes principaux + 3 titres + description fixe « Pour dirigeants d'entreprises romandes », CTA En savoir plus, formulaire lead 4001727850128885, page Jonathan Zekhe 102076501781263 + IG lié. Améliorations Advantage+ toutes désactivées.
- **Verrou sécurité Meta (code 31/3858385) LEVÉ** le 03/08 via panneau « Commencer l'authentification » (code e-mail 6 chiffres sur jonathanzekhe.business@gmail.com), déclenché en tentant une publication depuis un navigateur Playwright connecté avec la session de Jonathan. L'API identité Jonathan (Zernio/Pipeboard) refonctionne pour créer des pubs.
- **Jeton systok** (utilisateur système, n'expire pas, immunisé contrôle sécurité) : l'ancien scratchpad VPS /tmp/claude-0/... a été purgé ; jeton restauré dans `/root/.hermes/secrets/meta-systok.txt` (VPS 76.13.52.163, chmod 600).
- **Adset « Broad Suisse - Quiz » 120245768469890662** : 40 CHF/jour, ciblage cantons romands (GE/VD/VS/FR/NE/JU), 28-60 ans, SANS filtre langue. ⚠️ La publication UI a écrasé une fois ce ciblage (brouillon « Audience » périmé) ; réappliqué par API ensuite. Vérifier le ciblage par API après toute publication UI.
- **Ne pas toucher** : brouillon « Statique 14.0 » (modif de nom non publiée, pas de nous) laissé tel quel.
- **LANCÉE le 03/08 à 22h21** sur feu vert explicite de Jonathan (« lance ») : campagne + adset + 3 pubs ACTIVE, pubs en IN_PROCESS (re-review avant diffusion). Budget 40 CHF/jour TOTAL (un seul adset partagé). Brouillon parasite Statique 14.0 abandonné le même soir.
- **Formulaire v2 « 1078871088156810 »** branché sur les 3 pubs le 03/08 soir : l'ancien (4001727850128885) n'affichait AUCUN bouton vers le quiz sur l'écran de fin (leads perdus dans les pubs concurrentes). La v2 a un écran de fin avec bouton « Faire le diagnostic » → quiz.vividflow.co. Leçon : toujours créer les formulaires Meta avec thankYouTitle/Body/ButtonText/ButtonType/WebsiteUrl (Zernio, forme legacy), le followUpActionUrl seul ne suffit pas. Objectif validé : 30K CHF/mois = 6 clients = 20 appels = 40 leads.
- Suivi convenu : jours 1-4 observation sans toucher (phase d'apprentissage), bilan jour 5, seuil d'alerte coût/lead ~35-40 CHF (objectif ~31 CHF : 9 leads/sem sur 40 CHF/j). Fiche textes : https://claude.ai/code/artifact/78f6a113-6955-4c61-8d0d-f79450e38ef7
