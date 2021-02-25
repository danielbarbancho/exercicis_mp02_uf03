USE videoclub;

DROP TABLE IF EXISTS VISUALITZACIONS;

CREATE TABLE VISUALITZACIONS (
id_peli smallint unsigned,
id_soci varchar(10),
temps time NULL,
FOREIGN KEY (id_soci)
REFERENCES SOCIS (id_soci),
FOREIGN KEY (id_peli)
REFERENCES PELLICULES (id_peli)
);

INSERT INTO VISUALITZACIONS VALUES (1, 1111, '00:15:23');
INSERT INTO VISUALITZACIONS VALUES (2, 3333, '00:05:15');
INSERT INTO VISUALITZACIONS VALUES (5, 4444, '00:01:54');