--création de la table
CREATE TABLE type (
    type_lp VARCHAR(4),
    nom_type VARCHAR(20),
    PRIMARY KEY(type_lp)
);

--insertion des données
INSERT INTO
    type (type_lp, nom_type)
VALUES
    ('TX', 'Terminal X-WINDOWS'),
    ('UNIX', 'Système Unix'),
    ('PCXP', 'PC Windows XP'),
    ('PCWS', 'PC Windows Server'),
    ('NC', 'Network Computer');

--modification des tables 'poste' et 'logiciel'
ALTER TABLE
    poste
ADD
    FOREIGN KEY (type_poste) REFERENCES type(type_lp);

ALTER TABLE
    logiciel
ADD
    FOREIGN KEY (type_logiciel) REFERENCES type(type_lp);