---
name: project_r2_deck_inkcloth_emmanuel
description: "Deck R2 Inkcloth (Emmanuel/Manu, impression textile Genève) généré et LIVE sur inkcloth.vividflow.co, R2 le lundi 17/08/2026 à 11h"
metadata: 
  node_type: memory
  type: project
  originSessionId: 53804109-54e8-4c36-ae00-f38a2f7119a6
  modified: 2026-08-15T23:12:01.743Z
---

Deck R2 **Inkcloth Printing Needs Sàrl** (Zefix CHE-411.438.650, Genève) généré le 15/08/2026 depuis le transcript TLDV complet du R1 du 07/08 (meeting 6a759feea046e60013079369, 73 min). Prospect : **Emmanuel (« Manu »)**, impression sur textile, Les Acacias, 3 personnes + fiduciaire. **R2 prévu lundi 17/08/2026 à 11h.**

- LIVE : **https://inkcloth.vividflow.co** (projet Vercel `inkcloth-r2`, dossier `VividFlow/bouquet-supreme-r2/inkcloth-r2/`). Vérifié 2 passes agent, zéro résidu.
- DÉMO SAAS : **https://inkcloth-demo.vercel.app** (fork DataOS sur VPS `/root/inkcloth-demo`, Convex `dev:oceanic-gecko-522`, accent rouge #E03A2F). La page Maquette du deck est floutée et pointe dessus (« Cliquer pour ouvrir »). Détails process : [[project_r2_demo_saas_par_client]].
- **TRIBUNAL CLOS 16/08 (unanimité 3 juges)**. Modules finaux : Tableau de bord · Commandes (Demande reçue→Devis envoyé→Bon à tirer→En production→Prête à retirer→Livrée) · Bons à tirer · **Fichiers clients** (le bluff : analyse des visuels, orthographe, amélioration ×4, discernement humain) · Clients (top 20 en tête) · Encaissements (QR-factures + boîtier) · Calendrier · Équipe IA (4 agents) · Tâches · Mémoire métier · Data/Process · Intégrations (9 outils réels). Canon : 38 clients · 14 commandes en cours · 24'965 CHF encaissés · 810 à collecter · 4 BAT · objectif oral 50/mois (pas de jauge : règle scellée anti-objectifs). Captures d'audit dans le scratchpad session `shots*/`.
- Signaux de conversion pour l'oral : perte chiffrée par lui (2-3 commandes ~500 CHF récentes, « on perd la moitié du CA en n'étant pas réactif », potentiel 50 commandes/mois vs 30-40) ; critère de décision = SIMPLICITÉ (« simplifie ça à mort ») + réactivité email n°1 ; méfiance après mauvaise expérience prestataire réseaux sociaux ; veut garder validation humaine et ses règles (bon à tirer signé, paiement avant production) ; connaît Odoo (différencier : solution qui lui appartient) ; travaille jusqu'à 22h, 2 enfants ; bouche-à-oreille + programme top 20 clients (>3000 CHF/an).
- Position outils scellée dans le deck : emails/WhatsApp/banque conservés et reliés ; le Google Sheet de suivi est repris par le tableau de bord.
- Fiche niche créée : `bouquet-supreme-r2/niches/impression-textile-suisse.md`.

**Incident évité à connaître** : `cp -R template/ <client>-r2/` copie aussi `template/.vercel` → le premier deploy est parti sur le projet `template` et a écrasé template-theta-plum avec les données client. Corrigé (template redéployé depuis `template/`, tokens de retour). Règle : **supprimer `.vercel` après duplication** avant `vercel link --project <client>-r2`. Aussi : les nouveaux projets Vercel ont la Deployment Protection SSO active par défaut → la désactiver via API (`PATCH /v9/projects/<p> {"ssoProtection": null}`) sinon le client tombe sur un login Vercel. Voir [[project_r2_template_system]] [[feedback_r2_transcript_complet_et_anticontamination]].
