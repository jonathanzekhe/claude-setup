#!/usr/bin/env python3
"""Refuse un compte rendu de tour qui affirme au lieu de prouver.

Usage :
    python3 scripts/verifie_tour.py compte-rendu.md
    cat compte-rendu.md | python3 scripts/verifie_tour.py -

Sortie : la liste des refus, un par ligne, puis un verdict.
Code de retour 0 si le compte rendu est recevable, 1 sinon.

Ce contrôle est volontairement bête et déterministe : il ne juge pas la qualité
du travail, il vérifie qu'un humain pourra le vérifier. C'est le seul garde-fou
qui ne se laisse pas convaincre par une rédaction assurée.
"""

import re
import sys

# Sections attendues. « Non vérifié » est la plus importante : c'est celle qu'on
# oublie quand on veut annoncer un succès.
SECTIONS = ["Plan", "Action", "Résultat", "Non vérifié", "Diagnostic"]

# Formules qui affirment sans montrer. Repérées dans de vrais comptes rendus.
FORMULES_VIDES = [
    "ça marche", "ca marche", "tout est bon", "c'est propre", "c'est fait",
    "fonctionne correctement", "sans problème", "sans probleme", "rien à signaler",
    "rien a signaler", "comme prévu", "comme prevu",
]

# Un résultat crédible contient au moins un nombre : un total, un compte, une durée.
NOMBRE = re.compile(r"\d")

# Une preuve se relance : commande, requête, capture, fichier.
INDICES_PREUVE = [
    "preuve", "commande", "requête", "requete", "sortie", "capture", "screenshot",
    "avant", "après", "apres", "relanc", "mesur", "npx", "python", "curl", "select",
    "grep", "test",
]


def sections_du(texte):
    """Découpe le compte rendu en sections repérées par « Nom : ». Tolère l'absence
    d'accents et les espaces d'alignement, pour ne pas refuser sur de la mise en forme."""
    espace = r"\s+"
    # Un nom de section, ses espaces internes remplacés par \s+ pour tolérer l'alignement.
    def souple(nom):
        return espace.join(re.escape(mot) for mot in nom.split(" "))

    tous = "|".join(souple(s) for s in SECTIONS)
    trouvees = {}
    for nom in SECTIONS:
        motif = re.compile(
            r"^\s*" + souple(nom) + r"\s*:(.*?)(?=^\s*(?:" + tous + r")\s*:|\Z)",
            re.IGNORECASE | re.MULTILINE | re.DOTALL,
        )
        m = motif.search(texte)
        if m:
            trouvees[nom] = m.group(1).strip()
    return trouvees


def verifie(texte):
    """Renvoie la liste des refus. Liste vide = compte rendu recevable."""
    refus = []
    sections = sections_du(texte)

    for nom in SECTIONS:
        if nom not in sections:
            refus.append(f"Section « {nom} » absente.")
        elif not sections[nom]:
            refus.append(f"Section « {nom} » vide.")

    resultat = sections.get("Résultat", "")
    if resultat:
        if not NOMBRE.search(resultat):
            refus.append(
                "« Résultat » ne contient aucun chiffre. Un résultat qui ne se mesure pas "
                "ne se vérifie pas : donne l'état avant et après."
            )
        bas = resultat.lower()
        if not any(indice in bas for indice in INDICES_PREUVE):
            refus.append(
                "« Résultat » ne montre aucune preuve relançable : nomme la commande, "
                "la requête ou la capture qui l'établit."
            )

    diagnostic = sections.get("Diagnostic", "")
    if diagnostic:
        note = re.search(r"(\d+(?:[.,]\d+)?)\s*/\s*10", diagnostic)
        if not note:
            refus.append("« Diagnostic » ne porte pas de note sur 10.")
        else:
            valeur = float(note.group(1).replace(",", "."))
            if valeur < 8:
                refus.append(
                    f"Note de {note.group(1)}/10 : sous 8, le tour n'est pas terminé. "
                    "Repars avec une nouvelle hypothèse."
                )

    bas_total = texte.lower()
    for formule in FORMULES_VIDES:
        if formule in bas_total:
            refus.append(
                f"Formule qui affirme sans montrer : « {formule} ». "
                "Remplace-la par la sortie réelle."
            )
            break

    return refus


def main():
    if len(sys.argv) != 2:
        print(__doc__)
        return 2

    chemin = sys.argv[1]
    if chemin == "-":
        texte = sys.stdin.read()
    else:
        try:
            with open(chemin, encoding="utf-8") as f:
                texte = f.read()
        except FileNotFoundError:
            print(f"Fichier introuvable : {chemin}")
            return 2
        except PermissionError:
            print(f"Lecture impossible : {chemin}")
            return 2

    if not texte.strip():
        print("REFUSÉ : compte rendu vide.")
        return 1

    refus = verifie(texte)
    if not refus:
        print("RECEVABLE : sections présentes, résultat chiffré, preuve nommée, note >= 8.")
        return 0

    print(f"REFUSÉ, {len(refus)} point(s) à corriger :")
    for r in refus:
        print(f"  - {r}")
    return 1


if __name__ == "__main__":
    sys.exit(main())
