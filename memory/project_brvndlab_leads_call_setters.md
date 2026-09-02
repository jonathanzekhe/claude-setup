---
name: Appel direct lead + rôle Setter
description: Validé 2026-04-22. Si un lead a laissé son numéro (lead magnet), on peut l'appeler direct. Rôle Setter à ajouter aux collaborateurs.
type: project
originSessionId: 27d171cc-c722-4f39-a81e-3ccd4df7b3b4
---
Certains leads Brvndlab laissent leur **numéro de téléphone** via un lead magnet (ebook, guide, etc). Ces leads sont qualifiés et peuvent être contactés par téléphone pour un appel de qualification / setting.

**Why:** Jonathan a des **setters** (personnes qui font les appels de qualification avant le vrai closing). Quand un lead laisse son téléphone, c'est un signal fort, la personne a montré qu'elle veut être contactée. Permet d'enclencher l'appel direct depuis la fiche lead.

**How to apply :**

1. **Fiche lead** : bouton **"Appeler"** disponible **uniquement si le téléphone est connu**. Sinon, le bouton n'apparaît pas (pas d'action grisée qui frustre).

2. **Clic "Appeler"** :
   - Ouvre un dialer intégré (Aircall, Twilio, ou simple `tel:` pour mobile)
   - Loggue automatiquement un touchpoint "Appel sortant" dans le parcours du lead
   - Permet d'ajouter une note post-appel (sélectionner un résultat : qualifié / pas qualifié / à rappeler / injoignable)

3. **Rôle Setter** à ajouter à la liste des rôles collaborateurs :
   - Accès limité : Leads (pour voir les leads à appeler) + Messages + Dashboard
   - Pas d'accès Brand OS, Contenu, Analytics, Radar, etc.
   - Peut logger ses appels, ajouter des notes sur les leads
   - Voit un dashboard dédié type "Leads à appeler" avec file d'attente
   - À brainstormer plus tard si Jonathan veut développer ce rôle

4. **Quick actions lead fiche** deviennent conditionnelles :
   - Si email connu → **Écrire** disponible
   - Si téléphone connu → **Appeler** disponible
   - **Note** toujours disponible
   - Si un appel est déjà booké (iClosed) → bandeau "Appel prévu" remplace le besoin de booker

5. **Historique des appels** dans le parcours : les appels sortants (setter ou Jonathan lui-même) apparaissent dans la timeline avec leur résultat (qualifié / pas qualifié / injoignable / à rappeler).

Cette logique renforce la proximité avec les leads chauds tout en respectant le principe "le lead a manifesté de l'intérêt" (en laissant son numéro).
