-- countries with highest and lowest avg life expectancy in 2022 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SELECT Country, Lifeexpectancy
FROM world_life_expectancy
WHERE Year = 2022 AND Lifeexpectancy <> 0
ORDER BY Lifeexpectancy DESC
LIMIT 5;

SELECT Country, Lifeexpectancy
FROM world_life_expectancy
WHERE Year = 2022 AND Lifeexpectancy <> 0
ORDER BY Lifeexpectancy
LIMIT 5;
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



-- countries with most or least improvement in life span from 2007 to 2022 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SELECT w.Country, ROUND((w.Lifeexpectancy - w1.Lifeexpectancy),1) life_change
FROM world_life_expectancy w
JOIN world_life_expectancy w1
ON w.Row_ID = w1.Row_ID - 15
WHERE w.Year = 2022 
ORDER BY life_change DESC
LIMIT 5;

SELECT Country, Year, Lifeexpectancy
FROM world_life_expectancy
WHERE Country IN ('Zimbabwe', 'Eritrea', 'Zambia', 'Botswana', 'Rwanda'); 

SELECT w.Country, ROUND((w.Lifeexpectancy - w1.Lifeexpectancy),1) life_change
FROM world_life_expectancy w
JOIN world_life_expectancy w1
ON w.Row_ID = w1.Row_ID - 15
WHERE w.Year = 2022 
ORDER BY life_change
LIMIT 5;

SELECT Country, Year, Lifeexpectancy
FROM world_life_expectancy
WHERE Country IN ('Syrian Arab Republic', 'Saint Vincent and the Grenadines', 'Libya', 'Paraguay', 'Yemen'); 
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

-- countries who improved actually had lower average BMI then countries who didnt!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SELECT 'Most Improvement', ROUND(AVG(BMI),1) AS avg_BMI
FROM world_life_expectancy
WHERE Country IN ('Zimbabwe', 'Eritrea', 'Zambia', 'Botswana', 'Rwanda')
UNION
SELECT 'Least Improvement', ROUND(AVG(BMI),1)
FROM world_life_expectancy
WHERE Country IN ('Syrian Arab Republic', 'Saint Vincent and the Grenadines', 'Libya', 'Paraguay', 'Yemen');
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

-- average or dieseases in these countries!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SELECT 'Most Improvement', ROUND(AVG(Measles)+AVG(Polio)+AVG(Diphtheria)+AVG(HIVAIDS),1) AS sum_of_dieseases
FROM world_life_expectancy
WHERE Country IN ('Zimbabwe', 'Eritrea', 'Zambia', 'Botswana', 'Rwanda') 
AND 0 NOT IN (Measles, Polio, Diphtheria, HIVAIDS)
UNION
SELECT 'Least Improvement', ROUND(AVG(Measles)+AVG(Polio)+AVG(Diphtheria)+AVG(HIVAIDS),1) AS sum_of_dieseases
FROM world_life_expectancy
WHERE Country IN ('Syrian Arab Republic', 'Saint Vincent and the Grenadines', 'Libya', 'Paraguay', 'Yemen')
AND 0 NOT IN (Measles, Polio, Diphtheria, HIVAIDS);
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

-- Average life span in 2007 and 2022 for most improved countries!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SELECT Year, AVG(Lifeexpectancy)
FROM world_life_expectancy
WHERE Country IN ('Zimbabwe', 'Eritrea', 'Zambia', 'Botswana', 'Rwanda') AND Year IN (2022, 2007)
GROUP BY Year;

-- Average life span in 2007 and 2022 for most least countries
SELECT Year, AVG(Lifeexpectancy)
FROM world_life_expectancy
WHERE Country IN ('Syrian Arab Republic', 'Saint Vincent and the Grenadines', 'Libya', 'Paraguay', 'Yemen') AND Year IN (2022, 2007)
GROUP BY Year;
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- make story with info above












-- highest life span decrease in 1 year!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SELECT t1.Country, t1.Year, t1.Lifeexpectancy, t2.Year, t2.Lifeexpectancy, ROUND(t1.Lifeexpectancy - t2.Lifeexpectancy,1) AS life_decrease
FROM world_life_expectancy t1
JOIN world_life_expectancy t2
ON t1.Row_ID-1 = t2.Row_ID
WHERE t1.Lifeexpectancy <> 0 AND t2.Lifeexpectancy <> 0 AND t1.Lifeexpectancy > t2.Lifeexpectancy AND CONCAT(t1.Year,t2.Year) <> 20222007
ORDER BY life_decrease DESC
LIMIT 5;

