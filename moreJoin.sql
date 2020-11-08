#1. List the films where the yr is 1962 [Show id, title]
SELECT id, title
FROM movie
	WHERE yr=1962;

#2. Give year of 'Citizen Kane'.
SELECT yr
FROM movie
	WHERE title = 'Citizen Kane';

#3. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
SELECT id, title, yr
FROM movie
	WHERE title LIKE '%star trek%'
	ORDER BY yr;

#4. What id number does the actor 'Glenn Close' have?
SELECT id
FROM actor
	WHERE name = 'Glenn Close';

#5. What is the id of the film 'Casablanca'
SELECT id
FROM movie
	WHERE title = 'Casablanca';

#6. Obtain the cast list for 'Casablanca'.
SELECT name
FROM actor, casting
	WHERE id=actorid 
	AND movieid = (SELECT id FROM movie WHERE title = 'Casablanca');

#7. Obtain the cast list for the film 'Alien'
SELECT name
FROM actor
JOIN casting 
ON (id=actorid 
		AND movieid = (SELECT id FROM movie WHERE title = 'Alien'));

#8. List the films in which 'Harrison Ford' has appeared.
SELECT title
FROM movie
JOIN casting 
ON (id=movieid 
		AND actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford'));

#9. List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]		
SELECT title
FROM movie
JOIN casting 
ON (id=movieid 
		AND actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford') AND ord != 1);

#10. List the films together with the leading star for all 1962 films.
SELECT title, name
FROM movie 
JOIN casting 
ON (id=movieid)
JOIN actor 
ON (actor.id = actorid)
	WHERE ord=1 AND  yr = 1962;

#11. Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
SELECT yr, 
	   COUNT(title) as number_of_movies 
FROM movie 
JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
	WHERE name='Rock Hudson'
	GROUP BY yr
	HAVING COUNT(title) > 1
		ORDER BY COUNT(title) DESC
		LIMIT 2;

#12. List the film title and the leading actor for all of the films 'Julie Andrews' played in.
SELECT title, name 
FROM movie  
JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
	WHERE ord = 1 AND movieid IN ( SELECT movieid FROM casting 
								   JOIN actor
                                   ON actorid = actor.id
                                   WHERE name = 'Julie Andrews');

#13. Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
SELECT name
FROM actor 
JOIN casting
ON id = actorid AND ord = 1
	GROUP BY name
	HAVING COUNT(name) >= 15;	

#14. List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT title, 
	   COUNT(actorid) AS cast 
FROM movie
JOIN casting 
ON movieid=id
	WHERE yr = 1978
	GROUP BY title
	ORDER BY cast DESC, title;

#15. List all the people who have worked with 'Art Garfunkel'.
SELECT name 
FROM actor 
JOIN casting
ON actor.id=actorid
	WHERE movieid IN (SELECT movieid FROM casting
					  JOIN actor
					  ON actorid=actor.id
						WHERE name='Art Garfunkel')
				  AND name <>'Art Garfunkel';	

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

#Quiz

#1. Select the statement which lists the unfortunate directors of the movies which have caused financial loses (gross < budget)
SELECT name
FROM actor 
INNER JOIN movie 
ON actor.id = director
	WHERE gross < budget;

#2. Select the correct example of JOINing three tables
SELECT *
FROM actor 
JOIN casting ON actor.id = actorid
JOIN movie ON movie.id = movieid;

#3. Select the statement that shows the list of actors called 'John' by order of number of movies in which they acted
SELECT name, 
	   COUNT(movieid)
FROM casting 
JOIN actor 
ON actorid=actor.id
	WHERE name LIKE 'John %'
	GROUP BY name 
	ORDER BY 2 DESC;

#4. Select the result that would be obtained from the following code:
SELECT title 
FROM movie 
JOIN casting ON (movieid=movie.id)
JOIN actor   ON (actorid=actor.id)
WHERE name='Paul Hogan' AND ord = 1;

#Ans. Table-B

#5. Select the statement that lists all the actors that starred in movies directed by Ridley Scott who has id 351
SELECT name
FROM movie 
JOIN casting ON movie.id = movieid
JOIN actor ON actor.id = actorid
	WHERE ord = 1 AND director = 351;

#6. There are two sensible ways to connect movie and actor. They are:
#Ans. 
/* link the director column in movies with the primary key in actor
connect the primary keys of movie and actor via the casting table */

#7. Select the result that would be obtained from the following code:
SELECT title, yr 
FROM movie, casting, actor 
WHERE name='Robert De Niro' AND movieid=movie.id AND actorid=actor.id AND ord = 3;
#Ans. Table-B
