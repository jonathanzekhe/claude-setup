---
name: Smoke test API systématique sur tout travail de design
description: Scellé 2026-04-24. Dès qu'une UI consomme un endpoint, je curl l'API en live avant de rendre la main à Jonathan. Pas de "ça devrait marcher".
type: feedback
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
**Toute modif design qui touche une data server-side doit être suivie d'un smoke test curl sur l'API concernée avant de rendre la main.**

**Why :** 2026-04-24 après avoir plombé Jonathan deux fois (layout pas matchant + IA qui renvoyait une salade conversationnelle dans un champ structuré), il a dit : "la prochaine fois tu vérifies aussi le bouton, avec smoke test API, tout le temps, qu'on fait du design".

Livrer une UI "compilée" ≠ livrer une UI qui fonctionne avec la data réelle. Le seul moyen de voir si l'API délivre ce que le design attend = appeler l'API en live.

**How to apply :**

Pour toute modif qui touche un écran + une route `/api/*` (ou un endpoint externe) :

1. **Identifier chaque endpoint** consommé par l'écran modifié.
2. **curl le/les endpoint(s) en prod** après déploiement :
   ```
   curl -s -X POST https://app.brvndlab.com/api/{route} \
     -H "Content-Type: application/json" \
     -d '{"...realistic payload..."}' | head -c 1000
   ```
3. **Vérifier la shape ET le contenu** :
   - Le JSON est-il exactement dans le format attendu par le front ?
   - Les strings respectent-elles les longueurs attendues ?
   - Pas de préambule, pas de markdown, pas de salade ?
   - Les edge cases (mode affiner, mode explorer, champ vide, etc.) fonctionnent-ils tous ?
4. **Tester le pire cas** : le mode ou l'input le plus susceptible de casser (ex : mode conversationnel sur une API qui attend du JSON structuré).
5. **Si l'API passe** → rendre la main. Si elle ne passe pas → fix avant de parler.

**Endpoints critiques à toujours smoke-tester après modif :**
- `/api/brainstorm` (5 angles structurés)
- `/api/brainstorm-explore` (conversation + angle final)
- `/api/generate-script` (script long)
- `/api/generate-carousel`, `/api/generate-qa` (contenu structuré)
- `/api/analyze-video`, `/api/suggest-topics`, `/api/content-recommendations`
- `/api/analyze-pdf` (extraction document)

**Principe général :**
Un composant UI n'est "livré" que quand j'ai vu le vrai JSON remonter correctement. Sinon je livre une promesse, pas un produit.