-- looking at all data for those countries
SELECT Country, Year, Lifeexpectancy
FROM world_life_expectancy 
WHERE Country In ('Haiti', 'Syrian Arab Republic','Norway', 'Germany', 'Saint Vincent and the Grenadines') AND Lifeexpectancy <> 0
ORDER BY Country, Year DESC;
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!









-- avg life span per year!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SELECT Year, ROUND(AVG(Lifeexpectancy),1) AS avg_life
FROM world_life_expectancy
WHERE Lifeexpectancy <> 0
GROUP BY Year
ORDER BY AVG(Lifeexpectancy) DESC;
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

-- avg GDP and life span per country with CASE statment to better investigate!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SELECT Country, ROUND(AVG(Lifeexpectancy),1) AS avg_life, ROUND(AVG(GDP),1) AS avg_GDP,
	CASE 
		WHEN AVG(Lifeexpectancy) > (SELECT AVG(Lifeexpectancy) FROM world_life_expectancy) AND AVG(GDP) > (SELECT AVG(GDP) FROM world_life_expectancy) THEN 'long life and high $'
		WHEN AVG(Lifeexpectancy) > (SELECT AVG(Lifeexpectancy) FROM world_life_expectancy) AND AVG(GDP) < (SELECT AVG(GDP) FROM world_life_expectancy) THEN 'long life and low $'
		WHEN AVG(Lifeexpectancy) < (SELECT AVG(Lifeexpectancy) FROM world_life_expectancy) AND AVG(GDP) > (SELECT AVG(GDP) FROM world_life_expectancy) THEN 'short life and high $'
		WHEN AVG(Lifeexpectancy) < (SELECT AVG(Lifeexpectancy) FROM world_life_expectancy) AND AVG(GDP) < (SELECT AVG(GDP) FROM world_life_expectancy) THEN 'short life and low $'
END AS type 
FROM world_life_expectancy
WHERE GDP <> 0 AND Lifeexpectancy <> 0  
GROUP BY Country
ORDER BY avg_GDP;
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

-- avg BMI and life span per country with CASE statment to better investigate!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SELECT Country, ROUND(AVG(Lifeexpectancy),1) AS avg_life, ROUND(AVG(BMI),1) AS avg_BMI,
	CASE 
		WHEN AVG(Lifeexpectancy) > (SELECT AVG(Lifeexpectancy) FROM world_life_expectancy) AND AVG(BMI) > (SELECT AVG(BMI) FROM world_life_expectancy) THEN 'long life and high BMI'
		WHEN AVG(Lifeexpectancy) > (SELECT AVG(Lifeexpectancy) FROM world_life_expectancy) AND AVG(BMI) < (SELECT AVG(BMI) FROM world_life_expectancy) THEN 'long life and low BMI'
		WHEN AVG(Lifeexpectancy) < (SELECT AVG(Lifeexpectancy) FROM world_life_expectancy) AND AVG(BMI) > (SELECT AVG(BMI) FROM world_life_expectancy) THEN 'short life and high BMI'
		WHEN AVG(Lifeexpectancy) < (SELECT AVG(Lifeexpectancy) FROM world_life_expectancy) AND AVG(BMI) < (SELECT AVG(BMI) FROM world_life_expectancy) THEN 'short life and low BMI'
	END AS type 
FROM world_life_expectancy
WHERE BMI <> 0 AND Lifeexpectancy <> 0  
GROUP BY Country
ORDER BY avg_BMI;
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

-- shows correlation between GDP and life span 
SELECT SUM(CASE WHEN GDP >= (SELECT AVG(GDP) FROM world_life_expectancy) THEN 1 ELSE 0 END) AS high_GDP_count,
	   AVG(CASE WHEN GDP >= (SELECT AVG(GDP) FROM world_life_expectancy) THEN Lifeexpectancy ELSE NULL END) AS avg_high_GDP,
       SUM(CASE WHEN GDP <= (SELECT AVG(GDP) FROM world_life_expectancy) THEN 1 ELSE 0 END) AS low_GDP_count,
	   AVG(CASE WHEN GDP <= (SELECT AVG(GDP) FROM world_life_expectancy) THEN Lifeexpectancy ELSE NULL END) AS avg_low_GDP
FROM world_life_expectancy;

-- shows avg life span per status and count of distinct countries with that status!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SELECT status, ROUND(AVG(Lifeexpectancy),1) avg_life_span, COUNT(DISTINCT Country) country_count
FROM world_life_expectancy
WHERE Lifeexpectancy <> 0
GROUP BY status;
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


-- shows correlation between life expectancy and BMI 
SELECT Country, AVG(BMI), AVG(Lifeexpectancy)
FROM world_life_expectancy
WHERE BMI <> 0 AND Lifeexpectancy <> 0
GROUP BY Country
ORDER BY AVG(BMI);









