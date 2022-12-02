--Lister tous les types de postes n’existant pas dans le parc informatique
SELECT
    type_lp
FROM
    type
EXCEPT
SELECT
    type_poste
FROM
    poste;

--Lister les types existants à la fois comme poste et comme logiciel
SELECT
    type_poste
FROM
    poste
INTERSECT
SELECT
    type_logiciel
FROM
    logiciel;

--Lister les types qui existent en tant que poste mais pas en tant que logiciel
SELECT
    type_poste
FROM
    poste
WHERE
    type_poste NOT IN (
        SELECT
            type_logiciel
        FROM
            logiciel
    );

--Lister les ip des postes qui contiennent le logiciel « Log6 »
SELECT
    n_segment,
    ad
FROM
    poste
WHERE
    n_poste IN (
        SELECT
            n_poste
        FROM
            installer
        WHERE
            n_logiciel = 'Log6'
    );

--Lister les ip des postes qui contiennent le logiciel de nom « Oracle 9i »
SELECT
    n_segment,
    ad
FROM
    poste
WHERE
    n_poste IN (
        SELECT
            n_poste
        FROM
            installer
        WHERE
            n_logiciel IN (
                SELECT
                    n_logiciel
                FROM
                    logiciel
                WHERE
                    nom_logiciel = 'Oracle 9i'
            )
    );

--Lister le nom des segments possédant exactement trois postes de type TX (La fameuse qui m'a bien bien saoulée)
SELECT
    nom_segment
FROM
    segment
WHERE
    n_segment IN (
        SELECT
            n_segment
        FROM
            poste
        WHERE
            type_poste = 'TX'
        GROUP BY
            n_segment
        HAVING
            poste.count = 3
    );

--Lister le nom des salles où l’on peut trouver au moins un poste avec le logiciel « Oracle 10g » installé
SELECT
    nom_salle
FROM
    salle
WHERE
    n_salle IN (
        SELECT
            n_salle
        FROM
            poste
        WHERE
            n_poste IN (
                SELECT
                    n_poste
                FROM
                    installer
                WHERE
                    n_logiciel IN (
                        SELECT
                            n_logiciel
                        FROM
                            logiciel
                        WHERE
                            nom_logiciel = 'Oracle 10g'
                    )
            )
    );