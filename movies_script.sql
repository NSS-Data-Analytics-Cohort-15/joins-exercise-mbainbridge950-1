--1. Give the name, release year, and worldwide gross of the lowest grossing movie.

--SELECT specs.movie_id
--	,	specs.film_title
--	,	specs.release_year
--	,	revenue.worldwide_gross
--	,	revenue.movie_id
--FROM specs
--LEFT JOIN revenue
--ON specs.movie_id = revenue.movie_id
--ORDER BY worldwide_gross;

--Semi-Tough, 1977, 37187139
--2.  What year has the highest average imdb rating?

--SELECT release_year, AVG(imdb_rating)
--		specs.movie_id
--	,	specs.film_title
--	,	specs.release_year
--	,	rating.movie_id
--	,	rating.imdb_rating
--	,	revenue.worldwide_gross
--	,	revenue.movie_id
--FROM specs
--LEFT JOIN rating
--ON specs.movie_id = rating.movie_id
--GROUP BY release_year
--ORDER BY AVG(imdb_rating) DESC;

--1991
