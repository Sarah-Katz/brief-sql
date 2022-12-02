CREATE TABLE segment (
    n_segment VARCHAR(10),
    nom_segment VARCHAR(20),
    PRIMARY KEY (n_segment)
);

CREATE TABLE salle (
    n_salle VARCHAR(10),
    nom_salle VARCHAR(20),
    nb_poste INTEGER,
    n_segment VARCHAR(10),
    PRIMARY KEY (n_salle),
    FOREIGN KEY (n_segment) REFERENCES segment(n_segment)
);

CREATE TABLE poste (
    n_poste VARCHAR(7),
    nom_poste VARCHAR(20),
    n_segment VARCHAR(10),
    ad VARCHAR(2),
    type_poste VARCHAR(20),
    n_salle VARCHAR(20),
    PRIMARY KEY (n_poste),
    FOREIGN KEY (n_segment) REFERENCES segment(n_segment),
    FOREIGN KEY (n_salle) REFERENCES salle(n_salle)
);

CREATE TABLE logiciel (
    n_logiciel VARCHAR(7),
    nom_logiciel VARCHAR(20),
    date_achat DATE,
    version VARCHAR(7),
    type_logiciel VARCHAR(20),
    PRIMARY KEY(n_logiciel)
);

CREATE TABLE installer (
    n_poste VARCHAR(7),
    n_logiciel VARCHAR(7),
    date_ins DATE,
    PRIMARY KEY(n_poste, n_logiciel),
    FOREIGN KEY (n_poste) REFERENCES poste(n_poste),
    FOREIGN KEY (n_logiciel) REFERENCES logiciel(n_logiciel)
);