---
name: realelec-offre-santos
description: "Client RealElec SA (électricité Lausanne), offre IA VividFlow, données légales confirmées et périmètre"
metadata: 
  node_type: memory
  type: project
  originSessionId: 3b3cd24f-851e-4822-bcf1-d96bb749c989
  modified: 2026-08-12T13:06:20.294Z
---

Client acquisition VividFlow, prospect chaud après R1 (08/08, tl;dv) et R2 (12/08, physique, transcript Wispr complet dans VividFlow/bouquet-supreme-r2/jorge-santos-r2/transcript-r2-2026-08-12-complet.md). Dernière phrase de Jorge : "J'attends votre offre."

**Données légales CONFIRMÉES (Zefix/Moneyhouse) :** RealElec SA (un seul mot, "elec" minuscule, PAS "RealELEC"). IDE CHE-106.381.451. SA fondée le 23.11.1988 (donc ~36 ans, pas 15). Chemin d'Entre-Bois 29, 1018 Lausanne (VD), succursales Villars-Sainte-Croix, Montreux, Collonges. Dirigeant : Jorge Antunes Dos Santos (Jorge, PAS Georges), directeur/administrateur, domicilié Ecublens. Vice-directeur Ludovic Pereira. ~20-27 collaborateurs. Fille Morgan Santos = assistante chef de projet, référente IA côté client (non au RC, normal).

**Prix annoncé en RDV (à respecter) :** 5 000 CHF la première brique, audit d'intégration inclus. Acompte 50 % signature, solde mise en service. Serveur Infomaniak + consommation IA à la charge du client, à l'usage.

**Objection réelle de Jorge (pas le prix) :** peur de payer 5000, d'être bloqué (pas de serveur, pas prêt) et qu'on redemande 5000 pour la suite. Peur que l'IA voie les salaires/banques. Réponse dans l'offre : article Souveraineté et accès (paie/banques exclus), et vendre le résultat pas l'accès total à l'ERP.

**Concurrent en embuscade :** Skillder (Suisse, réf. Orlati BTP), modèle abonnement avec dépendance à leur plateforme. Différenciateur VividFlow : la solution appartient au client.

**Périmètre brique 1 :** centralisation + agents autonomes + serveur + relevé du vendredi automatisé + tableau de bord + pilotage WhatsApp + fin double saisie. Briques suivantes (roadmap, sur devis) : offres/factures sur liste de prix branche, solution interne qui remplace l'ERP, acquisition, partenariat continu.

**Faisabilité technique (recherche 12/08, voir zone-de-travail-outils-acces.md) :** lecture/extraction data ~90%, écriture ERP ~65-70%. Le "crypté" (PDF chiffrés au repos dans l'ERP) ne bloque pas : on récupère via les EXPORTS que les logiciels sortent déjà déchiffrés. Éditeur unique = Polylog SA (Préverenges) pour ERP Office.Manager DX + WinProgitel EX + PWA Yog. Liste de prix = catalogue CAN/NPK d'EIT.swiss (890 CHF membre, 2050 non-membre), licenciable en direct. Accès remote = RDS/RemoteApp Windows ; pilotage via agent-rdp (client RDP + UI Automation, injecté, DVC) ou computer-use vision ; récupération via export → dossier de transfert → OneDrive lu par Microsoft Graph. Whitelist IP à gérer par mini-PC relais Tailscale chez RealElec. Hermes (agent de Jonathan) = bon orchestrateur (WhatsApp, cron vendredi, skills, MCP Graph), pilotage RDP délégué à agent-rdp en skill. POC en 5 tests à cadrer dans l'audit inclus.

**Livrable :** offre-realelec.html (6 pages A4, ref VF-2026-118), base charte contrat AGCI VF-2026-101. RÈGLES DE FORME (Jonathan strict) : jamais d'em-dash (remplacer par deux-points/virgules), pas d'astérisque ✱ en haut à droite, densité (pas de trous ni d'espace vide), titres concrets centrés sur le pilotage/gestion pas sur l'électricité, nom légal exact toujours. Voir [[wispr-flow-meetings-local]].
