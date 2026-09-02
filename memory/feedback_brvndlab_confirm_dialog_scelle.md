---
name: feedback-brvndlab-confirm-dialog-scelle
description: "Design SCELLÉ 26/08 de TOUTE confirmation destructive Brvndlab : composant src/components/ConfirmDialog.tsx (Tu confirmes ?, Annuler + bouton rouge #D9422F, voile flouté portail body), à utiliser partout, jamais window.confirm"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 2b34b718-d265-4ec1-b7dc-5707d62d9063
  modified: 2026-08-26T14:10:21.962Z
---

**Modale de confirmation Brvndlab — design scellé (26/08/2026, captures clair + sombre validées par Jonathan).**

Composant unique : `ConfirmModal` dans `src/components/ConfirmModal.tsx` (le doublon ConfirmDialog.tsx a été supprimé le 26/08). Toute suppression/action destructive du SaaS doit passer par lui. Il porte aussi `motDeConfirmation` (verrou fort : taper le mot exact, ex. « SUPPRIMER ») et le fichier exporte NoticeModal (avis) et PromptModal (saisie), même coquille.

- Voile : `bg-black/40 backdrop-blur-[6px]`, portail vers `<body>` (sidebar + header floutés), z-240.
- Carte : `w-[340px]`, `bg-[var(--surface)]`, radius 24 (rounded-3xl), `shadow-[0_30px_80px_-24px_rgba(0,0,0,0.5)]`, pop d'entrée .18s cubic-bezier(.22,1,.36,1).
- Titre : « Tu confirmes ? » 14px bold. Message : 12.5px `--text-muted`, cite l'objet (« Supprimer la tâche « X » ? … »).
- Boutons à droite : « Annuler » (pilule `--divider`/70) puis l'action en ROUGE PLEIN `#D9422F` (hover `#C23A29`), texte blanc, libellé libre (Supprimer, Archiver…).
- Échap + clic voile = Annuler. **Jamais `window.confirm`** (exigence répétée de Jonathan, déjà actée sur todo-vf).

**Why :** Jonathan a validé ce design sur /todo et exige la même modale dans TOUT le SaaS (chantier d'harmonisation lancé le 26/08, section par section).
**How to apply :** état local `useState<ConfirmState | null>` + `<ConfirmDialog confirm={c} onClose={() => setC(null)} />` ; remplacer tout window.confirm / modale maison par ce composant. Voir [[feedback-brvndlab-da-guardrail]].
