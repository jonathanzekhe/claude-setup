---
name: Regle stricte erreur backend = 3 tests obligatoires
description: Pour TOUTE erreur backend Brvndlab (meme micro), stop, fix, teste 3x pour confirmer, puis reprend le reste
type: feedback
originSessionId: d20c1ad6-25c2-4284-9ee1-b6f59ff05e86
---
Pour tout ce qui concerne le **backend Brvndlab** : des que tu vois une erreur, meme une micro-erreur, tu appliques cette regle stricte.

**Why:** Jonathan a besoin d'un backend super stable. Rien de pire qu'une erreur qu'on laisse passer en se disant "on verra plus tard" et qui finit par casser quelque chose en prod. La regle des 3 tests garantit qu'une erreur fixee est vraiment fixee.

**How to apply:**

1. Des que tu vois une erreur (typecheck, deploy, tool call, log, runtime), **tu interromps toute autre tache en cours** et tu reviens sur cette erreur.
2. Tu trouves la cause racine et tu la fix.
3. Tu testes **3 fois** que la correction marche vraiment :
   - Test 1 : verification directe (l'erreur n'apparait plus)
   - Test 2 : edge case / autre angle d'attaque
   - Test 3 : confirmation finale que tout le flow adjacent fonctionne
4. Si un des 3 tests echoue, tu re-fix et tu recommences le cycle (pas juste retester).
5. Une fois les 3 tests verts, tu reprends la tache d'origine.

Cette regle s'applique aussi aux micro-erreurs (warning TypeScript, log bizarre, result inattendu). Pas de "c'est pas grave", pas de "on verra plus tard". Chaque erreur = cycle complet de 3 tests.
