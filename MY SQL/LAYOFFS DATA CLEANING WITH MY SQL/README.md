# Data Cleaning Process for Layoffs Dataset

This document outlines the steps taken to clean the **Layoffs dataset** using MySQL.
The goal was to prepare the data for analysis by removing duplicates, standardizing formats, handling missing values, and eliminating unnecessary rows and columns.

---

## Steps Performed

### 1. **Removing Duplicate Values**

- Duplicate entries in columns such as `Country` and `Location` were identified and removed to ensure data uniqueness.

---

### 2. **Standardizing the Data**

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

### 3. **Removing Unnecessary Rows and Columns**

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

### 4. **Final Verification**

- After cleaning, the dataset was reviewed to ensure all changes were applied correctly.

```sql
SELECT *
FROM layoffs_stagging2;
```
