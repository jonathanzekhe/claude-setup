---
name: RAG Mémoire dorée pour les générations IA
description: Scellé 2026-04-24. Roadmap : quand Mémoire dorée aura de la data en prod, brancher un RAG pour que script / coach / recommandations puisent dedans plutôt qu'inventer.
type: project
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
## Enjeu

Le script generator (et d'autres endpoints IA) reçoit aujourd'hui un contexte limité : résumé Brand OS + angle + keyPoints + structure. Il n'a PAS accès à :
- Mémoire dorée (cas clients FR infoprenariat réels validés)
- Scripts passés du créateur
- Contenus publiés + leur performance
- Cas clients anonymisés du créateur

Résultat : quand l'utilisateur choisit structure "Histoire", l'IA doit soit inventer du vécu (interdit), soit se contenter de cas publics connus (Patagonia, Apple...) + framings hypothétiques. C'est le patch du 24 avril (guardrail dans le prompt script).

## Pourquoi c'est critique

**Règle métier absolue : l'IA n'invente JAMAIS de faits, anecdotes, chiffres.** Mémorisé dans `feedback_never_invent_features.md`.

Sans accès à la data réelle, l'IA est plafonnée à un niveau générique. Avec RAG sur Mémoire dorée + Brand OS profond + contenus passés, les scripts deviennent vraiment ancrés dans la réalité du créateur et de son marché.

## Architecture cible (roadmap, pas MVP)

1. **Embeddings** sur :
   - Entrées Mémoire dorée (cas, business, tendances, ROI documentés)
   - Sections Brand OS fine (valeurs, histoire, pourquoi, public cible, offres)
   - Scripts passés validés (pour cohérence de ton)
   - Analytics des contenus publiés (quels angles ont performé)

2. **Retrieval contextuel** au moment de la génération :
   - Avant d'appeler Claude, on requête les 3-5 passages les plus pertinents par rapport à l'angle + keyPoints sélectionnés
   - On injecte ces passages comme "CONTEXTE RÉEL DISPONIBLE" dans le system prompt
   - L'IA cite/s'appuie sur ces passages au lieu d'inventer

3. **Scope de release** :
   - Phase 1 (stealth) : collecte Mémoire dorée silencieuse (déjà en cours)
   - Phase 2 : RAG sur Mémoire dorée (Jonathan-only, 3-6 mois)
   - Phase 3 : ouverture RAG à tous les users (chacun sur SON propre vault privé + pool commun Mémoire dorée public)

## Liens

- `project_brvndlab_memoire_doree_arme.md` — Mémoire dorée = arme #1
- `project_brvndlab_memoire_doree_agents_and_release_plan.md` — 4 agents + plan stealth
- `project_brvndlab_memoire_doree_llm_assignment.md` — LLM par agent
- `feedback_never_invent_features.md` — règle zéro invention

## À traiter

- Choisir provider embeddings (Voyage AI ? OpenAI text-embedding-3 ? Anthropic quand dispo ?)
- Choisir vector DB (Convex Vector Search ? pgvector ? Pinecone ?)
- Schéma de capture des passages indexables (Mémoire dorée tag par thème/cas/marché)
- Budget latence : retrieval + génération doit rester sous 10s total pour script court, 20s pour script long
