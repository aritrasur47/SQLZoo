#1. Find the country that start with Y
SELECT name 
FROM world
WHERE name LIKE 'Y%';

#2. Find the countries that end with y
SELECT name 
FROM world
WHERE name LIKE '%y';

#3. Find the countries that contain the letter x
SELECT name 
FROM world
WHERE name LIKE '%x%';

#4. Find the countries that end with land
SELECT name 
FROM world
WHERE name LIKE '%land';

#5. Find the countries that start with C and end with ia
SELECT name 
FROM world
WHERE name LIKE 'C%' AND name like '%ia';

#6. Find the country that has oo in the name
SELECT name 
FROM world
WHERE name LIKE '%oo%';

#7. Find the countries that have three or more a in the name
SELECT name 
FROM world
WHERE name LIKE '%a%a%a%';

#8. Find the countries that have "t" as the second character.
SELECT name 
FROM world
WHERE name LIKE '_t%'
ORDER BY name;

#9. Find the countries that have two "o" characters separated by two others.
SELECT name FROM world
 WHERE name LIKE '%o__o%';

#10. Find the countries that have exactly four characters.
SELECT name FROM world
 WHERE name LIKE '____';

#11. Find the country where the name is the capital city.
SELECT name
FROM world
WHERE name LIKE capital;

#12. Find the country where the capital is the country plus "City".
SELECT name 
FROM world
WHERE capital LIKE concat(name, ' City');

#13. Find the capital and the name where the capital includes the name of the country.
SELECT capital, name
FROM world
WHERE capital LIKE concat ('%' , name, '%');

#14. Find the capital and the name where the capital is an extension of name of the country.
SELECT capital, name
FROM world
WHERE capital LIKE concat(name, '%') AND capital <> name;

#15. Show the name and the extension where the capital is an extension of name of the country.
SELECT name, REPLACE(capital, name, '') AS nameextension
FROM world
WHERE capital LIKE concat(name, '%') AND capital <> name;

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

#BBC QUIZ

#1. Select the code which gives the name of countries beginning with U
SELECT name
FROM world
WHERE name LIKE 'U%'

#2. Select the code which shows just the population of United Kingdom?
SELECT population
FROM world
WHERE name = 'United Kingdom'

#3. Select the answer which shows the problem with this SQL code - the intended result should be the continent of France:
SELECT continent 
FROM world 
WHERE 'name' = 'France'
#Ans : 'name' should be name

#4. Select the result that would be obtained from the following code:
SELECT name, population / 10 
FROM world 
WHERE population < 10000
#Ans : Nauru = 990

#5. Select the code which would reveal the name and population of countries in Europe and Asia
SELECT name, population
FROM world
WHERE continent IN ('Europe', 'Asia')

#6. Select the code which would give two rows
SELECT name FROM world
WHERE name IN ('Cuba', 'Togo')

#7. Select the result that would be obtained from this code:
SELECT name FROM world
WHERE continent = 'South America'
AND population > 40000000
#Ans. Brazil
#     Colombia
