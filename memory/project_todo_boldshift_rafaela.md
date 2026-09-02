---
name: project-todo-boldshift-rafaela
description: "todo-boldshift.vercel.app = clone du deck To Do List (DA Atelier) pour Rafaela (Coach, gauche) + Jonathan (Associé, droite), couleurs Bold Shift, Convex dédié clever-lion-641"
metadata: 
  node_type: memory
  type: project
  originSessionId: ec3aac4b-6967-4fe2-a457-b8c0cd96c898
  modified: 2026-08-19T09:52:28.642Z
---

**To Do List Rafaela & Jonathan (Bold Shift Collective)** — https://todo-boldshift.vercel.app/

- Clone exact du deck todo-vf ([[project-todo-vf-thomas-jonathan]]) : mêmes fonctions (objectifs semaine/mois/6 mois, santé, allocation obligatoire, drag & drop, photos, archive, temps réel Convex), même structure DA « Atelier ».
- Personnes : `rafaela` (nom Rafaela, rôle Coach, colonne GAUCHE, initiales RA) et `jonathan` (rôle Associé, colonne droite). Rafaela = femme de Jonathan, coach sportive + nutritionniste, business Bold Shift Collective ([[project-pulp-saas-fitness-duo]]).
- Couleurs = Data OS / mood board Bold Shift : clair crème #F6F1E9, encre #241A12, brand terracotta #C75C4E (knob, boutons Ajouter, badge) ; sombre chaud #0C0C0B/#141312, brand #CB6242 ; santé ok #1E7A4D/#4FAE7C, warn #B87514/#D8A24A, bad = terracotta. Favicon = logo BLEU Bold Shift (monogramme B/S, `logo-bleu.png` du moodboard, PAS la version terre) dans src/app/icon.png.
- Sources DA : https://boldshift-moodboard.vercel.app (palette + logos), https://dataos-boldshift-refonte-preview.vercel.app (Data OS Rafaela, tokens clair/sombre).
- Infra : repo ~/dev/todo-boldshift ; Convex dédié `clever-lion-641.eu-west-1` (team jonathan-zekhe, projet todo-boldshift ; dev = fearless-eel-298) — SÉPARÉ du board Thomas (accurate-shepherd-352). Projet Vercel `todo-boldshift`. Déploiement : `npx convex@1.42.1 deploy -y` puis `vercel deploy --prod --yes`. `.env.local` ET `.env.production` doivent pointer sur clever-lion-641 (le .env.local créé par `convex dev --configure` pointait sur le dev et prime au build Next).
