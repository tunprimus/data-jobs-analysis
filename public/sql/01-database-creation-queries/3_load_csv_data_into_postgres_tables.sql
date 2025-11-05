/* ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️


Download the required CSV files from the following sqliteviz link: https://lukeb.co/sql_jobs_db
    - select each of the 4 tables ("Jobs Fact Table", "Company Dim Table", "Skills Dim Table", "Skill-Job Dim Table" )
    - for each table, go to the extreme right vertical pane and click on the "Export result set to CSV file" button towards the bottom

Note the path to the downloaded CSV files.


Database Load Issues (follow if receiving permission denied when running SQL code below)

Possible Errors:
- ERROR >>  duplicate key value violates unique constraint "company_dim_pkey"
- ERROR >> could not open file "C:\Users\...\company_dim.csv" for reading: Permission denied

1. Drop the Database
            DROP DATABASE IF EXISTS datanerd_jobs;
2. Repeat steps to create database and load table schemas
            - 1_create_database.sql
            - 2_create_tables.sql
3. Open pgAdmin
4. In Object Explorer (left-hand pane), navigate to `datanerd_jobs` database
5. Right-click `datanerd_jobs` and select `PSQL Tool`
            - This opens a terminal window to write the following code
6. Get the absolute file path of your csv files
            1. Find path by right-clicking a CSV file in VS Code and selecting “Copy Path”
7. Paste the following into `PSQL Tool`, (with the CORRECT file path)

\copy company_dim FROM '[Insert File Path]/company_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_dim FROM '[Insert File Path]/skills_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy job_postings_fact FROM '[Insert File Path]/job_postings_fact.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_job_dim FROM '[Insert File Path]/skills_job_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

8. Wait a while for each table to load (several minutes for the large CSV files)

9. Run the following code to check that the data has been loaded
            - SELECT * FROM job_postings_fact LIMIT 100;

*/


-- NOTE: This has been updated to fix issues with encoding
COPY company_dim
FROM '$USER/Downloads/path-to/company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM '$USER/Downloads/path-to/skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM '$USER/Downloads/path-to/job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM '$USER/Downloads/path-to/skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');


SELECT *
FROM job_postings_fact
LIMIT 100;
