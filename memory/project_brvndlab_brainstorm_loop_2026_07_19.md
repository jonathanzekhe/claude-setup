---
name: brvndlab-brainstorm-loop-2026-07-19
description: "Boucle peaufinage brainstorming 19/07/2026 — archive=badge funnel, Retravailler=reprise conversation, funnel souverain + structure carousel déduite, picker problèmes 2 sections, CTA fidélité ctaExpect"
metadata: 
  node_type: memory
  type: project
  originSessionId: 26b311ed-ff18-48b0-9392-0c9b154ae853
---

Boucle /loop validée par Jonathan (réponses AskUserQuestion) et tribunal (3 juges + superviseur 9/10), déployée prod (commit 5885997d) :

1. **Archive /angles** : cartes = titre + badge funnel TOFU/MOFU/BOFU seul (`FUNNEL_COLOR` bleu/amber/rouge). Catégorie business et "Story" retirées. Vieux angles sans funnel = pas de badge (assumé).
2. **Retravailler** (récap) : `?resume=<angleId>&mode=<fmt>&vf=` → explore recharge le transcript (message de reprise RESUME_MSG filtré pour ne pas s'accumuler), re-validation → `angles.updateFromBrainstorm` (patch CONDITIONNEL — jamais de champ effacé par undefined, funnelLocked préservé), récap avec `resumed=1` (Sortir ne supprime plus). DÉCISION : retravail = même brainstorm mis à jour, jamais de doublon.
3. **Funnel souverain** : au récap, funnel = angle.funnel (verrou ou diagnostic IA) ; OBJ_BY[structure] = fallback vieux angles only. Le sélecteur de structure carousel (éducatif/storytelling/conversion) est SUPPRIMÉ : type déduit (?struct du brainstorm, sinon BOFU→resultats, récit→parcours, sinon process). DÉCISION Jonathan : structure déduite dans le brainstorm, zéro clic, uniquement pour les carousels.
4. **Picker problématiques** (composer explore) : panneau ouvert au clic avec TOUTES les problématiques, groupées en 2 sections ("Au quotidien" = generated-activite, "Investir dans ta solution" = generated-investissement), pills froid/tiède/chaud = filtre optionnel.
5. **CTA fidélité** : `ctaExpect {kind: description|commentaire|bio|mot|libre, keyword}` envoyé SEULEMENT si l'utilisateur clique un choix (ctaTouched — le défaut "description" non touché n'est jamais un ordre). Vérifié par détecteur déterministe (frontière de mot pour le mot exact) dans generate-script (boucle 3 rounds) et generate-story (check avant le slice fixedCount), persisté dans ScriptData/StoryData, verrouillé sur toutes les retouches via ctaKeepLine.

Restes assumés : attachments non repris lors d'un retravail ; éditeur story single-pass. Lié : [[brvndlab-script-length-cta-funnel-fix]].
