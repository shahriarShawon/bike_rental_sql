# Bike Rental Shop - SQL Case Study

## Description: 
This repository contains my solutions to the Bike Rental Shop SQL Case Study from LearnSQL.com's "November 2023 SQL Challenge". The project includes SQL queries addressing various business questions for a bike rental shop's database, along with a PDF visualization created using Metabase.

## Contents:
- SQL Queries: Solutions to business questions.
- Visualization: PDF of the Metabase dashboard showcasing the data analysis.

## Dataset Description
The dataset consists of five tables:
1. customer
2. bike
3. rental
4. membership_type
5. membership

## Business Questions that are answered
1. How many bikes does the shop own by category?
2. List of customer names with the total number of memberships purchased by each.
3. Prepare a list of new rental prices for a special winter offer.
4. Counts of rented and available bikes in each category.
5. Total revenue from rentals by month, by year, and all-time.
6. Total revenue from memberships for each combination of year, month, and membership type.
7. Memberships purchased in 2023, with subtotals and grand totals.
8. Segment customers based on the number of rentals.

## Techniques Used
The tasks were accomplished using various SQL techniques including:

- SELECT statements
- JOIN operations
- GROUP BY clause
- HAVING clause
- CASE statements
- WITH ROLLUP for subtotals and grand totals
- Common Table Expressions (CTEs)

## Files
- create_db.sql: Contains the dataset used for analysis
- solutions.sql: SQL queries used to solve the tasks
- README.md: This file
- Bike Rental Case Study.pdf: Contains the visualization created in metabase (Note: The dynamic dashboard was created in Metabase and hosted locally; hence, only the static PDF version is provided here.)

## To replicate the analysis or explore further:
- Clone this repository.
- Import the dataset (create_db.sql) into your MySQL database.
- Open solutions.sql to view the SQL queries used for each task.
- Execute the queries in your MySQL environment to obtain the results.

## Credits:
- https://learnsql.com
- https://www.youtube.com/techtfq









