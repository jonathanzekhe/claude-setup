---
name: Vérifier jusqu'au résultat final, jamais s'arrêter à "push success"
description: Scellé 2026-04-24. Toute modif app = valider que Jonathan peut effectivement voir le résultat sur son URL. Git push ≠ déployé ≠ testable.
type: feedback
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
**Ne JAMAIS annoncer "c'est live" sans avoir vérifié le résultat de bout en bout.**

**Why :** 2026-04-24 j'ai pushé sur `chantier-b-clerk` puis annoncé à Jonathan "Vercel va auto-déployer, teste". Résultat : la prod Vercel se déploie depuis `main` (pas `chantier-b-clerk`), donc Jonathan n'a rien vu de neuf pendant qu'il testait sur app.brvndlab.com. Il m'a rappelé : "fais des tests avant de me faire perdre du temps, sois sûr que tout est bon" + "quand on a une erreur, on remonte à chaque fois".

Règle existante en mémoire ("Regle 3 tests backend" + "Autonomie maximale") qui dit bien : tu attaques A puis B puis C sans redemander, tu découvres le résultat final. "Résultat final" = live chez Jonathan, pas "commit créé".

**How to apply :**

Après toute modif app, avant de rendre la main à Jonathan :

1. **Confirmer le build** (tsc, lint ou `next build` si changement structurel)
2. **Confirmer le déploiement Vercel** :
   - `vercel ls` → vérifier qu'une nouvelle prod apparaît avec l'âge correct
   - Si pas de déploiement déclenché (mauvaise branche, config CI), faire `vercel --prod --yes` manuellement
3. **Confirmer l'URL publique** : `curl -sI https://app.brvndlab.com` → HTTP 200
4. **(Idéalement)** : `curl` une page concernée et grep un marqueur de la nouvelle version

Si l'une de ces étapes échoue → investiguer avant de parler. Ne jamais dire "teste" si une seule étape n'est pas validée.

**Branches Brvndlab à retenir :**
- `main` = branche prod Vercel (auto-deploy ON)
- `chantier-b-clerk` = branche de travail active, PAS auto-déployée en prod
- Pour que Jonathan voie une modif sur app.brvndlab.com : soit merge main, soit `vercel --prod --yes` depuis le dossier (qui bypass la branche prod config).

**Principe général :**
"On remonte à chaque fois" → dès qu'une hypothèse casse (le push aurait dû déployer), arrêter, remonter la chaîne, identifier la vraie cause. Jamais annoncer une étape intermédiaire comme si c'était la finale.
