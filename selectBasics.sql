#1. Modify it to show the population of Germany

SELECT population FROM world
 	WHERE name = 'Germany';


#2. Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.

SELECT name, population FROM world
	WHERE name IN ('Sweden', 'Norway', 'Denmark');
 

#3. Modify it to show the country and the area for countries with an area between 200,000 and 250,000.	

SELECT name, area FROM world
	WHERE area BETWEEN 200000 AND 250000;

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

#SELECT basics quiz :
#1. 
SELECT name, population
	FROM world
		WHERE population BETWEEN 1000000 AND 1250000;

#2.
SELECT name, population
	FROM world
    	WHERE name LIKE "Al%";
    	#Ans: Table-E

#3.
SELECT name FROM world
	WHERE name LIKE '%a' OR name LIKE '%l';

#4.
#Ans: C

#5.
#Ans: C

#6.
SELECT name, area, population
	FROM world
		WHERE area > 50000 AND population < 10000000;

#7.
SELECT name, population/area
	FROM world
		WHERE name IN ('China', 'Nigeria', 'France', 'Australia');



