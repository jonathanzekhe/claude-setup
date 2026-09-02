---
name: vividflow.co motion overlay shipped 27/05/2026
description: Motion progressive enhancement déployé sur vividflow.co prod (projet Vercel `site-mockups`). Bloc CSS + script gated sous `html.vf-motion` pour fallback safe.
type: project
originSessionId: 430ab5a3-2c63-4d5a-9691-7fb2b8e37726
---
Couche motion ajoutée à `site-mockups/index.html` en additif pur, sans modifier la structure HTML existante. Tous les comportements existants (card-stack auto-rotate, takeover agents, smooth scroll) préservés.

**Why:** Jonathan a validé Variant A pour le hero, Variant A+B+C pour L'offre, puis donné carte blanche pour finir tout le site et push prod. Approche progressive enhancement choisie pour minimiser le risque sur le site live qui sert des prospects.

**How to apply:**
- Toute future modif motion sur vividflow.co se fait dans le bloc `<style id="vf-motion-styles">` (après le main `</style>` du site, ligne ~2148) et `<script id="vf-motion-script">` (avant `</body>`)
- Tout est gated sous `html.vf-motion` (classe ajoutée par script sync en head). Si JS échoue → pas de classe → site live sans motion (safe fallback)
- Backup pré-motion : `site-mockups/index.html.before-motion` (104829 bytes), rollback rapide possible
- Deploy prod : `cd site-mockups && vercel deploy --yes --prod` (auto-deploy GitHub absent sur ce projet)

**Sections motion live :**
- **Hero desktop & mobile** : titre split mots cascade (blur + y), sous-titre + CTA cascade, image scale 1.04→1
- **L'offre** : header cascade (eyebrow + titre split words + underline orange sur "couche d'exécution" + bridge), stage entrance, per-card content motion via keyframes liés à `.deck-wrap.s-N` (silhouettes/tools/agents/Zulu/keys staggered), deck-text crossfade existant préservé. Overflow:visible sur cartes 2 et 3 actives (tête Isaiah non coupée).
- **Agents, Process, FAQ, Final, Footer** : scroll-reveal via IntersectionObserver (threshold 0.15, rootMargin -40px). Steps + FAQ items stagger. Final headline em "premier" underline orange. Process ui-mockups scale 0.97→1.
- **CTAs** : entrée via `@keyframes vfCtaEnter` (pas transition transform) pour préserver le hover natif snappy.
- **Reduced motion** : `@media (prefers-reduced-motion: reduce)` ramène toutes les durées à 0.001ms.

**Risques connus / à surveiller :**
- Le `.deck-card` overflow:hidden + override cascade en s-3/s-2 (visible) reste fragile à toute future refonte du card-stack CSS
- Le script monkey-patche `window.setDeckOffre` pour re-trigger les animations CSS à chaque rotation — si Jonathan modifie cette fonction, vérifier que le hook tient
