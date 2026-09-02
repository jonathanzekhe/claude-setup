---
name: project_brvndlab_integrations_not_a_module
description: "Intégrations = sous-page Réglages, jamais un module allouable (sinon redirect /home)"
metadata: 
  node_type: memory
  type: project
  originSessionId: 90c48264-84b2-43dd-becd-9dfd4eca82d4
---

Réglages > Intégrations (`/integrations`) est une SOUS-PAGE de Réglages, PAS un module facturable du rail. Elle ne doit jamais figurer dans `ALLOCATABLE_MODULES` (convex/modules.ts).

**Bug résolu 2026-07-12** : elle y était listée → le middleware serveur (src/proxy.ts) redirigeait vers /home tout compte client restreint dont l'allocation admin ne contenait pas la clé "integrations". Symptôme : cliente cliquait Réglages > Intégrations et retombait sur l'accueil.

**Fix en DEUX temps (une couche oubliée a re-cassé)** :
1. Commit 37f83a1 — retrait de `integrations` de ALLOCATABLE_MODULES → `moduleKeyForPath("/integrations")` renvoie null → route-gate serveur (proxy.ts) + client (useRouteGuard) laissent passer. MAIS la page crashait ensuite ("Cette page rencontre un souci" = error boundary).
2. Commit 15610a4 — la query `integrations.listMine` gardait un 3e gate : `assertModuleAllowed(ctx, "integrations")`. Clé disparue de ALL_MODULE_KEYS → assertion throw systématique pour comptes starter → crash. Retiré l'assertion (isolation par owner conservée via resolveOwnerClerkUserId, comme getMineByProvider), + retiré "integrations" de STARTER_MODULES (provisioning Stripe, stripeIntegration.ts).

**Why** : un module a TROIS gates qui lisent modules.ts, pas deux — route serveur (proxy.ts), route client (useRouteGuard), ET data (assertModuleAllowed dans chaque query). Retirer une clé de la liste sans retirer l'assertion correspondante = throw garanti.
**How to apply** : ne réintroduis jamais /integrations ni aucune sous-page de Réglages dans ALLOCATABLE_MODULES / STARTER_MODULES. Quand tu retires une clé de module, cherche TOUJOURS `assertModuleAllowed(ctx, "<clé>")` dans convex/*.ts et retire-la aussi. Cf. [[project_brvndlab_reglages_admin_conso_sealed]].
