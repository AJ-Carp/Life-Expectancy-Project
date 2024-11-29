SELECT *
FROM world_life_expectancy;

SELECT *
FROM world_life_expectancy
WHERE Status = '';


SELECT DISTINCT Status
FROM world_life_expectancy
WHERE Status != '';

UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
ON t1.Country = t2.Country
SET t1.Status = 'Developing'
WHERE t1.Status = ''
AND t2.Status = 'Developing';

UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
ON t1.Country = t2.Country
SET t1.Status = 'Developed'
WHERE t1.Status = ''
AND t2.Status = 'Developed';

#------------------------------------------------------------------

SELECT *
FROM world_life_expectancy;


SELECT *
FROM world_life_expectancy
WHERE Lifeexpectancy = '';

-- finds years above and below the years with blank life expectancy
SELECT *
FROM world_life_expectancy
WHERE (Year+1 IN
(SELECT year
FROM world_life_expectancy
WHERE Lifeexpectancy = '')
OR Year-1 IN
(SELECT year
FROM world_life_expectancy
WHERE Lifeexpectancy = ''))
AND Country IN (SELECT Country
FROM world_life_expectancy
WHERE Lifeexpectancy = '');

-- finds average life expectancy from year above and below

SELECT Lifeexpectancy, ave_life_expect
FROM world_life_expectancy t1
JOIN (
SELECT Country, ROUND(AVG(Lifeexpectancy), 1) AS ave_life_expect
FROM(
	SELECT *
	FROM world_life_expectancy
	WHERE (Year+1 IN
			(SELECT year
			FROM world_life_expectancy
			WHERE Lifeexpectancy = '')
		OR Year-1 IN
			(SELECT year
			FROM world_life_expectancy
			WHERE Lifeexpectancy = ''))
		AND Country IN (SELECT Country
			FROM world_life_expectancy
			WHERE Lifeexpectancy = '')) AS sub
GROUP BY Country) AS t2 ON t1.Country = t2.Country;

-- updating to fill blanks

UPDATE world_life_expectancy t1
JOIN (
SELECT Country, ROUND(AVG(Lifeexpectancy), 1) AS ave_life_expect
FROM(
	SELECT *
	FROM world_life_expectancy
	WHERE (Year+1 IN
			(SELECT year
			FROM world_life_expectancy
			WHERE Lifeexpectancy = '')
		OR Year-1 IN
			(SELECT year
			FROM world_life_expectancy
			WHERE Lifeexpectancy = ''))
		AND Country IN (SELECT Country
			FROM world_life_expectancy
			WHERE Lifeexpectancy = '')) AS sub
GROUP BY Country) AS t2 ON t1.Country = t2.Country
SET t1.Lifeexpectancy = t2.ave_life_expect
WHERE t1.Lifeexpectancy = '';



 








