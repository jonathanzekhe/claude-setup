---
name: Taxonomie page Intégrations Brvndlab (validée 2026-05-02)
description: Liste finale des intégrations actives, catégories. Skool retiré (pas d'API webhook native). Décision scellée après audit avec ICP Minozan.
type: project
originSessionId: e5e51002-1d47-4257-959e-cc08de4a79d7
---
**Décision finale taxonomie page Intégrations Brvndlab (2026-05-02)** :

**Catégories conservées (3)** :
- `paiements` → Stripe, Whop
- `booking` (libellé UI : "Booking & Vente") → Calendly, iClosed
- `crm` → GoHighLevel uniquement

**Supprimés** :
- Catégorie `formulaires` (entière)
- Typeform (carte retirée)
- Tally (carte retirée, l'usage Tally du miniamaker dans Radar reste OK, contexte différent)
- **Skool** (retiré 2026-05-02) : pas d'API webhook marchande native côté Skool. Refus explicite de Jonathan de passer par Zapier/Make en relais ("ça veut rien dire"). Le schema Convex et les types union conservent toujours `"skool"` pour le futur, mais aucun module/route/UI Skool n'est exposé.

**Why:** Brvndlab n'est pas un Zapier. Une intégration entre uniquement si elle nourrit un des 4 KPIs business (CA, Leads, Conversion, Cash collecté) ET si elle est connectable nativement (OAuth ou webhook officiel du provider). Pas d'intermédiaire Zapier obligatoire = pas d'intégration. Validé après échange avec Minozan (ICP).

**How to apply:** Toute future demande d'intégration doit passer 2 tests : (1) "qu'est-ce que ça change dans le dashboard demain ?" et (2) "le provider expose-t-il un canal natif (OAuth ou webhook officiel) ?". Si une des deux réponses est non, on refuse. Si Skool ouvre des webhooks marchands publics plus tard, on rebrancera.
