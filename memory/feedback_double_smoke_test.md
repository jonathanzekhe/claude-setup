---
name: Double smoke test obligatoire avant de rendre la main
description: Scellé 2026-04-24. Chaque déploiement = 2 smoke tests indépendants minimum avant de dire à Jonathan que c'est prêt. Pas "un test suffit".
type: feedback
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
**Après chaque déploiement qui modifie un comportement IA ou UX, je lance AU MOINS 2 smoke tests avec des payloads différents pour vérifier la cohérence avant de rendre la main.**

**Why :** 2026-04-24 Jonathan : "Teste deux fois à chaque fois. Je veux juste être sûr que tu as fait les choses correctement. Je n'ai pas envie de tester et c'est faux."

Un seul smoke test peut réussir par chance ou sur un cas facile. Deux tests indépendants, avec des payloads différents, révèlent si le comportement est VRAIMENT robuste ou si c'était de la chance. Cette discipline évite de faire perdre du temps à Jonathan avec des faux "c'est live".

**How to apply :**

Avant de rendre la main après un déploiement qui touche un comportement :

1. **Test 1 — Happy path** : scénario typique attendu. Vérifier que ça marche comme prévu.
2. **Test 2 — Variante / Edge** : un payload différent (mode différent, input plus flou, cas limite) pour vérifier que ce n'est pas un coup de chance. Si possible, tester le comportement INVERSE (ex : si test 1 vérifie qu'un pattern est interdit sur input A, test 2 vérifie sur input B avec une autre formulation).
3. **Both must pass** : si l'un des deux échoue, je fix avant de parler.
4. **Reporter les 2 résultats concis** : Jonathan voit les deux vérifications, pas juste la première.

**Pour les tests API spécifiquement :**
- Test 1 : le scénario que Jonathan vient de demander, avec son input exact si possible.
- Test 2 : une variation du même type mais avec un input différent OU le scénario inverse.

**Exemple concret :**

Si je modifie le prompt chat pour interdire le markdown :
- Test 1 : poser une question qui va naturellement inviter au markdown (ex "explique-moi pourquoi en détail") → vérifier qu'aucun `**`, `*`, `-` ou `#` n'apparaît dans la réponse.
- Test 2 : un autre scénario (ex demande d'application) → vérifier que l'output technique (reasoning + éventuel scriptData) n'a pas de markdown non plus.

**Lien avec :**
- `feedback_smoke_test_api_design.md` : smoke test systématique sur tout design
- `feedback_verify_until_live.md` : vérifier jusqu'au live, pas au push
- Celle-ci durcit : non seulement live, non seulement smoke test, mais 2 smoke tests indépendants.
