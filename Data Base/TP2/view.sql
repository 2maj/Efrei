use tp2;

CREATE OR REPLACE VIEW tp2.projet_budget as
SELECT P.NOM as nomp, P.BUDJET, C.NOM as nomc
FROM PROJET P JOIN CHERCHEUR C
ON P.NE = C.NE;

select * from projet_budget;