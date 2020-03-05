use tp3;
/************ 3. Vues *********/
/*
1. département, la somme de la commission et du salaire baptisée GAINS, le lieu du
département.
*/

CREATE OR REPLACE VIEW V_EMP AS
SELECT EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID, (SALARY + IFNULL(COMMISSION_PCT, 0)) AS GAINS, STREET_ADDRESS
FROM EMPLOYEES NATURAL JOIN DEPARTMENTS NATURAL JOIN LOCATIONS;

/*
2. Essayez de mettre à jour le nom de l’employé John à travers la vue V_EMP.
*/

SELECT * FROM V_EMP10;

UPDATE V_EMP
SET LAST_NAME = "John"
WHERE LAST_NAME = "John";


/*
3. Créer une vue V_EMP10 qui ne contient que les employés du département 10 de la table
EMPLOYEES.
*/
CREATE OR REPLACE VIEW V_EMP AS
SELECT EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID, (SALARY + IFNULL(COMMISSION_PCT, 0)) AS GAINS, STREET_ADDRESS
FROM EMPLOYEES NATURAL JOIN DEPARTMENTS NATURAL JOIN LOCATIONS
WHERE EMPLOYEES.DEPARTMENT_ID = 10;

/*
4. Insérer dans cette vue un employé PAUL qui appartient au département 20. Essayer ensuite de
retrouver cet employé au moyen de la vue V_EMP10 puis au moyen de la table EMPLOYEES.
*/


/*********** 4. Droits d’accès ***********/

/*
1. Insérer votre propre nom dans la table EMPLOYEES, avec le numéro et département de votre choix.
*/



/*
2. Arrangez-vous avec un autre étudiant : accordez-vous mutuellement le droit de sélection sur votre table
EMPLOYEES et allez consulter sa table EMPLOYEES.
3. Vérifiez que les ordres INSERT et UPDATE vous sont interdits sur la table EMPLOYEES qui ne vous
appartient pas. Accordez-vous mutuellement l’autorisation de modification sur la table EMP. Essayez
à nouveau les ordres INSERT et UPDATE.
5. Accès concurrents
1. Ouvrir deux sessions sous le même nom.
2. Apporter une modification dans une des sessions et vérifier si les modifications sont connues de l’autre
session.
3. Faire un COMMIT des modifications puis vérifier si les modifications sont connues de l’autre session.
4. Modifier une même ligne dans les deux sessions. Que se passe-t-il ?
5. Faire un COMMIT sur la session qui a fait les modifications en premier. Que se passe-t-il ?
6. Utiliser un SELECT FOR UPDATE sur une des sessions puis modifier les lignes bloquées avec l’autre
session.
6. PL/SQL
1. Déclarer les variables v_deptno, v_dname, v_loc correspondantes aux colonnes de DEPARTMENTS.
Insérez les valeurs 60, ‘MONTREAL’, ‘68’ dans la table DEPARTMENTS.
2. Afficher le nom, le salaire des cinq premiers employés de la table EMPLOYEES.
3. Ecrire une fonction avec un seul paramètre en entrée (le numéro employé) qui retourne le salaire d’un
employé.
7. Trigger
Ajouter un trigger sur la table EMPLOYEES qui vérifie que la colonne FIRST_NAME est un
champ obligatoire (n’est jamais NULL).
*/