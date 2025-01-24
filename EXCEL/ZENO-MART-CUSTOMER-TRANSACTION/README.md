Data Cleaning and Transformation Steps:

1. Change the Customer’s Date of Birth to a Proper Date Format. Next, extract the Customer’s Age from the Customer’s Date of Birth.
   Excel formula tip: =DATEDIF(Cell Coordinate, TODAY(), “Y”).

2. Now give the Raw Dataset a Table format. Call the data table ZenoMartDt

3. Clean and Transform the Data in Power Query. Select the Data Tab and Click on From Table/Range.

4. Extract the first name and last name from the Email Column using Text with Delimiters. Begin the First and Last Name with an Upper Case. Next, Merge the first and last name columns and rename the column to Full Name.

5. Use choose column to remove the Email Column.

6. Trim the Product Name Column to Remove Extra Spaces.

7. Change the Purchase Date to a Proper Date Format. Next, extract the Year from the Purchase Date and Rename the New Column as the Year of Purchase.

8. Use the Conditional Column technique to change the 1s to Yes and 0s to No in the Loyalty Card Column. Now Rename the New Column as Have Loyalty Card.

9. Extract the Region from the Location Column. Now rename the new column as Region and the Location Column as Country.

10. Give the following Columns a Currency Data Type: Unit Price, Cost Price, & Selling Price.

11. Now using Custom Column under the Add Column tab, Calculate the CostPerOrder and SalesPerOrder.

12. Next, Calculate the Profit.
