---
name: État Brvndlab live + reste à faire (2026-04-25)
description: Snapshot de ce qui est déployé en prod sur app.brvndlab.com et ce qui reste comme chantier de modules. Point de contrôle après une grosse session d'affinage Contenu/Brainstorm/Layout.
type: project
originSessionId: b89456e2-2692-4863-b103-66dec20d323d
---
## Live en prod (app.brvndlab.com) au 2026-04-25 fin de session

**Layout global**
- Sidebar Variante A : rail icon-only 56px permanent, tooltips au hover, active state barre orange + fond #FFF7ED
- Mode dark sidebar pendant le brainstorm (Variante C immersion) : sidebar bascule en #050507 et fusionne avec la zone brainstorm sans bord blanc
- Shell layout passe en noir total quand data-brainstorm="active"
- Avatar bottom rail avec popover signout au hover

**Module Contenu / page script**
- Auto-save continu avec debounce 1.5s (plus de bouton "Sauvegarder" manuel)
- Indicateur statut auto-save discret en bas de page
- Bouton "Ajouter à la pipeline" en pill discret orange clair
- Modale Pipeline centrée avec backdrop blur + croix + Escape, rendue via portail
- Modale silencieuse au retour si pas de modifications non sauvegardées
- AssigneeSelector compact top-right (avatars empilés + popover de sélection)
- Trio Durée/Funnel/Format avec funnel en couleur (TOFU bleu / MOFU orange / BOFU rouge)
- Tous les CTA "Retour" simplifiés
- Step result post-brainstorm refonte orange complète

**Module Brainstorm (page explore)**
- Variante E cinéma spotlight noir avec halo orange diffus
- Question centrée typo Fraunces serif clamp 18-26px (tient sur écran)
- Tag "Mode brainstorm" pulse animé
- Jauge anneau circulaire avec score IA mature (5-95% pendant, anim à 100% au complete)
- Highlighting **bold** orange sur les mots clés des questions de l'IA
- Auto-resize textarea style ChatGPT (max 6 lignes)
- Sortie smooth 800ms avant step result

**API génération script**
- Prompt système renforcé qualité 10/10
- Passage du transcript brainstorm complet comme source primaire
- Anti name-dropping en accroche (Hastings, Hormozi, etc. interdits)
- Funnel forcé selon choix utilisateur, plus de derive IA
- Platform forcé en valeur courte ("Short" / "YouTube")
- Chat refine peut changer funnel/format/structure si user demande explicitement
- Banlist mots-béquilles (truc/chose/machin/bidule) dans tous les outputs IA

**Confettis** : retirés du flow ajout pipeline (réservés au "premier contenu jamais créé" plus tard)

## Reste à faire (modules / sections non encore appliqués au code, mais mockups souvent validés)

- **Journal** : Jonathan veut voir le frontend (pas encore touché côté code, mockups potentiellement existants)
- **Sections Contenu restantes** : il reste des points à affiner au-delà des 6 du cycle terminé
- **Brand OS** : design final non appliqué
- **Calendrier** : validé en avril mais le code peut ne pas tout refléter (drawers stratégie/filtres, layout M1 canvas)
- **Analytics** : business + contenu + feeds + drawers (mockups validés)
- **Recherche / Radar** : mockups V2 validés non appliqués
- **Leads** : liste + drawer + transactions + modal appel
- **Ventes (Transactions)** : drawer read-only validé
- **Collaborateurs** : liste + drawer + invite + miniamaker form
- **Messaging** : nouvelle conversation
- **Mémoire dorée** : mockup complet avec Oracle, agents, drawer agent
- **Client Intel v2** : 5 tabs + flow détection→roadmap→brainstorm IA
- **Affiliation in-app dashboard** + **landing publique**
- **Pricing 3 tiers** + **factures**
- **Resiliation flow** (5 écrans validés)
- **Smart Links** + deck présentation
- **Settings** + **Intégrations** (top-level)

**Why** : capturer la photo du périmètre live au moment où Jonathan demande un point de contrôle pour décider où on continue.

**How to apply** : utiliser ce snapshot comme baseline avant les prochaines sessions d'affinage. Quand on attaque une section "à faire", confirmer d'abord avec Jonathan le mockup de référence avant d'appliquer.
