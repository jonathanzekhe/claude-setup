# Brand Profile : Brvndlab

> Charge ce profil dès qu'un travail design/copy concerne Brvndlab. Il fige l'identité produit. **Toujours identifier VividFlow vs Brvndlab AVANT d'agir : deux marques distinctes.**

## Produit
- **Micro-SaaS « personal brand OS »** : analytics, content research, suivi clients.
- App : **app.brvndlab.com**. Mockups : **brvndlab-mockups.vercel.app**.
- **Brand OS = source de vérité centrale.** Tous les modules consomment le Brand OS, jamais isolés.
- ICP : entrepreneurs / agences / infopreneurs / consultants / coaches. **Pas les créateurs lambda ni entertainers.**

## Voix & ton (verrouillé)
- **Toujours « on » / « nous », jamais « je ».** Brvndlab est une entreprise de consulting, pas un solo.
- **Ton SaaS mature**, comme Linear / Notion / Vercel. Forme « vous ». Jamais de rôles spécifiques en public, pas de maths salesy.
- **Communication chirurgicale mais humaine** : chirurgical via le Brand OS (identité), humain = baseline zéro pattern IA.
- ❌ Jamais **em-dash** (`—`) ni `--`.
- ❌ Mots-béquilles interdits : « truc », « chose », « machin », « bidule ». Mot précis only.
- ❌ Français de France uniquement (pas « gym », « magasiner », « canceller »…).
- ❌ Pas de suppositions temporelles (« ce soir », « demain »…).
- ❌ Jamais inventer une feature / un chiffre / un concept sans validation explicite.

## Design system
### Light : Frosted Bento
- Background : `#EEF0F4`
- Cards : `bg-white/80 backdrop-blur-lg rounded-[28px]`
- Accent : `#f97316` (orange-500)
- Texte primaire : `#1A1A2E` · secondaire : `#6B7280`
- Ombres : `shadow-xl shadow-slate-200/50`
- Nav active : point orange + `text-[#f97316]`

### Dark : brainstorm palette
- Background : `#0A0A09` (jamais pur noir).
- Cards : légèrement plus clair (`bg-white/5` à `bg-white/10`), bordures `white/10`.
- Texte : pas blanc pur (`#E5E5E5`–`#F5F5F5`).
- Accent : orange.
- Toggle clair/sombre via `ThemeProvider` + localStorage + guard FOUC. Réglage dans Settings › Apparence.
- **Jamais d'override CSS global** `[data-theme="dark"] .bg-X` pour patcher en bulk. Migration page par page avec validation visuelle.

### Radius hierarchy (ratio 2x, validé)
- Cards : **28px**
- Boutons : **16px**
- Badges / pills / status : **8px** (`rounded-lg`). Jamais `rounded-md` sur badges.

## Règles UI/UX core (checklist 6/6 sur chaque écran)
1. Dynamique à l'arrivée. 2. Intuitif. 3. Épuré. 4. Minimaliste. 5. Dynamique en interaction. 6. **Skeleton loading systématique.**
- **Zéro redondance** : aucune info répétée sur une même page (compteurs, titres, labels d'onglet, statuts). Avant de livrer : « qu'est-ce que je peux supprimer ? ».
- **Pas d'avatars** (pastilles d'initiales) sur leads/prospects/clients/transactions. Avatars réservés aux collaborateurs dans Messaging.
- **Pas de logos officiels** de plateformes externes (Instagram/YouTube/TikTok) dans l'UI dynamique : disque coloré + initiale. Exception : `/integrations`.
- Référence composants : **21st.dev** (à consulter systématiquement), inspiration visuelle **themochi.app**.

## Sémantique métier
- **Funnel colors** : TOFU = **bleu**, MOFU = **amber** (`text-amber-700`), BOFU = **rouge** (`red`). Cohérence globale obligatoire.
- **KPIs business** : CA généré, Leads, Conversion, **Cash collecté**. ❌ Jamais « panier moyen ».
- Pricing : **149 / 349 / 749 €**, annuel −20 %. Pas de tier « lite / basique / découverte » : valeur réelle dans les 3, cadrer par stade (solo / founder / équipe).

## Mode de travail
- Jonathan = QA, moi = exécution UX/front. Architecture LLM gelée.
- Mockups = structure + logique + copy + flow à valider, **pas** le CSS final (refait en phase UX 21st.dev).
- **Jamais deploy prod sans validation explicite** (« tu penses quoi ? » ≠ autorisation). Plusieurs mockups preview → validation → prod.
- Quand Jonathan choisit une variante d'un mockup que j'ai construit : **reproduire pixel par pixel**.
- **Brvndlab ne déploie PAS sur push GitHub** : `vercel --prod --yes` manuel, puis **vérifier le live** (prod = `main`). Lien preview cliquable en tête. Ouvrir dans **Chrome**.
- Sur tout change structurel : entrée Changelog + redéploiement de la doc CTO `brvndlab-stack.vercel.app`.
