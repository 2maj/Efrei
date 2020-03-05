/*
IFNULL(attr, 0)
LIKE
*/


use tp2;
/*

*/

/*
1. Liste de tous les noms et prénoms des chercheurs, classée par ordre alphabétique sur le nom.
*/

SELECT NOM,PRENOM FROM CHERCHEUR ORDER BY NOM ASC;

/*
2. Liste de tous les budgets triés par ordre décroissant et sans doublons.
*/
SELECT DISTINCT BUDJET FROM PROJET ORDER BY BUDJET DESC;
/*
3. Liste de tous les projets dont le budget est entre 400000 et 900000 euros.
*/

SELECT * FROM PROJET WHERE BUDJET < 900000 AND BUDJET > 400000;

/*
4. Liste des projets en précisant pour chacun le nom de l’équipe à laquelle il appartient.
*/

SELECT P.NOM, P.BUDJET, P.NE, E.NOM FROM PROJET AS P JOIN EQUIPE AS E ON P.NE = E.NE;

/*
5. Lister tous les noms des projets, leurs budgets ainsi que les noms des chercheurs qui leur sont affectés.
*/

SELECT P.NOM, P.BUDJET, C.NOM
FROM PROJET P JOIN CHERCHEUR C
ON P.NE = C.NE;


/*
6. Lister les noms et prénoms des chercheurs qui n’ont participé à aucun projet
*/

SELECT NOM, PRENOM
FROM CHERCHEUR C LEFT OUTER JOIN AFF A
ON C.NC = A.NC
WHERE A.NP IS NULL;

/*
7. Lister tous les noms des projets, leurs budgets ainsi que le nombre de chercheurs qui leurs sont affectés.
Les projets auxquels n’est affecté aucun chercheur seront affichés avec 0 chercheurs.
*/

SELECT R.NP, P.NOM, P.BUDJET, COUNT(R.NC) AS 'NB CHERCHEURS'
FROM (
	SELECT A.NP, A.NC
	FROM AFF AS A INNER JOIN PROJET AS P
	ON A.NP = P.NP) AS R
RIGHT OUTER JOIN PROJET P 
ON R.NP = P.NP
GROUP BY R.NP, P.NOM, P.BUDJET;
/*
8. Lister les noms des projets auxquels sont affectés au moins 2 chercheurs.
*/
 SELECT P.NOM, COUNT(A.NC)
FROM PROJET P natural JOIN AFF A
GROUP BY A.NP
HAVING COUNT(A.NC) > 2;
/*
9. Lister les noms et prénoms des chercheurs qui ont participé à plus de 4 projets.
*/
SELECT C.NOM, C.PRENOM, COUNT(C.NC) AS 'NB PARTICIPATION'
FROM CHERCHEUR AS C NATURAL JOIN AFF AS A
GROUP BY (C.NC)
HAVING COUNT(C.NC) > 4;
/*
10. Lister les noms et prénoms des chercheurs qui ont participé à plus de 2 projets durant une année et dont
le budget est supérieur à 30k euros
*/

SELECT A.NC, C.NOM, COUNT(A.NP)
FROM AFF AS A NATURAL JOIN CHERCHEUR C JOIN PROJET P
ON P.NP = A.NP
WHERE P.BUDJET > 30000
GROUP BY A.ANNEE, A.NC
HAVING COUNT(A.NP) > 2;

/*
11. Lister les chercheurs qui ont participé à un projet dont « M. VIEIRA » a participé en 2018.
*/
SELECT NC, NOM
FROM (SELECT NP
	FROM CHERCHEUR NATURAL JOIN AFF
	WHERE NOM = "VIEIRA" AND ANNEE = 2018) AS PVIEIRA NATURAL JOIN AFF NATURAL JOIN CHERCHEUR
GROUP BY NC;
/*
12. Lister les chercheurs qui ont participé à tous les projets de leur équipe.
*/
SELECT R1.NOM
FROM (SELECT NC, C.NOM, COUNT(DISTINCT A.NP) AS NB_PROJ_PART, C.NE
	FROM AFF AS A NATURAL JOIN CHERCHEUR AS C
	GROUP BY NC) AS R1
