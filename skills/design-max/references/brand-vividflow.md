# Brand Profile : VividFlow

> Charge ce profil dès qu'un travail design/copy concerne VividFlow. Il fige l'identité pour ne pas la réinventer à chaque mockup. **Toujours identifier VividFlow vs Brvndlab AVANT d'agir : deux marques distinctes, stacks/ICP/copy non transférables.**

## Positionnement (verrouillé, SEO/meta)
- Phrase officielle : **« Solutions agentiques pour entreprises »** + **« agents opérationnels »**.
- VividFlow **implémente de l'IA opérationnelle en entreprise**, en **généraliste** (plus de focus immo).
- Site : **vividflow.co**.
- C'est une **agence IA**, pas un studio.

### Mots et tons interdits
- ❌ Jamais **« business »** (utiliser « entreprises »).
- ❌ Jamais **« studio »** (positionnement agence, pas studio créatif).
- ❌ Jamais **em-dash** (`—`) ni `--`. Virgules, deux-points, points, parenthèses.
- ❌ Mots-béquilles interdits : « truc », « chose », « machin », « bidule ». Trouver le mot précis (geste, signal, règle, moment, levier, mécanisme…).
- ❌ Français québécois interdit. Français de France uniquement.
- ❌ Pas de suppositions temporelles dans le copy (« ce soir », « demain »…). On ne sait pas quand le client lit.

## Voix & ton
- **Ton dirigeant, lisible en 3 secondes, zéro jargon.** Langage simple, orienté entreprise, non-jargony.
- Sur les écrans clés B2B : **less is more**, max 1 phrase entre le titre et le bouton. La valeur vient du silence.
- Premium « old money » : sobriété, jamais de hard-sell, pas de maths salesy.

## Direction artistique (decks & site premium)
- **Palette** : fond **crème** (true off-white, pas un beige saturé « cream AI default »), accent **terracotta `#E26137`**, accent secondaire **olive**.
- **Typographie** : display **Fraunces** (serif à caractère), body **Inter**, accents **mono**. Pairing serif + sans sur axe de contraste.
- **Signature** : « Présenté par VividFlow » / VividFlow en signature de bas de page.
- **Folio** : numéro de page en coin.
- **Motion** : hero cascade au load, scroll-reveal par section, animation per-card sur L'offre. Gated CSS, respecter `prefers-reduced-motion`. Pattern card-stack auto-rotate (5s).
- **Layout decks** : structure narrative validée (couverture → contexte/miroir → friction → projection → cockpit → déploiement → next). Cartes miroir « Ce qu'on a entendu / Ce qu'on installe » (2 temps, plus de 3).

## Écosystème produit
- **9 agents IA** : Amani, Mei, Akira, Nia, Sora, Imani, Kenzo, Aya, Zulu. Assets dans `PERSONA - AI AGENT/`. Pattern UI `agents-interactive.html` validé.
- Workspace local : `Documents/Claude AI/VividFlow/`.

## Règles de prod
- Itérer **sur la prod**, pas en mockups parallèles une fois une variante validée (patcher l'`index.html` prod + mesurer le DOM réel).
- Variante validée = scellée, ne pas relister en TODO.
- Section témoignage **Variant B** (cinéma plein cadre + modal étude de cas) validée mais **NE PAS** mettre en prod tant qu'il n'y a pas de vidéo cliente réelle.
- Déploiement : push + `vercel deploy --prod` manuel, puis **vérifier le live** avant de rendre la main. Lien preview cliquable en tête de réponse. Ouvrir les liens dans **Google Chrome** (`open -a "Google Chrome"`), jamais Safari.
