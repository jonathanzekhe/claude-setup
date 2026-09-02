---
name: project_brvndlab_tableau_base_vs_voix
description: "Tableau source de vérité Brvndlab - ce qui va dans la BASE de génération (expertise Jonathan, pour tous) vs VOIX PERSO (seconde brain)"
metadata: 
  node_type: memory
  type: project
  originSessionId: 429ff311-7ceb-4dfb-8ddc-eb51181af3ad
---

Source de vérité pour la base de génération de contenu Brvndlab. Établi ligne par ligne avec Jonathan. Pilote le prompt de génération (script/carousel/story). Voir [[project_brvndlab_generation_base_neutre_solide]].

**RÈGLE MAÎTRESSE de la neutralité : SIMPLE ET FACTUEL.**
Tout ce qui est neutre reste simple et vient avec des faits, dits simplement. La solidité neutre ne s'obtient PAS en AJOUTANT (tension, punch, figures) mais en ENLEVANT tout sauf le fait et la simplicité. Un fait dit simplement est solide en soi. C'est l'erreur corrigée : arrêter d'habiller, revenir au fait clair.

**LE TABLEAU (base = expertise universelle de Jonathan pour TOUS les clients | voix perso = laissée au client via sa seconde brain) :**

- HOOK — BASE : créer de l'IDENTIFICATION dès le départ, ne jamais laisser indifférent. Portes (aucune limite) : situation, circonstance, conséquence (vue à l'extérieur / chez l'ICP / perso), action, émotion, introspection, curiosité/intrigue. Deux leviers dosables : identification directe (se reconnaître) OU curiosité (ne pas comprendre, vouloir savoir). Être INGÉNIEUX, jamais mécanique (pas de formule "niche->résultat->situation"). | PERSO : choquer pour choquer / faire du gros pour rien, hooks à titre personnel (qui reviennent à Jonathan pas à l'ICP), le ton (punchy/doux/provocateur).

- STRUCTURE — BASE : faits clairs qui s'enchaînent dans un ordre logique, simplement. Fil logique qui tient. | PERSO : mise en scène, progression dramatique, montée/crescendo.

- SOLUTION / IA — BASE : amenée simplement et factuellement (ce que ça fait concrètement, en quoi ça change la situation). JAMAIS promo / catalogue de fonctionnalités ("elle identifie... elle prend en charge..."). | PERSO : la façon de la vendre, l'angle de persuasion.

- REGISTRE — BASE : français correct (on garde le "ne"), tutoiement soigné ("tu es" pas "t'es"), neutre-pro mature, français de France. | PERSO : familiarité, tics de langage, mots signature.

- FIGURES DE STYLE — BASE : AUCUNE (c'est ça la neutralité). | PERSO : antithèse "ni X ni Y", métaphore/parabole, triade rythmée, staccato, chute rhétorique, formule-choc, maxime, open loop, crescendo = TOUT au client.

**Problème résolu par ce tableau :** distinction juste = "expertise universelle de Jonathan (dans la base pour tous)" vs "voix personnelle (seconde brain)", PAS "neutre vs style". Une bonne règle de hook n'est pas du style perso, c'est une fondation d'expert qui marche pour tous.

**Cause de l'instabilité identifiée (audit) :** l'ancien prompt = ~3000 mots, 27 interdictions dont beaucoup répétées 3-4x, + 1 contradiction majeure ("sois tranchant/qui claque" VS "reste plat sans style") qui faisait trancher le modèle au hasard = un tir bon, un tir médiocre. Solution : prompt ~400 mots, principes POSITIFS, sans contradiction (base = simple et factuel, point), retirer ce que le code fait déjà (stripDashes/emoji).

**Process corrigé (leçon Jonathan) :** je dois générer et JUGER moi-même la régularité (plusieurs tirs) AVANT de livrer, pas faire tester Jonathan à l'aveugle. Base fondatrice = MÊME standard pour tous, jamais aléatoire.

**ALERTE prod partagée :** un collaborateur (ninorio12) déploie aussi sur la même prod Vercel depuis sa copie locale et peut ÉCRASER les déploiements. Vérifier `vercel ls brvndlab-app --prod` : si le dernier deploy n'est pas de nous, nos changements ne sont pas en ligne.
