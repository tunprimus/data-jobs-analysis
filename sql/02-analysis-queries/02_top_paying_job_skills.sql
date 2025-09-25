/*
Question. What skills are required for the top-paying data analyst, data scientist and data engineer jobs? Identify the top 10 highest-paying Data Analyst/Scientist/Engineer jobs from the first query. Add the specific skills required for these roles.
*/


-- postgres_top_data_analyst_jobs_skills_query
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
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
)

SELECT
    top_paying_jobs.*,
    skills
FROM
    top_paying_jobs
    INNER JOIN
    skills_job_dim AS sjd
    ON
    top_paying_jobs.job_id = sjd.job_id
    INNER JOIN
    skills_dim AS sd
    ON
    sd.skill_id = sjd.skill_id
ORDER BY
    salary_year_avg DESC
;



-- sqlite_top_data_analyst_jobs_skills_query
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
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
)

SELECT
    top_paying_jobs.*,
    skills
FROM
    top_paying_jobs
    INNER JOIN
    skills_job_dim AS sjd
    ON
    top_paying_jobs.job_id = sjd.job_id
    INNER JOIN
    skills_dim AS sd
    ON
    sd.skill_id = sjd.skill_id
ORDER BY
    salary_year_avg DESC
;


-- postgres_top_data_scientist_jobs_skills_query
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
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
)

SELECT
    top_paying_jobs.*,
    skills
FROM
    top_paying_jobs
    INNER JOIN
    skills_job_dim AS sjd
    ON
    top_paying_jobs.job_id = sjd.job_id
    INNER JOIN
    skills_dim AS sd
    ON
    sd.skill_id = sjd.skill_id
ORDER BY
    salary_year_avg DESC
;


-- sqlite_top_data_scientist_jobs_skills_query
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
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
)

SELECT
    top_paying_jobs.*,
    skills
FROM
    top_paying_jobs
    INNER JOIN
    skills_job_dim AS sjd
    ON
    top_paying_jobs.job_id = sjd.job_id
    INNER JOIN
    skills_dim AS sd
    ON
    sd.skill_id = sjd.skill_id
ORDER BY
    salary_year_avg DESC
;


-- postgres_top_data_engineer_jobs_skills_query
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
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
)

SELECT
    top_paying_jobs.*,
    skills
FROM
    top_paying_jobs
    INNER JOIN
    skills_job_dim AS sjd
    ON
    top_paying_jobs.job_id = sjd.job_id
    INNER JOIN
    skills_dim AS sd
    ON
    sd.skill_id = sjd.skill_id
ORDER BY
    salary_year_avg DESC
;


-- sqlite_top_data_engineer_jobs_skills_query
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
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
)

SELECT
    top_paying_jobs.*,
    skills
FROM
    top_paying_jobs
    INNER JOIN
    skills_job_dim AS sjd
    ON
    top_paying_jobs.job_id = sjd.job_id
    INNER JOIN
    skills_dim AS sd
    ON
    sd.skill_id = sjd.skill_id
ORDER BY
    salary_year_avg DESC
;

