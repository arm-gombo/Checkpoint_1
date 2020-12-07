select * from rating order by IMDb asc limit 5;

select Directors, Edad from directors order by Edad desc limit 5;

select count(Netflix) as Peliculas from platforms where Netflix = 1
Union
select count(Hulu) from platforms where Hulu = 1
union
select count(PrimeVideo) from platforms where PrimeVideo = 1;

select * from movies;
select count(Genres) as PeliculasDeAccion from movies where Genres Like '%Action%';

select RottenTomatoes from rating 
order by RottenTomatoes desc limit 10;

select IMDb from rating 
order by IMDb desc limit 10;

select IMDb, RottenTomatoes from rating 
order by RottenTomatoes desc, IMDb desc limit 10;


select RottenTomatoes from rating group by RottenTomatoes order by RottenTomatoes, IMDb desc;

Select IMDb, RottenTomatoes from rating group by IMDb, RottenTomatoes order by IMDb, RottenTomatoes desc;

select * from directors;
select * from movies;
select * from rating;


select directors.Directors Nombre, movies.Title Título, movies.Year Año 
from movies
join directors on
movies.ID_Director = directors.id_Director
order by año desc;

#8.- ¿En qué plataforma se encuentran las 10 películas con mayor puntuación en IMDb?

select rating.IMDb RatingIMDb, platforms.Netflix Netflix, platforms.Hulu Hulu, platforms.PrimeVideo Prime 
from rating
join platforms on rating.Id_movCritics = platforms.ID_MOV
order by IMDb desc limit 10;

select rating.RottenTomatoes RatingRotten, platforms.Netflix Netflix, platforms.Hulu Hulu, platforms.PrimeVideo Prime 
from rating
join platforms on rating.Id_movCritics = platforms.ID_MOV
order by RottenTomatoes desc limit 10;

select movies.Year, platforms.Hulu Hulu, platforms.Netflix Netflix, platforms.PrimeVideo Prime
from movies
join platforms
on movies.ID = platforms.ID_MOV
order by movies.Year DESC limit 10;


#11.- ¿Qué plataforma tiene más películas del director con mayor puntuación en sus películas?
# VIEW Tabla con Director, Película y Puntuación
# JOIN con tabla de Plataformas

create view DirectorRatingIMDB as
select directors.Directors Nombre, movies.Title Titulo, rating.IMDb IMDb
from directors 
join movies on directors.id_Director = movies.ID_Director
join rating on rating.Id_movCritics = movies.ID;

create view DirectorRatingRotten as
select directors.Directors Nombre, movies.Title Titulo, rating.RottenTomatoes Rotten
from directors 
join movies on directors.id_Director = movies.ID_Director
join rating on rating.Id_movCritics = movies.ID;

select * from directorratingimdb order by IMDb DESC;
select * from rating;

select ((IMDb + RottenTomatoes*10)/2) Rating_Promedio from rating;

create view PromRating as
select movies.ID ID_Movie,
	   movies.Title Titulo,
	   directors.Directors Nombre, 
	   ((IMDb + RottenTomatoes*10)/2) Rating_Promedio
from directors 
join movies on directors.id_Director = movies.ID_Director
join rating on rating.Id_movCritics = movies.ID;

select  Nombre, avg(Rating_Promedio) Promedio
from promrating
group by Nombre order by Promedio desc;

select Nombre, Rating_Promedio from promrating order by Rating_Promedio DESC;

select * from promrating;


select Nombre, Rating_Promedio from promrating order by Rating_Promedio DESC;
select * from directors where Directors like 'Miguel Gau%';
select * from movies where ID_Director = 5267;
select * from platforms where ID_MOV = 7221;

select sum(Netflix), sum(Hulu), sum(PrimeVideo) from platforms;

create view Best20 as
select promrating.Rating_Promedio Rating, promrating.Titulo Titulo, 
	   platforms.Netflix Netflix,
       platforms.Hulu Hulu,
       platforms.PrimeVideo Prime
from promrating
join platforms on promrating.ID_Movie = platforms.ID_MOV
order by Rating desc limit 20;

select sum(Netflix) Netflix, sum(Prime) Prime, sum(Hulu) Hulu from best20;

create view Shorts as
select movies.ID, movies.Title, movies.Genres, platforms.Netflix, platforms.Hulu, platforms.PrimeVideo  
from movies
Join platforms on movies.ID = platforms.ID_MOV
where Genres like '%Short%';

select shorts.sum(Netflix) Netflix, 
	   shorts.sum(Hulu) Hulu, 
       shorts.sum(PrimeVideo) Prime, 
       movies.Title Titulo
from shorts
Join movies on shorst.ID = movies.ID
where Genres like '%Short%';


create view shorts as
select movies.ID ID, movies.Title Titulo, platforms.Netflix, platforms.Hulu, platforms.PrimeVideo
from movies
right join platforms on movies.ID = platforms.ID_MOV
where Genres like '%Short%';

select sum(Netflix) ShortsOnNetflix,
		sum(PrimeVideo) ShortsOnPrime, 
        sum(Hulu) ShortsOnHulu
from shorts;

create view Runtime as
select movies.Runtime, movies.Title, platforms.Hulu Hulu, platforms.Netflix, platforms.PrimeVideo
from movies
join platforms on movies.ID = platforms.ID_MOV;






select sum(Hulu) Hulu, sum(Netflix) Netflix, sum(PrimeVideo) Prime from runtime;












