---
name: Photo de profil pour les clients
description: Les clients de Brvndlab doivent pouvoir uploader leur propre photo de profil, comme Jonathan. Remplace les avatars à initiales dans gradient.
type: feedback
---

Validé par Jonathan le 2026-04-08 : **chaque client doit pouvoir uploader sa propre photo de profil**.

## Contexte

Dans les mockups actuels, les clients (Sarah, Alex, Emma, Léa, etc.) sont représentés par des avatars à initiales dans des gradients colorés (ex: "S" sur gradient pink-rose pour Sarah). C'est OK pour les placeholders des mockups, mais **dans l'app réelle il faut une vraie upload photo**.

Jonathan lui-même a sa photo `/jonathan.jpg` utilisée partout, mais les clients n'ont pas cette possibilité dans les mockups.

## Ce qu'il faut implémenter

### Dans les paramètres client
- Section "Profil" avec upload photo
- Preview ronde ou carrée selon le contexte
- Crop optionnel (ratio 1:1)
- Format accepté : JPG, PNG, WebP, max 5MB
- Stockage via Vercel Blob (ou Convex file storage)

### Fallback si pas de photo
Si le client n'a pas uploadé de photo, on garde l'avatar à initiales dans un gradient unique par personne (déterminé par hash du nom pour que ce soit stable, pas aléatoire).

### Affichage
Partout où un client apparaît dans l'app (Dashboard coach, Fiche membre, Submissions, Kanban, Messagerie, Partages de sections), la photo réelle remplace automatiquement l'avatar à initiales si uploadée.

## How to apply

- Dans tous les nouveaux mockups à partir d'ici, ne pas insister sur les avatars à initiales comme étant définitifs, mentionner qu'ils seront remplaçables par une vraie photo
- Lors de l'implémentation, prévoir un composant `<Avatar>` réutilisable qui gère les 2 cas (photo uploadée vs fallback initiales gradient)
- Onboarding client : inclure une étape optionnelle "Ajoute ta photo de profil" après la création du compte
- Respecter la règle "never modify existing code" : ne pas retoucher tous les mockups existants pour ajouter cette feature, elle sera gérée au moment de l'implémentation technique
