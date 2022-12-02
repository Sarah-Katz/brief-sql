--Compter le nombre de postes de chaque type
SELECT
    type_poste,
    COUNT(type_poste)
FROM
    poste
GROUP BY
    type_poste;

--Compter le nombre de logiciels installés par année
SELECT
    extract(
        year
        from
            date_ins
    ),
    COUNT(
        extract(
            year
            from
                date_ins
        )
    )
FROM
    installer
GROUP BY
    extract(
        year
        from
            date_ins
    );