SELECT *
FROM world_life_expectancy;


SELECT *
FROM 
(SELECT Row_ID,
CONCAT(Country, Year),
ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year)) row_num
FROM world_life_expectancy) AS sub
WHERE row_num > 1;


DELETE FROM world_life_expectancy
WHERE Row_ID IN (
	SELECT Row_ID
	FROM 
		(SELECT Row_ID,
		CONCAT(Country, Year),
		ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year)) row_num
		FROM world_life_expectancy) AS sub
	WHERE row_num > 1);

