---
name: project_brvndlab_audit_chaine_ia_2026_07_30
description: "Audit 2026-07-30 de la chaîne IA (seconde brain) : 3 étages qui fuient, validé par Jonathan + problème de fond des tokens gaspillés en refonte"
metadata: 
  node_type: memory
  type: project
  originSessionId: 8f02ca45-319a-4069-b1c4-24b2383f96ed
  modified: 2026-07-30T12:07:37.097Z
---

Audit complet de la chaîne IA Brvndlab fait le 2026-07-30 (3 agents, code lu dans ~/dev/brvndlab-claude/brvndlab-app), diagnostic validé par Jonathan ("c'est exactement ça"). Contexte de départ : les scripts ne reflètent pas assez qui est Jonathan (sa réflexion), et il veut durcir le promptage personnalité. L'audit montre que le problème est d'abord la tuyauterie, pas le dosage. Voir [[project_brvndlab_seconde_brain_two_levels_channels]] et [[project_brvndlab_generation_base_neutre_solide]].

**Étage 1 — CAPTURE (la brain apprend mal) :**
- L'original IA (référence du diff) vit en sessionStorage, purgé à chaque réouverture depuis la pipeline, jamais persisté en base. Contenu rouvert puis validé = diff perdu (script/carousel) ou FAUX diff (story fige un original déjà édité).
- Édition manuelle jamais détectée sur carousel/story (edited=false, signal CONFIRMATION à tort). Script OK.
- 2 chemins de mise en pipeline sans apprentissage : new/carousel et new/filmed.
- La refonte n'apprend rien directement ; le chat global du script EFFACE editedSections (retouches manuelles perdues).
- Une refonte 100 % IA acceptée est comptée comme correction humaine (bruit).

**Étage 2 — MOTEUR (apprentissage fragile) :**
- optimizeBrain renvoie la mémoire au modèle SANS la section (ame/regles/interdits/calibres) : reclassement à l'aveugle à chaque cycle, un interdit dur peut redevenir dosage.
- Échecs d'apprentissage = console.error only (leçon perdue) ; distillFond échoue sans AUCUN log ; brainMetrics compte les validations, pas les apprentissages réussis.
- distillFond reçoit une matière promptée "forme" (contraire à sa mission fond).

**Étage 3 — INJECTION (ce qui est appris est ignoré à l'écriture) :**
- LE TROU MAJEUR : passes éditeur/juge finales (script x3 passes, carousel, story) réécrivent le texte SANS brain ni Brand OS. Le dernier mot revient à un prompt générique qui peut effacer la signature du créateur.
- Interdits durs (hardRules en fin de prompt) respectés uniquement par generate-script ; 7 routes encore sur resolveBrainBlock compat (story, story-chat, refonte-content, IG, LinkedIn, brainstorm-explore) = interdits au milieu, affaiblis.
- Le FOND (fondInsights/convictions) n'est injecté QUE dans brainstorm-explore, jamais dans generate-script/carousel/story/refonte : la génération ne raisonne pas comme le créateur.
- Surfaces sans aucune brain : generate-titles (titres A/B !), story-slide, refine-slide custom (system prompt brut du client).
- brainstorm-explore : channel oral par défaut même pour carousel/story, Brand OS uniquement si le front l'envoie (pas de fallback serveur).
- VOICE hardcodé dans generate-instagram-caption : les légendes de Jonathan imposées comme modèle à TOUS les clients.
- Sécu : mutation publique adminPurgeByUser sans contrôle d'accès (vide la brain de n'importe qui).

**RÉPARÉ ET DÉPLOYÉ PROD le 2026-07-30** (commit 757950b5, Convex accurate-cormorant-297 + Vercel brvndlab-4e8wt68oy, alias app.brvndlab.com vérifié). Les 3 étages corrigés en une passe (validation Jonathan « je te laisse réparer les 4 blocs ») : passes éditeur/juge avec brain+hardRules, 7 routes migrées vers resolveBrainBlocks (hardRules en fin), resolveFondGenerationBlock (convictions validées, SANS challenge) injecté dans script/carousel/story/refonte, VOICE hardcodé Jonathan retiré d'Instagram, titres A/B personnalisés, canal+fallback Brand OS du brainstorm, aiOriginal persisté en base (write-once contentItems), faux original story réparé, flags manualEdited/refonteUsed + diff recoupé serveur, sections transmises à optimizeBrain, matière fond séparée, adminPurgeByUser verrouillé. Un commit de Thomas (b01496e1) préservé par rebase. Reste local : build local échoue sur NEXT_PUBLIC_CONVEX_URL absent du .env.local (préexistant, sans rapport) ; erreurs tsc préexistantes dans brand-os/edit et callbacks auth IG/TikTok/YT.

**BLOC 4 EN ATTENTE (brainstorm avec Jonathan, rien décidé) :** aller plus loin en profondeur pour que le premier jet soit bon d'office : brainstorming plus profond, systèmes de mémoire plus poussés. Métrique : moins de tours de refonte par contenu.

**Problème de fond ajouté par Jonathan (à intégrer au chantier) : les tokens gaspillés en REFONTE.**
Il voit les consommations : lui-même et les clients passent trop de refontes. La refonte lourde est un SYMPTÔME : si le brainstorm est profond et la mémoire bonne, le script devrait être bon presque du premier coup et la refonte devenir légère. Piste à creuser plus tard dans la conversation : pousser plus de profondeur dans le brainstorming et des systèmes de mémoire seconde brain plus poussés (rien de décidé). Métrique produit implicite : moins de tours de refonte par contenu = la chaîne marche.
