---
name: Brvndlab phase finale - priorisation post-2026-05-08
description: Ordre de travail validé après refonte filtres/KPIs/cohérence cross-pages. Optimisations section par section d'abord, polish visuel + Mémoire dorée + Client Intel à la toute fin.
type: project
originSessionId: e37cd837-5455-4560-bcc5-81b6b082a9c8
---
État au 2026-05-08 : la base SaaS est posée et cohérente (Heat Score rebalancé, anonymes filtrés des leads, Client lock = banking only, Analytics Vue Business câblée, /transactions filtre Stripe-style avec react-day-picker, KPIs synchronisés cross-pages).

**Why** : Jonathan veut maintenant passer en mode "audit + optimisation par section" avant tout gros nouveau chantier. La logique métier doit être bétonnée avant de polir le visuel ou d'attaquer les features stratégiques majeures.

**Ordre de priorité validé** :
1. **Maintenant** : Jonathan parcourt les sections et signale les optimisations / incohérences à corriger au fil de l'eau
2. **À la toute fin** : passe de polish visuel global (UX premium 21st.dev style)
3. **À la toute fin aussi** : implémentation Mémoire dorée + Client Intel (deux gros chantiers stratégiques explicitement repoussés)

**How to apply** :
- Ne pas proposer de partir sur Mémoire dorée ou Client Intel tant que Jonathan ne le déclenche pas explicitement
- Ne pas proposer de refonte visuelle globale tant que la phase d'optimisation par section n'est pas close
- Quand Jonathan signale "j'ai vu un truc à optimiser dans X" → micro-fix chirurgical, on ne repart pas sur un brainstorm complet du module
