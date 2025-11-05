/*
Question. What are the top-paying data analyst, data scientist and data engineer jobs? Identify the top 10 highest-paying Data Analyst/Scientist/Engineer roles that are available remotely.
*/

-- postgres_top_data_analyst_remote_jobs_query
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
    LEFT JOIN
    company_dim
    ON
    job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND job_location = 'Anywhere' AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
;


-- sqlite_top_data_analyst_remote_jobs_query
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
    LEFT JOIN
    company_dim
    ON
    job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND job_location = 'Anywhere' AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
;


-- postgres_top_data_scientist_remote_jobs_query
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
    LEFT JOIN
    company_dim
    ON
    job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Scientist' AND job_location = 'Anywhere' AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
;


-- sqlite_top_data_scientist_remote_jobs_query
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
    LEFT JOIN
    company_dim
    ON
    job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Scientist' AND job_location = 'Anywhere' AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
;


-- postgres_top_data_engineer_remote_jobs_query
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
    LEFT JOIN
    company_dim
    ON
    job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Engineer' AND job_location = 'Anywhere' AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
;


-- sqlite_top_data_engineer_remote_jobs_query
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
    LEFT JOIN
    company_dim
    ON
    job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Engineer' AND job_location = 'Anywhere' AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
;
