# exercicis_mp02_uf03
exercici del modul professional 2 de la unitat formativa 3.

# Correcció exercicis

Revisió dels exercicis de la **unitat formativa 3** del **mòdul professional 2**.

|Enunciat|Fitxer|Comentari|Nota|
|--------|------|---------|----|
|**Enunciat 9**|BarbanchoDaniel_Act_03_ProcEmm_MySQL_Apartat009|Complert|10|
|**Enunciat 11**|sp11_UsuariVeure|No funciona|0|
|**Enunciat 12**|BarbanchoDaniel_Act_03_ProcEmm_MySQL_Apartat012|Complert|10|
|**Enunciat 13**|BarbanchoDaniel_Act_03_ProcEmm_MySQL_Apartat013|Complert|10|


# Exemple de correcció

Cal que ompliu el fitxer **```README.md```** del vostre repositori amb la següent informació per a cadascun dels enunciats.

# **Enunciat 8**:

## Emprant l’**activitat 6**, dissenya un cursor que llisti els mateixos camps per a totes les pel·lícules.

**1. Enllaç al fitxer**

[Act08.sql](https://github.com/joanpardogine/exercicis_mp02_uf03/blob/master/Cursors/Act08.sql)

**2. Contingut del fitxer**

```sql
use videoclub;
drop procedure if exists act8;
delimiter //
create procedure act8()
begin
   declare recaptat bigint default 0;
   declare pressu bigint default 0;
   declare titol varchar(40);
   declare rendibilitat varchar(15);
   declare final int default false;
   
   declare elcursor cursor for
      select titol_peli, recaudacio_peli, pressupost_peli
      from PELLICULES;

   declare continue handler for not found set final = 1;
   open elcursor;
   elbucle:loop
      fetch elcursor into titol, recaptat, pressu;
      
      if final = 1 then
         leave elbucle;
      end if;
      
      if (pressu>recaptat) then
         set rendibilitat = "Deficitari";
      elseif (pressu*2 > recaptat) then
         set rendibilitat = "Suficient";
      else
         set rendibilitat = "Bona";
      end if;
      
      select titol, rendibilitat;
   
   end loop elbucle; 
   close elcursor;
end//

delimiter ;

-- call act8();
```

**3. Sortida de la creació del procediment**
```sql
mysql> use videoclub;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> drop procedure if exists act8;
Query OK, 0 rows affected (1.69 sec)

mysql> delimiter //
mysql> create procedure act8()
    -> begin
    ->    declare recaptat bigint default 0;
    ->    declare pressu bigint default 0;
    ->    declare titol varchar(40);
    ->    declare rendibilitat varchar(15);
    ->    declare final int default false;
    ->    
    ->    declare elcursor cursor for
    ->       select titol_peli, recaudacio_peli, pressupost_peli
    ->       from PELLICULES;
    -> 
    ->    declare continue handler for not found set final = 1;
    ->    open elcursor;
    ->    elbucle:loop
    ->       fetch elcursor into titol, recaptat, pressu;
    ->       
    ->       if final = 1 then
    ->          leave elbucle;
    ->       end if;
    ->       
    ->       if (pressu>recaptat) then
    ->          set rendibilitat = "Deficitari";
    ->       elseif (pressu*2 > recaptat) then
    ->          set rendibilitat = "Suficient";
    ->       else
    ->          set rendibilitat = "Bona";
    ->       end if;
    ->       
    ->       select titol, rendibilitat;
    ->    
    ->    end loop elbucle; 
    ->    close elcursor;
    -> end//
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> delimiter ;
mysql> 
```

**4. Sortida de l'execució del procediment**
```sql
mysql> call act8();
+-------------+--------------+
| titol       | rendibilitat |
+-------------+--------------+
| LA BUSQUEDA | Suficient    |
+-------------+--------------+
1 row in set (0.00 sec)

+-------------+--------------+
| titol       | rendibilitat |
+-------------+--------------+
| LA TERMINAL | Bona         |
+-------------+--------------+
1 row in set (0.00 sec)

+-------------+--------------+
| titol       | rendibilitat |
+-------------+--------------+
| Mar adentro | Bona         |
+-------------+--------------+
1 row in set (0.00 sec)

+-----------+--------------+
| titol     | rendibilitat |
+-----------+--------------+
| Colateral | Bona         |
+-----------+--------------+
1 row in set (0.00 sec)

+--------------------+--------------+
| titol              | rendibilitat |
+--------------------+--------------+
| Los 4 fantásticos  | Suficient    |
+--------------------+--------------+
1 row in set (0.00 sec)

+----------+--------------+
| titol    | rendibilitat |
+----------+--------------+
| Sin City | Suficient    |
+----------+--------------+
1 row in set (0.00 sec)

+----------+--------------+
| titol    | rendibilitat |
+----------+--------------+
| IRON MAN | Bona         |
+----------+--------------+
1 row in set (0.00 sec)

+----------------+--------------+
| titol          | rendibilitat |
+----------------+--------------+
| Los Vengadores | Bona         |
+----------------+--------------+
1 row in set (0.00 sec)

+----------------------------------+--------------+
| titol                            | rendibilitat |
+----------------------------------+--------------+
| Los Vengadores: La era de Ultron | Bona         |
+----------------------------------+--------------+
1 row in set (0.00 sec)

+----------------------------------+--------------+
| titol                            | rendibilitat |
+----------------------------------+--------------+
| La busqueda 2: El diario secreto | Bona         |
+----------------------------------+--------------+
1 row in set (0.00 sec)

+------------+--------------+
| titol      | rendibilitat |
+------------+--------------+
| IRON MAN 2 | Bona         |
+------------+--------------+
1 row in set (0.00 sec)

+------------+--------------+
| titol      | rendibilitat |
+------------+--------------+
| Iron Man 3 | Bona         |
+------------+--------------+
1 row in set (0.00 sec)

+---------------------------------------+--------------+
| titol                                 | rendibilitat |
+---------------------------------------+--------------+
| Capitán América: El primer vengador   | Bona         |
+---------------------------------------+--------------+
1 row in set (0.00 sec)

+-------------------------------------------+--------------+
| titol                                     | rendibilitat |
+-------------------------------------------+--------------+
| Capitán América: El Soldado de Invierno   | Bona         |
+-------------------------------------------+--------------+
1 row in set (0.01 sec)

+------------------------------+--------------+
| titol                        | rendibilitat |
+------------------------------+--------------+
| Capitán América: Civil War   | Bona         |
+------------------------------+--------------+
1 row in set (0.01 sec)

+-------+--------------+
| titol | rendibilitat |
+-------+--------------+
| Joker | Deficitari   |
+-------+--------------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)
```

---

# **Enunciat 9**:

## Emprant l’**activitat 7**, dissenya un cursor que llisti els mateixos camps per a tots els intèrprets.

**1. Enllaç al fitxer**

https://github.com/danielbarbancho/exercicis_mp02_uf03/blob/main/BarbanchoDaniel_Act_03_ProcEmm_MySQL_Apartat009.sql
**2. Contingut del fitxer**
```sql
   USE videoclub;

DELIMITER //

DROP PROCEDURE IF EXISTS act09_precedere//


CREATE PROCEDURE act09_precedere()
BEGIN

DECLARE cActor bigint default 0;
DECLARE final int default false;

DECLARE elcursor cursor for
SELECT id_actor
FROM ACTORS;

DECLARE continue handler for not found set final = 1;
OPEN elcursor;
elbucle:loop
FETCH elcursor into cActor;

IF final = 1 then
leave elbucle;
END IF;
SELECT nom_actor, year(curdate()) - anynaix_actor"anys", anynaix_actor, sexe_actor,
/*condicio home*/
IF(sexe_actor="home",
IF(year(curdate()) - anynaix_actor<15,"nen",
IF(year(curdate()) - anynaix_actor BETWEEN 15 AND 25,"home adolescent i jove",
IF(year(curdate()) - anynaix_actor BETWEEN 26 AND 40, "home adult",
IF(year(curdate()) - anynaix_actor BETWEEN 41 AND 60, "home madur",
IF(year(curdate()) - anynaix_actor>61, "home gran",""))))),

/*condicio dona*/
IF(year(curdate()) - anynaix_actor<15,"nena",
IF(year(curdate()) - anynaix_actor BETWEEN 15 AND 25,"dona adolescent i jove",
IF(year(curdate()) - anynaix_actor BETWEEN 26 AND 40, "dona adult",
IF(year(curdate()) - anynaix_actor BETWEEN 41 AND 60, "dona madura",
IF(year(curdate()) - anynaix_actor>61, "dona gran","")))))) as "Paper que pot interpretar"
FROM ACTORS
WHERE ACTORS.id_actor = cActor;
END loop elbucle;
CLOSE elcursor;
END//

DELIMITER ;

call act09_precedere();
```

**3. Sortida de la creació del procediment**
```sql
   mysql> CREATE PROCEDURE act09_precedere()
    -> BEGIN
    ->
    -> DECLARE cActor bigint default 0;
    -> DECLARE final int default false;
    ->
    -> DECLARE elcursor cursor for
    -> SELECT id_actor
    -> FROM ACTORS;
    ->
    -> DECLARE continue handler for not found set final = 1;
    -> OPEN elcursor;
    -> elbucle:loop
    -> FETCH elcursor into cActor;
    ->
    -> IF final = 1 then
    -> leave elbucle;
    -> END IF;
    -> SELECT nom_actor, year(curdate()) - anynaix_actor"anys", anynaix_actor, sexe_actor,
    -> /*condicio home*/
    -> IF(sexe_actor="home",
    -> IF(year(curdate()) - anynaix_actor<15,"nen",
    -> IF(year(curdate()) - anynaix_actor BETWEEN 15 AND 25,"home adolescent i jove",
    -> IF(year(curdate()) - anynaix_actor BETWEEN 26 AND 40, "home adult",
    -> IF(year(curdate()) - anynaix_actor BETWEEN 41 AND 60, "home madur",
    -> IF(year(curdate()) - anynaix_actor>61, "home gran",""))))),
    ->
    -> /*condicio dona*/
    -> IF(year(curdate()) - anynaix_actor<15,"nena",
    -> IF(year(curdate()) - anynaix_actor BETWEEN 15 AND 25,"dona adolescent i jove",
    -> IF(year(curdate()) - anynaix_actor BETWEEN 26 AND 40, "dona adult",
    -> IF(year(curdate()) - anynaix_actor BETWEEN 41 AND 60, "dona madura",
    -> IF(year(curdate()) - anynaix_actor>61, "dona gran","")))))) as "Paper que pot interpretar"
    -> FROM ACTORS
    -> WHERE ACTORS.id_actor = cActor;
    -> END loop elbucle;
    -> CLOSE elcursor;
    -> END//
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> DELIMITER ;

```

**4. Sortida de l'execució del procediment**
```sql
   
+--------------+------+---------------+------------+---------------------------+
| nom_actor    | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+--------------+------+---------------+------------+---------------------------+
| Nicolas Cage |   57 |          1964 | home       | home madur                |
+--------------+------+---------------+------------+---------------------------+
1 row in set (0.00 sec)

+--------------+------+---------------+------------+---------------------------+
| nom_actor    | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+--------------+------+---------------+------------+---------------------------+
| Diane Kruger |   45 |          1976 | dona       | dona madura               |
+--------------+------+---------------+------------+---------------------------+
1 row in set (0.00 sec)

+-----------+------+---------------+------------+---------------------------+
| nom_actor | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+-----------+------+---------------+------------+---------------------------+
| Tom Hanks |   65 |          1956 | home       | home gran                 |
+-----------+------+---------------+------------+---------------------------+
1 row in set (0.00 sec)

+----------------------+------+---------------+------------+---------------------------+
| nom_actor            | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+----------------------+------+---------------+------------+---------------------------+
| Catherine Zeta-Jones |   52 |          1969 | dona       | dona madura               |
+----------------------+------+---------------+------------+---------------------------+
1 row in set (0.00 sec)

+---------------+------+---------------+------------+---------------------------+
| nom_actor     | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+---------------+------+---------------+------------+---------------------------+
| Javier Bardem |   52 |          1969 | home       | home madur                |
+---------------+------+---------------+------------+---------------------------+
1 row in set (0.00 sec)

+------------+------+---------------+------------+---------------------------+
| nom_actor  | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+------------+------+---------------+------------+---------------------------+
| Tom Cruise |   59 |          1962 | home       | home madur                |
+------------+------+---------------+------------+---------------------------+
1 row in set (0.00 sec)

+------------+------+---------------+------------+---------------------------+
| nom_actor  | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+------------+------+---------------+------------+---------------------------+
| Jamie Foxx |   54 |          1967 | home       | home madur                |
+------------+------+---------------+------------+---------------------------+
1 row in set (0.00 sec)

+--------------+------+---------------+------------+---------------------------+
| nom_actor    | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+--------------+------+---------------+------------+---------------------------+
| Jessica Alba |   40 |          1981 | dona       | dona adult                |
+--------------+------+---------------+------------+---------------------------+
1 row in set (0.00 sec)

+---------------+------+---------------+------------+---------------------------+
| nom_actor     | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+---------------+------+---------------+------------+---------------------------+
| Ioan Gruffudd |   48 |          1973 | home       | home madur                |
+---------------+------+---------------+------------+---------------------------+
1 row in set (0.00 sec)

+-------------------+------+---------------+------------+---------------------------+
| nom_actor         | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+-------------------+------+---------------+------------+---------------------------+
| Robert Downey Jr. |   56 |          1965 | home       | home madur                |
+-------------------+------+---------------+------------+---------------------------+
1 row in set (0.00 sec)

+-----------------+------+---------------+------------+---------------------------+
| nom_actor       | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+-----------------+------+---------------+------------+---------------------------+
| Gwyneth Paltrow |   49 |          1972 | dona       | dona madura               |
+-----------------+------+---------------+------------+---------------------------+
1 row in set (0.00 sec)

+-----------------+------+---------------+------------+---------------------------+
| nom_actor       | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+-----------------+------+---------------+------------+---------------------------+
| Chris Hemsworth |   38 |          1983 | home       | home adult                |
+-----------------+------+---------------+------------+---------------------------+
1 row in set (0.00 sec)

+--------------+------+---------------+------------+---------------------------+
| nom_actor    | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+--------------+------+---------------+------------+---------------------------+
| Mark Ruffalo |   54 |          1967 | home       | home madur                |
+--------------+------+---------------+------------+---------------------------+
1 row in set (0.00 sec)

+-------------+------+---------------+------------+---------------------------+
| nom_actor   | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+-------------+------+---------------+------------+---------------------------+
| Chris Evans |   40 |          1981 | home       | home adult                |
+-------------+------+---------------+------------+---------------------------+
1 row in set (0.00 sec)

+--------------------+------+---------------+------------+---------------------------+
| nom_actor          | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+--------------------+------+---------------+------------+---------------------------+
| Scarlett Johansson |   37 |          1984 | dona       | dona adult                |
+--------------------+------+---------------+------------+---------------------------+
1 row in set (0.00 sec)

+---------------+------+---------------+------------+---------------------------+
| nom_actor     | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+---------------+------+---------------+------------+---------------------------+
| Jeremy Renner |   40 |          1981 | home       | home adult                |
+---------------+------+---------------+------------+---------------------------+
1 row in set (0.00 sec)

+--------------+------+---------------+------------+---------------------------+
| nom_actor    | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+--------------+------+---------------+------------+---------------------------+
| James Spader |   61 |          1960 | home       |                           |
+--------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+-----------------+------+---------------+------------+---------------------------+
| nom_actor       | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+-----------------+------+---------------+------------+---------------------------+
| Michael Chiklis |   52 |          1969 | home       | home madur                |
+-----------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+---------------+------+---------------+------------+---------------------------+
| nom_actor     | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+---------------+------+---------------+------------+---------------------------+
| Hayley Atwell |   39 |          1982 | dona       | dona adult                |
+---------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+----------------+------+---------------+------------+---------------------------+
| nom_actor      | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+----------------+------+---------------+------------+---------------------------+
| Sebastian Stan |   39 |          1982 | home       | home adult                |
+----------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+-----------------+------+---------------+------------+---------------------------+
| nom_actor       | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+-----------------+------+---------------+------------+---------------------------+
| Anya Taylor-Joy |   41 |          1980 | dona       | dona madura               |
+-----------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+-------------+------+---------------+------------+---------------------------+
| nom_actor   | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+-------------+------+---------------+------------+---------------------------+
| Regina King |   50 |          1971 | dona       | dona madura               |
+-------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+----------------+------+---------------+------------+---------------------------+
| nom_actor      | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+----------------+------+---------------+------------+---------------------------+
| Eddie Redmayne |   41 |          1980 | home       | home madur                |
+----------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+---------------+------+---------------+------------+---------------------------+
| nom_actor     | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+---------------+------+---------------+------------+---------------------------+
| Nicole Kidman |   46 |          1975 | dona       | dona madura               |
+---------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+-----------------+------+---------------+------------+---------------------------+
| nom_actor       | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+-----------------+------+---------------+------------+---------------------------+
| Joaquin Phoenix |   47 |          1974 | home       | home madur                |
+-----------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+----------------+------+---------------+------------+---------------------------+
| nom_actor      | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+----------------+------+---------------+------------+---------------------------+
| Robert De Niro |   78 |          1943 | home       | home gran                 |
+----------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

+-------------+------+---------------+------------+---------------------------+
| nom_actor   | anys | anynaix_actor | sexe_actor | Paper que pot interpretar |
+-------------+------+---------------+------------+---------------------------+
| Zazie Beetz |   30 |          1991 | dona       | dona adult                |
+-------------+------+---------------+------------+---------------------------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

```

---

# **Enunciat 11**:

## Dissenya una funció que rebent un codi de pel·lícula torni el nombre d’usuaris que l’han vist.<br>Utilitza aquesta funció per llistar el títol de la pel·lícula i el nom de l’usuari.

**1. Enllaç al fitxer**
https://github.com/danielbarbancho/exercicis_mp02_uf03/blob/main/sp11_usuariVeure.sql

**2. Contingut del fitxer**
```sql
  USE videoclub;

DELIMITER //

DROP FUNCTION IF EXISTS sp11_usuariVeure//

CREATE FUNCTION sp11_usuariVeure(p_CodiPeli SMALLINT UNSIGNED)
RETURNS SMALLINT UNSIGNED
DETERMINISTIC
BEGIN

DECLARE Qtat_Exemp SMALLINT UNSIGNED;

SELECT COUNT(*)
INTO Qtat_Exemp
FROM EXEMPLARS
WHERE id_peli = p_CodiPeli;

RETURN Qtat_Exemp;

END//

DELIMITER ;


// Proba del sql.

SELECT titol_peli Titol, sp11_usuariVeure "Quantitat de exemplars"
FROM PELLICULES
id_peli = 1;
```

**3. Sortida de la creació del procediment**
```sql
   
mysql> CREATE FUNCTION sp11_usuariVeure(p_CodiPeli SMALLINT UNSIGNED)
    -> RETURNS SMALLINT UNSIGNED
    -> DETERMINISTIC
    -> BEGIN
    ->
    -> DECLARE Qtat_Exemp SMALLINT UNSIGNED;
    ->
    -> SELECT COUNT(*)
    -> INTO Qtat_Exemp
    -> FROM EXEMPLARS
    -> WHERE id_peli = p_CodiPeli;
    ->
    -> RETURN Qtat_Exemp;
    ->
    -> END//
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> DELIMITER ;

```

**4. Sortida de l'execució del procediment**
```sql
  ERROR
```

---

# **Enunciat 12**:

## Dissenya una funció que rebi el codi d’una pel·lícula i torni el nom i cognoms del seu actor principal.<br>Utilitza aquesta funció per llistar el títol de la pel·lícula i el nom i cognoms del seu actor principal.

**1. Enllaç al fitxer**
https://github.com/danielbarbancho/exercicis_mp02_uf03/blob/main/BarbanchoDaniel_Act_03_ProcEmm_MySQL_Apartat012.sql

**2. Contingut del fitxer**
```sql
   USE videoclub;

DELIMITER //

DROP PROCEDURE IF EXISTS act12_actorPrPeli//

CREATE PROCEDURE act12_actorPrPeli(
IN codi_peli smallint)
BEGIN

SELECT nom_actor
FROM ACTORS
INNER JOIN ACTORS_PELLICULES
ON ACTORS.id_actor = ACTORS_PELLICULES.id_actor
WHERE principal = true AND id_peli = codi_peli;

END//

DELIMITER ;

CALL act12_actorPrPeli(1);
```

**3. Sortida de la creació del procediment**
```sql
   
mysql> CREATE PROCEDURE act12_actorPrPeli(
    -> IN codi_peli smallint)
    -> BEGIN
    ->
    -> SELECT nom_actor
    -> FROM ACTORS
    -> INNER JOIN ACTORS_PELLICULES
    -> ON ACTORS.id_actor = ACTORS_PELLICULES.id_actor
    -> WHERE principal = true AND id_peli = codi_peli;
    ->
    -> END//
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> DELIMITER ;

```

**4. Sortida de l'execució del procediment**
```sql
   
mysql> CALL act12_actorPrPeli(1);
+--------------+
| nom_actor    |
+--------------+
| Nicolas Cage |
+--------------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

```

---

# **Enunciat 13**:

## Fes una funció que torni el codi de pel·lícula que més ha recaptat.<br>Emprant la funció anterior i la funció de l’**activitat 12**, llista el títol, actor principal i recaptació de la pel·lícula que més ha recaptat.

**1. Enllaç al fitxer**
https://github.com/danielbarbancho/exercicis_mp02_uf03/blob/main/BarbanchoDaniel_Act_03_ProcEmm_MySQL_Apartat013.sql

**2. Contingut del fitxer**
```sql
     
USE videoclub;

DELIMITER //

DROP PROCEDURE IF EXISTS act13_peliPrMax//

CREATE PROCEDURE act13_peliPrMax()
BEGIN

SELECT id_peli
FROM PELLICULES
WHERE recaudacio_peli = (SELECT MAX(recaudacio_peli) FROM PELLICULES);

END//

DELIMITER ;

CALL act13_peliPrMax();
```

**3. Sortida de la creació del procediment**
```sql
   
mysql> CREATE PROCEDURE act13_peliPrMax()
    -> BEGIN
    ->
    -> SELECT id_peli
    -> FROM PELLICULES
    -> WHERE recaudacio_peli = (SELECT MAX(recaudacio_peli) FROM PELLICULES);
    ->
    -> END//
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> DELIMITER ;

```

**4. Sortida de l'execució del procediment**
```sql
  
mysql> CALL act13_peliPrMax();
+---------+
| id_peli |
+---------+
|      17 |
+---------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

```

---

