---
name: project_brvndlab_generation_base_neutre_solide
description: Règles fermes de Jonathan sur la base de génération de contenu Brvndlab (script/carousel/story)
metadata: 
  node_type: memory
  type: project
  originSessionId: 429ff311-7ceb-4dfb-8ddc-eb51181af3ad
---

Exigences fermes de Jonathan sur la GÉNÉRATION de contenu (script/carousel/story), à ne JAMAIS oublier. Voir [[project_brvndlab_seconde_brain_optimisation.md]].

**La base doit être NEUTRE-SOLIDE, jamais fade, jamais stylée.**
- SOLIDE = clair, vrai, concret, bien structuré, avec un vrai enjeu. Une base qu'on PEAUFINE, pas qu'on jette.
- NEUTRE = pas de STYLE imposé. Le style (antithèse "ni X ni Y", parabole/métaphore, triade rythmée, staccato, chute rhétorique, formule-choc "l'employé de ta propre entreprise", maxime sentencieuse "un dirigeant dirige", open loop, crescendo) est un CHOIX de la PERSONNE (sa seconde brain l'apprendra), jamais la base. Une base stylée oblige le créateur à retirer le style avant d'ajouter le sien = inutilisable.
- Distinction clé : STRUCTURE (garder) vs STYLE (retirer). Règle de contrôle inscrite dans le prompt : "je garde cette phrase parce qu'elle est JUSTE, ou parce qu'elle SONNE BIEN ?". Si "sonne bien" -> style -> réécrire plat.

**Pendule des erreurs déjà commises (ne pas y retomber) :**
1. Trop ORAL/familier ("t'es", "grandit pas", "bosses") = immature, rejeté.
2. Corrigé en NEUTRE mais FADE (mou, sans relief), rejeté.
3. Corrigé en ajoutant du STYLE (figures), rejeté : on impose un profil.
4. Bon = neutre-SOLIDE = structure sans style. Cible atteinte vers 7-9/10.

**Règles fermes précises :**
- FRANÇAIS CORRECT : on GARDE le "ne" de négation ("ne grandit plus", jamais "grandit pas"). stripNe neutralisé (return t) dans les 4 routes.
- TUTOIEMENT par défaut mais SOIGNÉ : "tu es" jamais "t'es", "tu travailles" jamais "tu bosses". Décision Jonathan : le tu domine sur YouTube B2B/B2C, il crée la proximité.
- SOLUTION/IA AMENÉE NATURELLEMENT : jamais un catalogue de fonctionnalités ("elle identifie... elle prend en charge..."). Elle répond au problème humain, pas une pub insérée. Sonner promo = décrochage.
- DURÉE et TIMESTAMP (0:00, 0:12) RETIRÉS de l'affichage du script : trompeurs, le créateur décide de la longueur, on ne l'enferme pas dans un timer. (Fait dans script/page.tsx, meta3 + section.timestamp retirés.)

**Où c'est codé :** bloc partagé CONTENT_RULES dans src/lib/ai/chatRules.ts (propagé aux 3 formats via injection après SURGICAL_OUTPUT). Prompts dans generate-script/carousel/story + story-slide. Le style familier venait de prompts hardcodés (pas du Brand OS).

**Méthode de validation :** Jonathan teste en LIVE (pas de preview possible, variables Clerk scopées rush-integration -> 500). Il génère 2-3 fois pour juger la TENDANCE (même niveau, pas forcément même texte), pas un tir unique. Toujours Cmd+Shift+R (cache) avant de tester.
