---
name: Communication coach vers client, double canal
description: Le coach a 2 canaux pour parler à ses clients élèves, le chat classique et la Note du jour qui apparaît dans le Dashboard du client.
type: project
---

Validé le 2026-04-08 par Jonathan : **le coach communique avec ses clients (élèves) via 2 canaux distincts**.

## Canal 1 : Chat coach ↔ client

Architecture identique au chat coach ↔ collaborateur (un chat par personne, style WhatsApp, avec possibilité de référencer des contenus via mini-cards attachées). Utilisé pour la conversation du quotidien : questions, réponses rapides, suivi, envois de liens.

- Temps réel via Convex
- Statuts WhatsApp (envoyé, livré, lu, 1 coche / 2 coches grises / 2 coches bleues)
- Peut contenir texte OU vocal OU les deux
- Accessible depuis la section Messagerie du client et du coach

## Canal 2 : Note du jour

Message spécial qui apparaît **dans le Dashboard du client**, pas dans son chat. C'est le message fort du coaching, celui que le client voit en arrivant le matin sur son Dashboard. Il apparaît dans une card hero avec la photo du coach, le waveform si c'est un vocal, et une transcription auto.

**Caractéristiques de la Note du jour :**
- Apparaît en grand dans le Dashboard du client, pas dans le chat
- Peut être du texte OU un message vocal OU les deux
- Peut être liée à un contenu spécifique (pastille "Liée à X") pour donner du contexte
- Transcription auto-générée si c'est un vocal
- Une seule Note du jour active à la fois (les anciennes sont archivées automatiquement dans l'historique)
- Le client peut marquer comme lue, répondre, ou ignorer

**Pourquoi 2 canaux et pas juste le chat :**
- Le chat est un flux, les messages passent, on perd l'important dans le bruit
- La Note du jour a une présence forte, elle ne bouge pas, le client est obligé de la voir
- C'est le différenciateur premium du coaching sur Brvndlab : un coach ne spamme pas, il laisse une note forte qui compte

## Composer du coach

Quand le coach écrit un message à un client, **l'interface de composition a un toggle** entre 2 modes :
- **Chat** (par défaut) : le message va dans le chat normal, apparaît dans la Messagerie du client
- **Note du jour** : le message va dans le Dashboard du client, remplace la Note du jour précédente qui passe en archive

Le coach peut choisir au moment d'écrire. Interface simple : un switch ou deux onglets en haut du composer.

## How to apply

- Ne jamais mélanger les deux canaux : un message est soit chat soit Note du jour, pas les deux
- La Note du jour a **priorité visuelle** sur le Dashboard, elle est le premier truc que le client voit après le header
- Le chat garde toute la discussion de détail, la Note du jour garde le message fort de direction
- Historique des Notes du jour conservé et consultable, pour que le client puisse revoir les recommandations passées
