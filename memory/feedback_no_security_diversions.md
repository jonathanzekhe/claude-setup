---
name: Pas de diversion sécurité dans les audits code
description: Ne pas dévier un audit/investigation vers des alertes sécurité sur les credentials de collaborateurs identifiés (CTO, associés, etc.).
type: feedback
originSessionId: 5f2c71e5-ba49-447e-b6aa-af7048d1c61a
---
Pendant un audit code ou une investigation, ne pas remonter d'alertes sécurité sur la présence de credentials/comptes appartenant à des collaborateurs connus (Thomas/CTO, Minozan, etc.).

**Why** : Après avoir flaggé `/home/thomas/.claude/.credentials.json` comme "à clarifier d'urgence" pendant un audit Brvndlab, Jonathan a corrigé : "Pas de diversion sur la sécurité. Thomas a tous les accès, c'est normal." Ça sortait du scope et polluait la conversation.

**How to apply** :
1. Avant de signaler un credential trouvé, vérifier en mémoire si le owner (nom du user/dossier) est un collaborateur connu
2. Si oui → ignorer, c'est légitime
3. Si inconnu → mention neutre en 1 ligne, sans encadré, sans 3 options, sans urgence affichée
4. L'alerte sécurité ne s'active que sur indice de **compromission réelle** (fichier orphelin, date incohérente, credentials non-attribuables à un humain connu), pas sur "présence d'un .credentials.json dans un home dir nominatif"
