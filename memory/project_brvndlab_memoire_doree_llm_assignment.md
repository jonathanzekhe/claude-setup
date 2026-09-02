---
name: Mémoire dorée - Assignation LLM par agent
description: Scellé 2026-04-24. Pour chaque agent IA de Mémoire dorée, le bon modèle selon la tâche. Optimisation coût/performance.
type: project
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
## Assignation LLM par agent

### Agent Scout · Sonnet 4.6
- **Tâche** : détecter patterns de newcomer rising, clusters de niches émergentes
- **Pourquoi Sonnet** : analyse multi-signaux (croissance, engagement, keywords) à grande vélocité, pas besoin du niveau Opus
- **Coût estimé** : ~0.08$ par cycle de scan

### Agent Stratège · Opus 4.6
- **Tâche** : recommandations stratégiques personnalisées Jonathan (cross-ref Mémoire dorée + Brand OS + capacités Brvndlab)
- **Pourquoi Opus** : raisonnement multi-facteurs complexe, qualité premium requise (ces recos orientent le produit entier)
- **Coût estimé** : ~0.40$ par sortie

### Agent Historien · Sonnet 4.6
- **Tâche** : comparaison temporelle, interprétation des deltas, synthèse d'évolutions
- **Pourquoi Sonnet** : analyse comparative précise, pas besoin d'Opus sauf pour insights stratégiques issus de l'historique
- **Coût estimé** : ~0.10$ par comparaison

### Agent Veilleur · Haiku 4.5
- **Tâche** : monitoring de seuils, détection d'anomalies temps réel, priorisation des alertes
- **Pourquoi Haiku** : ultra-rapide, ultra-cheap pour du monitoring continu. Escalade vers Sonnet uniquement si alerte critique nécessite analyse
- **Coût estimé** : ~0.002$ par check (tourne en continu)

## Autres composants

### L'Oracle search (Q&A)
- **LLM** : Opus 4.6 avec toute la Mémoire dorée en contexte (via embeddings)
- **Pourquoi Opus** : réponses riches et nuancées sur des questions stratégiques de marché

### Report generation (Rapports complets)
- **LLM** : Opus 4.6
- **Pourquoi Opus** : synthèse structurée premium, chaque section requiert raisonnement poussé

### Autocomplete suggestions
- **LLM** : Haiku 4.5
- **Pourquoi Haiku** : pattern matching rapide sur queries passées + populaires

### Brainstorm IA (chat drawer)
- **LLM** : Opus 4.6 (premier message), Sonnet 4.6 (followups)
- **Pourquoi ce mix** : Opus lance la conversation avec profondeur, Sonnet continue à moindre coût

## Coûts d'opération estimés

Pour un Jonathan actif (usage quotidien) :
- Agent Scout : ~5$/jour (scan continu)
- Agent Stratège : ~1$/jour (quelques invocations)
- Agent Historien : ~0.50$/jour (comparaisons ponctuelles)
- Agent Veilleur : ~0.10$/jour (monitoring permanent)
- Oracle + Reports : ~2-5$/jour (usage Jonathan)

**Total estimé : 8-12$/jour pour Jonathan seul** en phase stealth. Scalable pour release publique avec cap adapté au tier (Scale uniquement).

## Règle

Ne jamais utiliser Opus sur une tâche qu'un Sonnet fait aussi bien. Ne jamais utiliser Sonnet pour du monitoring pur (utiliser Haiku). Chaque € de LLM doit avoir un ROI clair.
