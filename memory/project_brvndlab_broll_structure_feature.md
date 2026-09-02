---
name: brvndlab-broll-structure-feature
description: Feature à brainstormer — génération de dossiers B-Roll personnalisés depuis le Brand OS (socle commun B2B + surcouche niche) + système validé pour les B-Roll perso de Jonathan
metadata: 
  node_type: memory
  type: project
  originSessionId: dbad42b9-aafc-4ed5-a0ab-6c3dd14adcc1
  modified: 2026-08-02T10:33:09.005Z
---

Session du 2026-08-02. Source d'inspiration : workflow B-Roll d'un head of content (vidéo + captures des dossiers : Chilling with Friends, Traveling, Sport, Client Breakdown, Gym, On the Phone, Payments, Day in the Life, etc.).

**Principe scellé (pour Jonathan ET la future feature) :**
- 1 dossier = 1 scène de vie réutilisable. Jamais de classement par date ou par vidéo.
- 5-6 clips différents par scène, tournés en UNE session (angles/actions variés), en rotation pendant des mois.
- Deux vitesses d'usure : scènes rares (Payments, Voyage) = on tourne une fois, re-tournage seulement si la vie change ; scènes à usure rapide (téléphone, laptop) = refresh mensuel (session 10 min).
- Routine mensuelle 15-20 min : tourner frais → ranger → archiver les plans trop vus (sous-dossier Archive/ par scène). Garde-fou : >10 plans actifs dans un dossier = on archive.

**Idée feature Brvndlab (à brainstormer dans un chantier dédié, PAS encore validée en spec) :**
- Générer la structure de dossiers B-Roll d'un client depuis son Brand OS (niche, audience, angles, vécu).
- Vision Jonathan : un SOCLE COMMUN à tous les clients B2B (family & friends, téléphone, laptop, scènes de proximité — l'ICP est 100% B2B et a besoin de créer de la proximité) + une SURCOUCHE nichée générée par le Brand OS (ex. coach sportive = plusieurs dossiers gym/coaching).
- Le différenciateur : le lien dossiers B-Roll ↔ angles de contenu du Brand OS (le client sait QUOI filmer pour nourrir ses angles). La routine mensuelle devient le mode d'emploi dans l'app.
- Rush est le produit naturel pour héberger ça ([[rush-video-library]]).

**Ajout validé Jonathan (même session) :** la feature doit avoir un CHAT GUIDÉ façon Lya (comme brainstorming/refontes) quand on arrive dans la section B-Roll : il pose des questions profondes qui creusent la vie du client scène par scène. « Décris ton mois type » est trop plat : il faut aiguiller (famille par personne ? sport lesquels ? rituels ? transitions ?). Cible : entre 12 et 20 dossiers par client.

**Liste perso de Jonathan SCELLÉE (17 dossiers, prototype de la feature) :**
- Usure rapide (refresh mensuel) : Deep Work, Au téléphone, Tournage
- Business : Coaching (visios + appels d'accompagnement), Clients en physique, Paiements, Réflexion
- Vie : Mon fils, Ma femme, Amis, Gym, Course, Lecture, Balades, Prière, Routine matin
- Liant : Transitions (arrivées, voiture, café, fermer le laptop)
- Chaque dossier a un sous-dossier Archive/ pour les plans trop vus.

**CATALOGUE MAÎTRE SCELLÉ + LIVE (02/08, commit d114b41d, deploy prod OK) :** 49 scènes / 8 catégories dans src/lib/rushBrollTemplate.ts (Situations de travail 6, Business 12 dont « Le geste métier », Émotions 2, Sport et corps 8, Vie et proximité 8, Rituels 6, Déplacements 4, Storytelling 3 : Jeunesse/Gros plans/Quotidien). Jonathan a RETIRÉ Montage et Transitions (confusion / « personne ne se filme ouvrir une porte »), renommé Day in the Life→Quotidien et Détails→Gros plans. Modale « Modèles B-roll » pick and choose dans les dossiers B-rolls de Rush (détection par nom en remontant les parents, dédoublonnage « Déjà créé », teinte par catégorie). Fix inclus : « Nouveau dossier » crée dans le dossier ouvert, plus à la racine. La liste perso 17 dossiers ci-dessus = ancienne itération, remplacée par le pick and choose dans le catalogue. Non vérifié : clic réel dans l'UI derrière Clerk (smoke 307 OK).