INNER JOIN
	(SELECT P.NE, COUNT(P.NP) AS NB_PROJ_EQ
	FROM PROJET AS P
	GROUP BY P.NE) AS R2
ON R1.NE = R2.NE
WHERE NB_PROJ_PART >= NB_PROJ_EQ;

/*
13. Lister les noms et prénoms des chercheurs qui ont participé au plus grand nombre de projets.
*/

SELECT C.NOM, C.PRENOM, COUNT(DISTINCT A.NP) AS NB_PROJ_PART
FROM AFF AS A NATURAL JOIN CHERCHEUR AS C
GROUP BY NC
HAVING NB_PROJ_PART > 1;

/*
14. Lister les projets dont le budget est supérieur à tous les budgets de l’année 2018. 
*/

SELECT P.NOM, P.BUDJET
FROM PROJET P
WHERE P.BUDJET > ALL(SELECT BUDJET FROM PROJET P NATURAL JOIN AFF A  WHERE A.ANNEE = 2018);


/*
15. Lister les projets dont le budget est supérieur à un budget quelconque de l’année 2018. 
*/

SELECT P.NOM, P.BUDJET
FROM PROJET P
WHERE P.BUDJET > ANY(SELECT BUDJET FROM PROJET P NATURAL JOIN AFF A  WHERE A.ANNEE = 2018);

/*
16. Lister les équipes qui ont au moins un projet auquel a participé plus de 2 chercheurs. 
*/
SELECT DISTINCT E.NOM
FROM AFF A NATURAL JOIN PROJET P
INNER JOIN EQUIPE AS E
ON E.NE = P.NE
GROUP BY E.NE, NP
HAVING COUNT(DISTINCT NC) > 2;
/*
17. Lister les équipes dont tous les projets ont plus de 2 participants. 
*/
SELECT E.NOM
FROM AFF AS A NATURAL JOIN PROJET AS P
INNER JOIN EQUIPE AS E
ON E.NE = P.NE
GROUP BY E.NE
HAVING COUNT(DISTINCT NC) < 2;

/*
18. Lister le total des budgets de tous les projets.
*/
select SUM(BUDJET) from PROJET ;
/*
19. Lister le total des budgets des projets dont le budget est supérieur à 30K.
*/
select SUM(BUDJET) from PROJET where BUDJET > 30000 ;
/*
20. Lister par année le nombre de projets dont le budget est supérieur à 30K.
*/
select ANNEE, COUNT(ANNEE) AS 'NB PROJET' from PROJET NATURAL JOIN AFF  where BUDJET > 30000 group by ANNEE;

/*
21. Lister les noms et prénoms des chercheurs qui ont participés dans les projets de 2 équipes différentes.
*/
SELECT DISTINCT C.NOM, C.PRENOM
FROM AFF AS A NATURAL JOIN PROJET AS P
INNER JOIN CHERCHEUR AS C
ON C.NC = A.NC
WHERE P.NE <> C.NE;

/*
22. Lister les noms et prénoms des chercheurs qui ne participent que dans le projet « Pacific-Clouds avec CAPES – Bresil ».
*/
SELECT DISTINCT R1.NOM, R1.PRENOM 
FROM
(SELECT C.NOM, C.PRENOM, C.NC, P.NP
FROM CHERCHEUR AS C INNER JOIN PROJET AS P
ON P.NE = C.NE
WHERE P.NOM = "Pacific-Clouds avec CAPES - Bresil"
) AS R1
JOIN AFF as A
ON A.NC = R1.NC
WHERE R1.NP = A.NP;

/*
23. Lister les projets auxquels sont affectés les chercheurs « BOUGUEROUA » et « WOLSKA »
*/
SELECT DISTINCT BOU.NP AS 'NUM PROJET'
FROM CHERCHEUR AS C NATURAL JOIN AFF AS A JOIN
	(SELECT NP
	FROM CHERCHEUR AS C NATURAL JOIN AFF AS A
	WHERE NOM = "BOUGUEROUA") AS BOU
ON BOU.NP = A.NP
WHERE NOM = "WOLSKA";

