use cinema;
/*
1. Les titres de films triés.
*/

select Titre from Film order by Titre asc;
/*
2. Nom et année de naissance des artistes nés avant 1950.
*/
select Nom, Annee_naissance from Artiste where Annee_naissance > 1950;
/*
3. Les cinémas du 12ème arrondissement.
*/
select * from Cinema where Arrondissement = 12;
/*
4. Les artistes dont le nom commence par 'H' (commande LIKE).
*/
select * from Artiste where Nom like 'H%';
/*
5. Quels sont les acteurs dont on ignore la date de naissance ? (Attention : cela signifie que la
valeur n'existe pas).
*/
select Role.nom_acteur,Artiste.Annee_naissance from Role join Artiste where Artiste.Annee_naissance IS NULL and Role.Nom_acteur = Artiste.Nom;
/*
6. Combien de fois Bruce Willis a-t-il joué le rôle de McLane ?
*/
select count(*) as "Nombre de fois" from Role where Nom_Role = 'McLane' and Nom_acteur = 'Willis';

/*
1. Qui a joué Tarzan (nom et prénom) ?
*/


select Artiste.Nom, Artiste.Prenom from Role join Artiste where Role.Nom_Role = 'Tarzan' and Artiste.Nom = Role.Nom_acteur;
/*
2. Nom des acteurs de Vertigo.
*/
select Film.ID_film, Role.Nom_acteur from Film join Role where Titre="Vertigo" and Film.ID_film = Role.ID_film;
/*
3. Quels films peut-on voir au Rex, et à quelle heure ?
*/
select Seance.Heure_debut, Film.Titre from Film join Seance where Seance.Nom_cinema = 'Rex' and Seance.ID_film = Film.ID_film;
/*
4. Titre des films dans lesquels a joué Woody Allen. Donner aussi le rôle.
*/
select Film.Titre, Role.Nom_Role from Film join Role where Role.Nom_acteur ="Allen" and Film.ID_film = Role.Id_film;
/*
5. Quel metteur en scène a tourné dans ses propres films ? Donner le nom, le rôle et le titre des
films.
*/
select Role.Nom_acteur, Role.Nom_Role, Film.Titre from Role join Film where Film.Nom_Realisateur = Role.Nom_acteur and Film.ID_film = Role.ID_film; 
/*
6. Quel metteur en scène a tourné en tant qu'acteur ? Donner le nom, le rôle et le titre des films
où le metteur en scène a joué.
*/
select Role.Nom_acteur, Role.Nom_Role, Film.Titre from Role join Film where Role.Nom_acteur = Film.Nom_Realisateur;
/*
7. Où peut-on voir Shining ? (Nom et adresse du cinéma, horaire).
*/
select Seance.Heure_debut, Cinema.Nom_cinema, Cinema.Adresse, Film.Titre from Cinema join Seance join Film where Film.Titre = 'Shining' and Cinema.Nom_cinema = Seance.Nom_cinema;

/*
select Artiste.Nom as real_nom, Artiste.Prenom as real_prenom, Film.ID_film from Artiste join Film where Film.Nom_Realisateur = Artiste.Nom;
select Artiste.Nom as act_nom, Artiste.Prenom as act_prenom, Film.ID_film from Artiste join Film join Role where Film.ID_film = Role.ID_film;
*/
/*
8. Dans quels films le metteur-en-scène a-t-il le même prénom que l'un des interprètes ? (titre,
nom du metteur-en-scène, nom de l'interprète). Le metteur-en-scène et l'interprète ne doivent
pas être la même personne.
*/
select * from
(select Artiste.Nom as real_nom, Artiste.Prenom as real_prenom, Film.ID_film as real_film from Artiste join Film where Film.Nom_Realisateur = Artiste.Nom) as realisateur
join
(select Artiste.Nom as act_nom, Artiste.Prenom as act_prenom, Film.ID_film as act_film from Artiste join Film join Role where Film.ID_film = Role.ID_film) as acteur
where realisateur.real_film = acteur.act_film and realisateur.real_prenom = acteur.act_prenom and realisateur.real_nom != acteur.act_nom;
/*
9. Où peut-on voir un film avec Clint Eastwood ? (Nom et adresse du cinéma, horaire).
*/
select Cinema.Nom_cinema, Cinema.Adresse, Seance.Heure_debut
from Cinema join Seance join Film join Artiste join Role
where Film.ID_film = Role.ID_film and Role.Nom_acteur = Artiste.Nom and Artiste.prenom = "Clint" and Seance.ID_film = Film.ID_film and Seance.Nom_cinema = Cinema.Nom_cinema;

