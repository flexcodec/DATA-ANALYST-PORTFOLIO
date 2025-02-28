# Data Cleaning and Exploratory Data Analysis (EDA) for Layoffs Dataset

This document outlines the steps taken to clean the **Layoffs dataset** using MySQL and perform exploratory data analysis (EDA)
to uncover insights. The goal was to prepare the data for analysis by removing duplicates, standardizing formats,
handling missing values, and eliminating unnecessary rows and columns. Additionally, EDA was conducted to understand
trends and patterns in the data.

---

## Steps Performed

### 1. **Data Cleaning**

#### 1.1 Removing Duplicate Values

- Duplicate entries in columns such as `Country` and `Location` were identified and removed to ensure data uniqueness.

---

#### 1.2 Standardizing the Data

- **Trimming Unnecessary Spaces**:

  - Leading and trailing spaces were removed from text fields using the `TRIM()` function.

  ```sql
  UPDATE layoffs_stagging2
  SET column_name = TRIM(column_name);
  ```

- **Changing Date Format**:

  - The `date` column, originally stored as text (`MM/DD/YYYY`), was converted to a `DATE` format.

  ```sql
  -- Convert text to date
  SELECT `date`, STR_TO_DATE(`date`, '%m/%d/%Y')
  FROM layoffs_stagging2;

  -- Update the column with the new format
  UPDATE layoffs_stagging2
  SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

  -- Modify the column data type to DATE
  ALTER TABLE layoffs_stagging2
  MODIFY COLUMN `date` DATE;
  ```

- **Handling Missing Data**:
  - Missing values in the `industry` column were filled with `#Travel` where applicable.
  ```sql
  UPDATE layoffs_stagging2
  SET industry = '#Travel'
  WHERE industry IS NULL;
  ```

---

#### 1.3 Removing Unnecessary Rows and Columns

- **Removing Irrelevant Rows**:

  - Rows with `NULL` values in both `total_laid_off` and `percentage_laid_off` were deleted.

  ```sql
  DELETE
  FROM layoffs_stagging2
  WHERE total_laid_off IS NULL
  AND percentage_laid_off IS NULL;
  ```

- **Dropping Unnecessary Columns**:
  - Columns such as `row_num` that were not relevant to the analysis were removed.
  ```sql
  ALTER TABLE layoffs_stagging2
  DROP COLUMN row_num;
  ```

---

### 2. **Exploratory Data Analysis (EDA)**

#### 2.1 Basic Data Exploration

- View the cleaned dataset:

  ```sql
  SELECT *
  FROM layoffs_stagging2;
  ```

- Find the maximum values for `total_laid_off` and `percentage_laid_off`:

  ```sql
  SELECT MAX(total_laid_off), MAX(percentage_laid_off)
  FROM layoffs_stagging2;
  ```

- Identify companies with 100% layoffs, ordered by funds raised:
  ```sql
  SELECT *
  FROM layoffs_stagging2
  WHERE percentage_laid_off = 1
  ORDER BY funds_raised_millions DESC;
  ```

---

#### 2.2 Aggregated Analysis

- **Total Layoffs by Company**:

  ```sql
  SELECT company, SUM(total_laid_off)
  FROM layoffs_stagging2
  GROUP BY company
  ORDER BY 2 DESC;
  ```

- **Total Layoffs by Industry**:

  ```sql
  SELECT industry, SUM(total_laid_off)
  FROM layoffs_stagging2
  GROUP BY industry
  ORDER BY 2 DESC;
  ```

- **Total Layoffs by Country**:

  ```sql
  SELECT country, SUM(total_laid_off)
  FROM layoffs_stagging2
  GROUP BY country
  ORDER BY 2 DESC;
  ```

- **Total Layoffs by Year**:

  ```sql
  SELECT YEAR(`date`), SUM(total_laid_off)
  FROM layoffs_stagging2
  GROUP BY YEAR(`date`)
  ORDER BY 1 DESC;
  ```

- **Total Layoffs by Stage**:

  ```sql
  SELECT stage, SUM(total_laid_off)
  FROM layoffs_stagging2
  GROUP BY stage
  ORDER BY 2 DESC;
  ```

- **Average Percentage Layoffs by Company**:
  ```sql
  SELECT company, AVG(percentage_laid_off)
  FROM layoffs_stagging2
  GROUP BY company
  ORDER BY 2 DESC;
  ```

---

#### 2.3 Time-Based Analysis

- **Total Layoffs by Month**:

  ```sql
  SELECT SUBSTRING(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off)
  FROM layoffs_stagging2
  WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
  GROUP BY `MONTH`
  ORDER BY 1 ASC;
  ```

- **Rolling Total Layoffs by Month**:
  ```sql
  WITH Rolling_Total AS (
      SELECT SUBSTRING(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off) AS total_off
      FROM layoffs_stagging2
      WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
      GROUP BY `MONTH`
      ORDER BY 1 ASC
  )
  SELECT `MONTH`, total_off, SUM(total_off) OVER (ORDER BY `MONTH`) AS Rolling_total
  FROM Rolling_Total;
  ```

---

#### 2.4 Ranking and Top Performers

- **Ranking Companies by Layoffs per Year**:

  ```sql
  WITH Company_Year AS (
      SELECT company, YEAR(`date`) AS years, SUM(total_laid_off) AS total_laid_off
      FROM layoffs_stagging2
      GROUP BY company, YEAR(`date`)
  )
  SELECT *, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
  FROM Company_Year
  WHERE years IS NOT NULL
  ORDER BY Ranking ASC;
  ```

- **Top 5 Companies by Layoffs per Year**:

  ```sql
  WITH Company_Year AS (
      SELECT company, YEAR(`date`) AS years, SUM(total_laid_off) AS total_laid_off
      FROM layoffs_stagging2
      GROUP BY company, YEAR(`date`)
  ), Company_Year_Rank AS (
      SELECT *, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
      FROM Company_Year
      WHERE years IS NOT NULL
  )
  SELECT *
  FROM Company_Year_Rank
  WHERE Ranking <= 5;
  ```

- **Total Number of Companies by Country**:

  ```sql
  SELECT country, COUNT(company) AS Total_Company
  FROM layoffs_stagging2
  WHERE company IS NOT NULL
  GROUP BY country
  ORDER BY 1 ASC;
  ```

- **Companies in France**:
  ```sql
  SELECT company
  FROM layoffs_stagging2
  WHERE country LIKE 'France';
  ```

---

## Summary

The cleaning process involved:

- Removing duplicate values.
- Standardizing data formats (e.g., dates, trimming spaces).
- Filling missing values.
- Removing unnecessary rows and columns.

The EDA process included:

- Aggregating data by company, industry, country, and time.
- Ranking companies by layoffs.
- Analyzing trends over time.

This process ensured the dataset was clean, consistent, and ready for analysis.

---

## Tools Used

- **MySQL**: For executing SQL queries to clean, transform, and analyze the data.

---

## Dataset Information

- **Dataset Name**: Layoffs
- **Source**: Collected from various customers.
- **Purpose**: To analyze layoff trends and patterns.

---

For any questions or further assistance, feel free to reach out!
