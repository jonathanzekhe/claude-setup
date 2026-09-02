---
name: apprentissage-du-fond-lya-capte-convictions-et-challenge
description: "Pendant fond de la seconde brain (forme). fondDistill capte convictions/raisonnements des validations → fondInsights pending. PROPOSE jamais seul (« Ajouter à ma fiche » sur page Personnalité). Challenge dans le brainstorm d'angles uniquement."
metadata: 
  node_type: memory
  type: project
  originSessionId: dc9dd1a0-579c-46e0-82a8-deab9e713138
  modified: 2026-07-29T18:03:18.889Z
---

Déployé prod 2026-07-29 (Convex + Vercel, commit df74d267). Demande Jonathan : capter les tics de FOND (convictions, raisonnements, thèmes qui comptent), pas seulement la forme, et le challenger dessus.

**Architecture — deux mémoires, zéro mélange (règle « qui vs comment » préservée) :**
- Seconde brain = FORME pure (mur inchangé).
- `fondInsights` (Convex) = FOND : { text, kind: conviction|raisonnement|theme, occurrences, status: pending|accepted|rejected }.

**Capture** : `distillFond` (src/lib/ai/fondDistill.ts, Sonnet, feature `fond_distill`) appelé depuis brain-validate à chaque mise en pipeline, même matière que la brain (contenu + diff). Mur INVERSE : forme rejetée, jamais de biographie inventée, sujet ponctuel ≠ conviction, 0-3 observations max, zéro = sortie valable. Dédoublonnage par texte normalisé, réapparition = occurrences+1, un rejet ne ressuscite JAMAIS.

**Décisions scellées Jonathan (29/07) :**
1. Le fond PROPOSE, ne modifie jamais la fiche seul. Page Personnalité : bloc « Lya a remarqué » (pending, boutons Ajouter à ma fiche / Ignorer). Accepté → status accepted + écrit dans la fiche `generated-fiche.observations[]` + carte « Convictions confirmées ».
2. Le challenge vit dans le BRAINSTORM D'ANGLES uniquement (`resolveFondBlock` injecté dans brainstorm-explore) : convictions validées = terrain ferme, pending occurrences>=2 = hypothèses à vérifier en douceur ; relever les contradictions (« d'habitude tu défends X »), jamais réciter les listes.
3. Discernement silencieux : le client ne dit jamais « enregistre », il corrige — le système discerne (même principe que la brain de forme, cf. [[project_brvndlab_seconde_brain_two_levels_channels]]).

Piège technique : `npx convex codegen` échoue sans `CONVEX_DEPLOYMENT=prod:accurate-cormorant-297` (le .env.local plein de VERCEL_* fait croire à un build Vercel).