/*
24. Lister les projets auxquels ne sont affectés ni « BOUGUEROUA », ni « WOLSKA »
*/
SELECT DISTINCT A.NP AS 'NUM PROJET'
FROM (
	SELECT DISTINCT BOU.NP
	FROM CHERCHEUR AS C NATURAL JOIN AFF AS A JOIN
		(SELECT NP
		FROM CHERCHEUR AS C NATURAL JOIN AFF AS A
		WHERE NOM = "BOUGUEROUA") AS BOU
	ON BOU.NP = A.NP
	WHERE NOM = "WOLSKA") AS R
RIGHT JOIN AFF AS A
ON R.NP = A.NP
WHERE R.NP IS NULL;

/*
25. Lister les noms des équipes triées selon le nombre de chercheurs lui appartenant, par ordre croissant, et
par la moyenne de leurs budgets par ordre décroissant.
*/
SELECT R.NE, R.NOME, R.NB_CHERCHEUR, AVG(P.BUDJET) AS MOYENNE_BUDJETS
FROM (SELECT DISTINCT E.NOM AS NOME, E.NE, COUNT(C.NE) AS NB_CHERCHEUR
	FROM EQUIPE AS E INNER JOIN CHERCHEUR C
	ON E.NE = C.NE
	GROUP BY E.NE
	ORDER BY NB_CHERCHEUR ASC) AS R
NATURAL JOIN  PROJET AS P
GROUP BY R.NE
ORDER BY MOYENNE_BUDJETS DESC;

/*
26. Lister les noms de duo de chercheurs qui participent le plus sur des projets communs ensemble.
*/
SELECT DISTINCT R1.NOM, R2.NOM
FROM 
	(SELECT NP, A1.NC, C1.NOM, ANNEE
	FROM AFF AS A1 INNER JOIN CHERCHEUR C1
		ON A1.NC = C1.NC) AS R1
LEFT JOIN 
	(SELECT NP, A2.NC, C2.NOM, ANNEE
	FROM AFF AS A2 INNER JOIN CHERCHEUR C2
		ON A2.NC = C2.NC) AS R2
ON R1.NP = R2.NP
WHERE R1.NC <>R2.NC AND R1.ANNEE = R2.ANNEE
GROUP BY R2.NOM, R1.NOM
HAVING COUNT(R1.NP) > 1;

/*
27. Lister les noms de projets dont le budget est de plus de 30K et auxquels sont affectés au moins un
chercheur par équipe.
*/
SELECT DISTINCT P.NOM AS 'NOM DU PROJET'
FROM AFF A1 NATURAL JOIN CHERCHEUR C
INNER JOIN AFF A2
ON A1.NP = A2.NP
INNER JOIN PROJET P
ON P.NP = A1.NP
WHERE A1.NC <> A2.NC AND IFNULL(P.BUDJET, 0) > 30000; 

/*
28. Lister tous les chercheurs ayant participé à des projets entre 2010 et 2018 ainsi les noms des projets et
leurs budgets.
*/
SELECT C.NOM AS 'NOM DU CHERCHEUR', P.NOM AS "NOM DU PROJET", A.ANNEE, P.BUDJET 
FROM PROJET AS P NATURAL JOIN AFF A
INNER JOIN CHERCHEUR C
ON C.NC = A.NC
WHERE A.ANNEE BETWEEN 2010 AND 2018;

/*
29. Utiliser la requête précédente pour lister les noms et prénoms des chercheurs ayant participé à des
projets entre 2010 et 2018 ainsi que le nombre de ces projets et le total de leurs budgets.
*/

SELECT C.NOM, C.PRENOM, COUNT(P.NP), SUM(P.BUDJET)
FROM PROJET AS P NATURAL JOIN AFF A
INNER JOIN CHERCHEUR C
ON C.NC = A.NC
WHERE A.ANNEE BETWEEN 2010 AND 2018
GROUP BY C.NC, C.NOM;

/*
30. Donner les noms et prénoms des chercheurs qui ont participé à tous ls projets de l’année 2018.
*/

SELECT DISTINCT C.NOM, C.PRENOM
FROM PROJET AS P NATURAL JOIN AFF A
INNER JOIN CHERCHEUR C
ON C.NC = A.NC
WHERE A.ANNEE = 2018;
