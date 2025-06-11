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
--3.  What is the highest grossing G-rated movie? Which company distributed it?

--SELECT  specs.film_title
	,	revenue.worldwide_gross
	,	distributors.company_name
	
--FROM specs
--INNER JOIN revenue
--ON specs.movie_id = revenue.movie_id
--INNER JOIN distributors
--ON specs.domestic_distributor_id = distributors.distributor_id
--WHERE mpaa_rating = 'G'
--GROUP BY specs.movie_id, specs.film_title, specs.mpaa_rating, revenue.worldwide_gross, distributors.distributor_id, distributors.company_name
--ORDER BY MAX(worldwide_gross) DESC;

--Toy Story 4, Walt Disney

--4.  Write a query that returns, for each distributor in the distributors table, the distributor name and the number of movies associated with that distributor in the movies table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.

--SELECT distributors.company_name
--	,	COUNT (film_title) 
--FROM distributors
--FULL JOIN specs
--ON distributors.distributor_id = specs.domestic_distributor_id
--GROUP BY distributors.company_name;

--5.  Write a query that returns the five distributors with the highest average movie budget.

SELECT distributors.company_name
	,	AVG (revenue.film_budget) AS avg_film_budget
FROM distributors
LEFT JOIN specs
ON distributors.distributor_id = specs.domestic_distributor_id
LEFT JOIN revenue
ON specs.movie_id = revenue.movie_id
WHERE film_budget IS NOT NULL
GROUP BY distributors.company_name, film_budget
ORDER BY avg_film_budget DESC
LIMIT 5;

--6.  How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?

SELECT distributors.company_name
	,	distributors.headquarters
	,	distributors.distributor_id
	,	distributors.headquarters
	,	specs.movie_id
	,	specs.film_title
	,	rating.movie_id
	,	MAX(rating.imdb_rating)
FROM distributors
FULL JOIN specs
ON distributors.distributor_id = specs.movie_id
FULL JOIN rating
ON distributors.distributor_id = rating.movie_id
WHERE distributors.headquarters NOT LIKE '%CA'
ORDER BY MAX(rating.imdb_rating) DESC;

__7. Which have a higher average rating, movies which are over two hours long or movies which are under two hours? 






