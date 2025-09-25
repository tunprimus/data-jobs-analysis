/*

⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
Database Load


1. Drop the Database
    DROP DATABASE IF EXISTS datanerd_jobs;

2. Repeat steps to create database and load table schemas
    - 1_create_database.sql
    - 2_create_sqlite_tables.sql

3. Download the required CSV files from the following sqliteviz link: https://lukeb.co/sql_jobs_db
    - select each of the 4 tables ("Jobs Fact Table", "Company Dim Table", "Skills Dim Table", "Skill-Job Dim Table" )
    - for each table, go to the extreme right vertical pane and click on the "Export result set to CSV file" button towards the bottom

4. Note the path to the downloaded CSV files.

5. You can use any programming language you are familiar with to load CSV data into the database. However you can directly import CSV files into SQLite using the following command:
    a. type sqlite in the terminal to activate sqlite shell. Then type the following commands for each table:
        sqlite> .mode csv <table>
        sqlite> .import <path-to-csv-file> <table>

        sqlite> .mode csv company_dim
        sqlite> .import '$USER/Downloads/path-to/company_dim.csv' company_dim;

        sqlite> .mode csv job_postings_fact
        sqlite> .import '$USER/Downloads/path-to/job_postings_fact.csv' job_postings_fact;

        sqlite> .mode csv skills_dim
        sqlite> .import '$USER/Downloads/path-to/skills_dim.csv' skills_dim;

        sqlite> .mode csv skills_job_dim
        sqlite> .import '$USER/Downloads/path-to/skills_job_dim.csv' skills_job_dim;

    b. sqlite3 path-to-database < /path-to/3_load_data_into_sqlite_tables.sql
        - sqlite3 datanerd_jobs.db < 3_load_data_into_sqlite_tables.sql

6. Wait a while for each table to load (several minutes for the large CSV files)

7. Run the following code to check that the data has been loaded
    - SELECT * FROM job_postings_fact LIMIT 100;

*/


SELECT *
FROM job_postings_fact
LIMIT 100;
