---
name: Brvndlab content tracking and notifications
description: Matching automatique des vidéos publiées avec les cards Brvndlab via transcript uniquement. Pas de tag dans les descriptions. Notifications multi-canal validées MVP.
type: project
---

## Détection automatique des publications

**Décision validée 2026-04-08 :** Brvndlab détecte automatiquement quand un contenu planifié a été publié sur YouTube/Instagram/TikTok. Aucune intervention manuelle du coach.

### Méthode de matching

Pas de tag invisible dans les descriptions (Jonathan refuse explicitement, ça ferait pas pro). Le matching se fait via 3 signaux combinés :

1. **Transcript sémantique** (priorité) : Brvndlab pulle le transcript auto-généré par YouTube après publication, compare avec le script écrit ou les key points stockés dans Brvndlab. Similarité sémantique via embeddings, pas comparaison de mots exacts. Gère le cas "script complet" et le cas "juste des key points".
2. **Titre** (renfort) : fuzzy match entre le titre de la vidéo publiée et le titre du contenu dans Brvndlab.
3. **Date/heure** (renfort) : fenêtre de ±2h autour de la date planifiée.

Score combiné :
- >80% : auto-link, card passe en Publié sans intervention
- 50 à 80% : notification "On pense que cette vidéo correspond à X, confirme ?" avec Oui/Non
- <50% : la vidéo est ajoutée comme contenu imprévu, rattachable manuellement

### Fallback quand pas de transcript

Pour les Reels/TikTok visuels sans voix, carousels Instagram, stories : retombe sur titre + date uniquement. Ou bouton manuel "J'ai publié, voici le lien" dans la fiche contenu.

### Fréquence du polling

Un cron tourne toutes les 15 minutes, check les nouvelles publications via YouTube Data API, Instagram Graph API, TikTok Display API. OAuth du compte du coach fait une seule fois au setup.

---

## Notifications (DERNIÈRE étape du SaaS)

**Décision Jonathan 2026-04-08 :** Les notifications sont la DERNIÈRE étape du SaaS, à faire APRÈS toutes les autres sections (Dashboard complet, section COACH, Analytics, Veille, Journal, Recherche). On avance sur tout le reste d'abord.

**3 niveaux de notifications** à implémenter à la fin :

### 1. Notifs in-app (cloche)
- Badge rouge sur une cloche en haut à droite quand il y a des messages non lus ou des alertes
- Liste des notifs au clic, avec lien vers la fiche concernée
- Effort : quelques heures de dev
- Coût : 0

### 2. Notifs par email (via Resend ou Postmark)
- Email envoyé quand un message arrive et que l'utilisateur n'est pas connecté à Brvndlab
- Template simple : aperçu du message + bouton "Voir dans Brvndlab"
- Effort : 1 jour de dev
- Coût : ~10€/mois, gratuit sous 3000 emails/mois

### 3. Notifs push mobile via PWA
- Progressive Web App : Brvndlab ajoutable à l'écran d'accueil depuis le navigateur
- Notifications push natives iOS (16.4+) et Android, exactement comme une vraie app
- Pas besoin de faire une app iOS/Android native, pas besoin d'App Store, pas besoin de 99$/an Apple
- Effort : 2 jours de dev
- Coût : 0

### Cas d'usage déclencheurs
- Nouveau message sur une fiche contenu (chat collaborateur)
- Card déplacée de "Montage" vers "Prêt à programmer" par un collaborateur
- Publication détectée automatiquement par le matching transcript
- Match incertain nécessitant confirmation du coach
- Commentaire/feedback d'un coach sur la fiche d'un client (section COACH, plus tard)

### Pourquoi pas d'app native

Jonathan n'a pas besoin d'une app iOS/Android native. La PWA couvre 100% des cas d'usage mobile, coûte 0€, se déploie en minutes, et les utilisateurs modernes acceptent ça très bien (exemple : Linear, Height, Notion). On garde la flexibilité d'ajouter une app native plus tard si jamais un besoin émerge.

## How to apply

- **JAMAIS** proposer à Jonathan un système de tag/code/étiquette à coller dans les descriptions des plateformes. Il a refusé clairement.
- **TOUJOURS** privilégier le matching transcript pour la détection automatique.
- Pour la partie collaboration et chat, prévoir d'emblée les 3 canaux de notification (in-app, email, PWA push). Ne pas proposer le chat sans notifs, ça n'a pas de sens d'avoir un chat que personne ne voit.
