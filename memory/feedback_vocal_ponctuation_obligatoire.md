---
name: Vocal — ponctuation et passages à la ligne OBLIGATOIRES
description: Sur TOUT micro/vocal dans Brvndlab, la ponctuation (virgules, points, guillemets) et les passages à la ligne doivent être automatiques et corrects. Déjà rappelé deux fois.
type: feedback
originSessionId: 1df69724-cc9f-4824-aff8-7c74c4ae7327
---
## Règle absolue sur tous les inputs vocaux Brvndlab

Dès qu'une page permet de dicter à la voix (thème Q&A, brainstorm, script, retour, etc.), le texte reconnu doit être **proprement ponctué et formaté** avant d'être inséré dans l'input :

- Virgules là où il faut
- Points à la fin des phrases
- Guillemets quand on cite
- Passages à la ligne quand Jonathan marque une pause ou change d'idée
- Majuscules au début des phrases

**Why:** Jonathan utilise massivement la dictée vocale pour travailler. Un transcript brut sans ponctuation est illisible et demande un second passage manuel. Il a dû rappeler cette règle **deux fois** (15 et 16 avril 2026), c'est un irritant majeur.

**How to apply:**
- Le hook `src/hooks/useSpeechToText.ts` doit post-traiter via Haiku 4.5 pour ajouter la ponctuation (il y a déjà un flag `isPunctuating`, faut vérifier qu'il est appelé systématiquement)
- Si une page a un micro sans post-processing, c'est un bug : ajouter le call au ponctuateur IA après l'arrêt du recording
- Les sauts de ligne doivent être insérés là où l'intention est claire (changement de sujet, liste, etc.)
- Le délai de ponctuation doit être court (< 1s) pour pas casser le rythme d'écriture
- Tester manuellement après chaque modif d'un écran avec micro : dicter une phrase longue avec plusieurs idées, vérifier que la ponctuation est cohérente.

**Pages concernées (à auditer) :**
- `/content/new/qa` (thème)
- `/content/new/idea` (sujet, puis affinage)
- `/content/new/story` (questions par framework)
- `/content/new/carousel` (questions)
- `/content/script` (affinage par section + retour global)
- `/content/new/inspiration` (retours)
- `/content/new/filmed` (retours)
- Toute nouvelle page avec input textuel
