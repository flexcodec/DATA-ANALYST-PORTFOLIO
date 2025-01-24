PRESENTATION LINK:
https://www.canva.com/design/DAGT44MTZc8/531e1Ndp5uocW27E-h4t7A/edit?utm_content=DAGT44MTZc8&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton

Business Task:

As a business analyst, I have been given a task by Nebulon to prepare their financial data for analysis. This dataset is used for budgeting and financial analysis purposes, allowing for comparative analysis of actual financial performance (outcomes) versus established budget goals or benchmarks.
Now the present structure of the dataset makes it difficult to create pivot tables, pivot charts or visualization with this type of data. Also, due to the data structure it is quite difficult to create DAX formulas for calculated columns and measures for analyzing the data.

Data Cleaning Steps:

1. First create a name range for the data in Excel if applicable.
2. Now, clean and transform the data in power query.

3. In power query take out Total Revenue, Total Expenses, & and Net Income, they can be calculated later.
4. Now use fill down to remove the null values in column 1.
5. Next, transpose the data and fill down the months to remove the months. The reason for doing this is that we do not have fill right or fill left in power query.
6. Next, merge Column 1 and Column 2 using the merge column in the transform tap. We are doing this because we must unpivot other columns but there’s no technique in power query to unpivot two column headings.
7. Now transpose the now merged column.
8. Next, promote first row containing June: Actual, as headers.
9. Now select the Expenses/Revenue & the Items column and unpivot other columns.
10. Next, the Attribute column by delimiter to get the Month and Actual/Budget Column. Remember to filter out the variance because it will be calculated later.
