---
name: brvndlab-resilience-chaines-externes
description: "Système de résilience Brvndlab (18/08) — table chainesSante, reprises espacées, veilleur horaire, détection de panne de source. « On tombe dix fois, on se relève à la onzième »."
metadata: 
  node_type: memory
  type: project
  originSessionId: 100d0ff3-e583-486e-ade2-ef55a5f52457
  modified: 2026-08-18T07:29:00.688Z
---

Construit le 2026-08-18 sur demande de Jonathan (« garantie : peu importe si on tombe dix fois, on se relève à la onzième »). Fichier : `convex/resilience.ts`, table `chainesSante`.

**Principe** : chaque chaîne externe (import archive LinkedIn, enrichissement des formats, classement IA) écrit son verdict à chaque passage — état ok/echec, échecs consécutifs, raison lisible, date du prochain essai.

**Mécanique**
- Reprises espacées : 1 min → 5 → 15 → 1 h → 3 h → 6 h → 12 h → 24 h, puis quotidien indéfiniment. Jamais d'abandon, jamais de martèlement.
- `resilience.veilleur` (cron horaire, :25) relance ce qui doit l'être et converge (0 relance quand tout est à jour).
- `social.rattraperEnrichissements` (cron 04h40 UTC) = filet sous le filet.
- **Panne de source** : la même chaîne cassée sur ≥ 2 comptes = changement chez LinkedIn/fournisseur, pas un incident isolé → `console.error [RESILIENCE] PANNE DE SOURCE` avec la cause.
- `resilience.maSante` : query publique prête pour un écran d'état (non branchée côté UI).

**RÈGLE CRITIQUE apprise par le test** : « rien à faire » DOIT valoir succès (`_noterResultat ok:true`). Sinon une chaîne qui a fini son travail après une panne reste marquée « en échec » à vie et le veilleur la croit cassée. Vaut pour toute nouvelle chaîne branchée sur ce système.

**Preuves prod (18/08)** : 10 échecs consécutifs puis reprise à la 11e (compteur remis à 0, état ok) ; panne réelle provoquée en retirant ANTHROPIC_API_KEY → détectée avec la cause exacte « ANTHROPIC_API_KEY absente », clé restaurée, guérison automatique vérifiée ; détection de panne de source sur 2 comptes ; veilleur à 0 relance quand tout est sain.

Voir [[brvndlab-linkedin-abonnes-extension-source]] pour les chaînes couvertes et [[brvndlab-social-connection-single-truth]] pour l'audit d'audience.
