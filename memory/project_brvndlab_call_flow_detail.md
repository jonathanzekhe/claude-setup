---
name: Flow d'appel depuis une fiche lead
description: Validé 2026-04-22. Clic "Appeler" adapté selon le device. Log systématique du résultat dans la timeline du lead.
type: project
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
Quand l'utilisateur clique **"Appeler"** sur une fiche lead, le comportement dépend du device puis un log du résultat est systématique.

## Sur mobile

1. Clic sur "Appeler"
2. Le **dialer natif** du téléphone s'ouvre via un lien `tel:+33...` (numéro pré-rempli)
3. L'utilisateur appelle comme d'habitude
4. Au retour dans Brvndlab (ou via une notification légère), on lui propose de logger le résultat

## Sur laptop / desktop

1. Clic sur "Appeler"
2. Une **petite modal** s'ouvre avec :
   - Le numéro du lead en gros, cliquable pour copier
   - Bouton **"Appeler via ton téléphone"** qui déclenche un lien `tel:+33...`
   - Sur Mac → ouvre FaceTime / Continuity (route via l'iPhone relié au Mac)
   - Sur Windows → ouvre l'app par défaut (Teams, Skype, ou prompt système)
3. L'utilisateur appelle via son device natif, **zéro service payant tiers** requis
4. La modal évolue en étape 2 : **log du résultat**

## Log du résultat (obligatoire après appel)

Peu importe le device, après l'appel on logue systématiquement :

1. **Résultat** (radio, un seul choix) :
   - Qualifié pour suite
   - Pas intéressé
   - À rappeler plus tard
   - Injoignable
2. **Note libre** (optionnelle) : contexte, observations
3. **Enregistrer** : crée un touchpoint "Appel sortant" dans le parcours du lead avec le résultat et la note

## Effets sur la data

- Le touchpoint "Appel sortant" apparaît dans la timeline du lead avec l'icône appel + le résultat
- Si le résultat est "À rappeler plus tard", le lead remonte dans une file d'attente "À rappeler" (utile pour un Setter)
- Si "Qualifié", la chaleur du lead peut passer à Hot si elle ne l'était pas déjà
- Si "Pas intéressé", le lead peut être marqué inactif (toujours visible mais filtré par défaut)

## Pas d'intégration VoIP tierce

**Règle** : Brvndlab ne propose **jamais** d'intégrer Aircall, Twilio, Dialpad ou autre service VoIP payant. L'objectif est que l'utilisateur Brvndlab ne paie rien de plus pour appeler ses leads. On utilise **exclusivement** les capacités natives du device :

- **Téléphone** (iOS / Android) → `tel:` ouvre le dialer natif, appel via la ligne téléphonique de l'utilisateur
- **Mac** → `tel:` déclenche FaceTime / Continuity qui route l'appel via l'iPhone relié au Mac (gratuit pour tout utilisateur Apple)
- **Windows** → `tel:` ouvre l'app par défaut (Teams, Skype) ou prompt système

Si un jour un client demande une intégration VoIP dédiée, on ajoutera ça **en option payante premium**, jamais en obligation. Le funnel de base reste 100% gratuit côté appel.

## Rôle Setter

Un Setter a typiquement une file d'attente **"Leads à appeler aujourd'hui"** (basée sur chaleur, deadline, rappels programmés). Il clique "Appeler" sur chaque lead à la suite, loggue le résultat, passe au suivant. Le dashboard Setter à brainstormer en détail plus tard.