/*
10. Quel film peut-on voir dans le 12e arrondissement, dans une salle climatisée ? (Nom du
cinéma, No de la salle, horaire, titre du film).
*/
select Cinema.Nom_cinema, Salle.No_salle, Seance.Heure_debut, Film.Titre
from Cinema join Salle join Seance join Film
where Cinema.arrondissement = 12 and Salle.Climatise="O";
/*
11. Liste des cinémas (Adresse, Arrondissement) ayant une salle de plus de 150 places et
passant un film avec Bruce Willis.
*/
select Cinema.Adresse, Cinema.Arrondissement, Film.Titre
from Cinema join Salle join Film join Artiste join Role
where Salle.Capacite > 150 and Cinema.Nom_cinema = Salle.Nom_cinema and Film.ID_film = Role.ID_film and Role.Nom_acteur=Artiste.Nom and Artiste.Prenom = "Bruce" and Artiste.Nom = "Willis"; 
/*
12. Liste des cinémas (Nom, Adresse) dont TOUTES les salles ont plus de 100 places.
*/
select Cinema.Nom_cinema, Cinema.Adresse , Cinema.Arrondissement, Salle.Capacite
from Cinema join Salle
where Salle.Capacite >100;

/*
Exercice 3 (Négation)
1. Quels acteurs n'ont jamais mis en scène de film ?
*/

select a.Nom, a.Prenom
from Artiste as a left outer join Film as f
on a.Nom = f.Nom_Realisateur
where f.Nom_Realisateur is null;

/*
2. Les cinémas (nom, adresse) qui ne passent pas un film de Tarantino.
left outer join Cinema as c on c.Nom_cinema = s.Nom_cinema
*/
select c.Nom_cinema, c.Adresse
from 
	(select s.Nom_cinema
	from (Film as f natural join Seance as s)
	where f.Nom_Realisateur = 'Tarantino') as r 
 right outer join Cinema as c on r.Nom_cinema = c.Nom_cinema
 where r.Nom_cinema is null;
/*
Exercice 4 (Fonctions de groupe)
1. Total des places dans les salles du Rex.
*/
select sum(s.capacite) as 'Total des places'
from Salle as s
where s.Nom_cinema = 'Rex';
/*
2. Année du film le plus ancien et du film le plus récent.
*/
select min(f.Annee) as 'Le plus ancien', max(f.Annee) as 'Le plus récent'
from Film as f;

/*
3. Total des places offertes par cinéma.
*/

/*
4. Nom et prénom des réalisateurs, et nombre de films qu'ils ont tournés.
*/
select F.Nom_Realisateur, A.Prenom,  count(F.ID_film) as 'Nombre'
from Film F inner join Artiste A
on F.Nom_Realisateur = A.Nom
group by (F.ID_film);
/*
5. Nom des cinémas ayant plus de 1 salle climatisée.
*/
select c.Nom_cinema, count(s.Climatise) as 'Nb salles climatiées'
from Cinema as c natural join Salle as s
where s.Climatise = "O"
group by c.Nom_cinema
having count(s.Climatise)>1;


/*
6. Les artistes (nom, prénom) ayant joué au moins dans trois films depuis 1985, dont au moins
un passe a l'affiche à Paris (donner aussi le nombre de films).
select 
F.Nom_realisateur, A.Prenom
from Film F join Artiste A 
on Film.Nom_realisateur = Artiste.Nom
where F.Annee > 1985
group by (F.Nom_realisateur)
;
*/


 

/*
Exercice 5 (Division)
1. Le nom des cinémas qui passent tous les films de Kubrick
*/
select c.Nom_cinema, c.Adresse, f.Nom_Realisateur
from Cinema as c join Seance as s join Film as f
where c.Nom_cinema = s.Nom_cinema and f.ID_film = s.ID_film and f.Nom_Realisateur = 'Kubrick';
