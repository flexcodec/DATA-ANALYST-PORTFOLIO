-- Exploratory Data Analysis

SELECT *
FROM layoffs_stagging2;

-- Maximum total_laid_off and Maximum percentage_laid_off
SELECT max(total_laid_off), max(percentage_laid_off)
FROM layoffs_stagging2;

-- percentage_laid_off at 100% by Funds_raised_millions in DESC ordeer
SELECT *
FROM layoffs_stagging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

-- Total Laid_off by Company
SELECT company, sum(total_laid_off)
FROM layoffs_stagging2
GROUP BY company
ORDER BY 2 DESC;

-- Minimum date and Mximum date
SELECT min(`date`), max(`date`)
FROM layoffs_stagging2;

-- Total Laid_off by Industry
SELECT industry, sum(total_laid_off)
FROM layoffs_stagging2
GROUP BY industry
ORDER BY 2 DESC;

-- Total Laid_off by Country
SELECT country, sum(total_laid_off)
FROM layoffs_stagging2
GROUP BY country
ORDER BY 2 DESC;


-- Total Laid_off by Years
SELECT year(`date`), sum(total_laid_off)
FROM layoffs_stagging2
GROUP BY year(`date`)
ORDER BY 1 DESC;

-- Tiral laid_off by stage
SELECT stage, sum(total_laid_off)
FROM layoffs_stagging2
GROUP BY stage
ORDER BY 2 DESC;

-- Percentage laid off by company 
SELECT company, avg(percentage_laid_off)
FROM layoffs_stagging2
GROUP BY company
ORDER BY 2 DESC;

-- Total Laid_off by Months
SELECT substring(`date`,1,7) as `MONTH`, sum(total_laid_off)
FROM layoffs_stagging2
WHERE substring(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
;

-- Total Rolling Laid_off by Months and Years
WITH Rolling_Total AS
(
SELECT substring(`date`,1,7) as `MONTH`, sum(total_laid_off) AS total_off
FROM layoffs_stagging2
WHERE substring(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`, total_off, sum(total_off) OVER (ORDER BY `MONTH`) AS Rolling_total
FROM Rolling_Total ;


-- Total laid_off by company
SELECT company, sum(total_laid_off)
FROM layoffs_stagging2
GROUP BY company
ORDER BY 2 DESC;


-- TOtal laid_off by company by year
SELECT company,  year(`date`) Years, sum(total_laid_off) total_laid
FROM layoffs_stagging2
GROUP BY company,years
ORDER BY 3 DESC;

-- Here we are doing ranking 

WITH Company_Year (company, years, total_laid_off) AS
(
SELECT company,  year(`date`), sum(total_laid_off)
FROM layoffs_stagging2
GROUP BY company, year(`date`)
)
SELECT *, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year 
WHERE years IS NOT NULL
ORDER BY Ranking ASC;

-- Here we have the ranking of top 5 companies [er years 

WITH Company_Year (company, years, total_laid_off) AS
(
SELECT company,  year(`date`), sum(total_laid_off)
FROM layoffs_stagging2
GROUP BY company, year(`date`)
), Company_Year_Rank AS 
(
SELECT *, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year 
WHERE years IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE Ranking <= 5;
;
-- NB: We can change this query to another column like company, industry etc...

-- Total Number of Compny By country
SELECT country, count(company) Total_Company
FROM layoffs_stagging2
WHERE company IS NOT NULL 
GROUP BY country 
ORDER BY 1 ASC
;


SELECT company
FROM layoffs_stagging2
WHERE country LIKE 'France' ;

