---
name: Accès fermé, rapport d'appel, flow client
description: Brvndlab n'est PAS en inscription ouverte. Accès uniquement via rapport d'appel commercial ou ajout manuel dans Clerk. Page sign-in uniquement, pas de sign-up visible.
type: project
---

## Accès à Brvndlab : fermé par défaut

L'app n'est **PAS en inscription ouverte**. Personne ne peut créer un compte librement.

### Deux chemins d'accès

1. **Rapport d'appel commercial** : l'équipe commerciale remplit un formulaire de rapport d'appel après un call de vente. Ce formulaire inscrit automatiquement l'email du client dans le système et déclenche un email de bienvenue avec un lien vers l'app. Le client clique, arrive sur la page de connexion, entre son email, et Clerk détecte que c'est un nouveau compte pré-autorisé.

2. **Ajout manuel par Jonathan via Clerk** : Jonathan entre l'email directement dans le dashboard Clerk. Le client reçoit ensuite un lien et commence l'onboarding.

### Comportement attendu pour un visiteur non autorisé

Toute personne qui arrive sur l'app sans avoir été pré-inscrite (ni via rapport d'appel, ni via Clerk) ne peut PAS se connecter. Aucune option "créer un compte" visible.

### UX de la page de connexion

- Pas de bouton "Créer un compte" / "Sign up" visible
- Seul texte : **"Se connecter"**
- Le client entre son email
- Clerk détecte automatiquement si c'est un nouveau (pré-autorisé) ou un existant
- Si nouveau pré-autorisé : Clerk crée le compte et envoie un code de vérification
- Si existant : Clerk envoie un code de vérification pour se connecter
- Si non autorisé : Clerk refuse (erreur "email non reconnu" ou équivalent)

### Email de bienvenue

Envoyé automatiquement après inscription via le rapport d'appel. Contient :
- Message de bienvenue
- Lien direct vers l'app (https://app.brvndlab.com)
- Le client atterrit sur /sign-in, entre son email, et commence l'onboarding

### Rapport d'appel (à construire)

Page/formulaire interne pour l'équipe commerciale. Quand il est soumis :
1. L'email du prospect est ajouté dans la whitelist Clerk (via Clerk Backend API allowlist)
2. Un email de bienvenue est envoyé au prospect
3. Le prospect est automatiquement dirigé vers l'onboarding à sa première connexion

**Why:** Brvndlab est un produit de coaching premium, pas un SaaS libre-service. L'accès est contrôlé pour garantir que seuls les clients qualifiés (passés par un appel de vente) entrent dans l'app.

**How to apply:**
- Configurer Clerk en mode "Restricted" (allowlist d'emails)
- Supprimer/cacher la route `/sign-up` et rediriger vers `/sign-in`
- La page `/sign-in` ne montre que "Se connecter" avec un champ email
- Construire le formulaire de rapport d'appel (route interne, coach-only)
- Wirer le formulaire à Clerk Backend API pour ajouter l'email à l'allowlist + envoyer l'email de bienvenue
