/*
Question. What are the top skills based on salary? Look at the average salary associated with each skill for data analyst, data scientist and data engineer positions regardless of location.
*/


-- postgres_top_data_analyst_skills_based_on_salary_query
SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
    INNER JOIN
    skills_job_dim AS sjd
    ON
    job_postings_fact.job_id = sjd.job_id
    INNER JOIN
    skills_dim AS sd
    ON
    sd.skill_id = sjd.skill_id
WHERE
    job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25
;


-- sqlite_top_data_analyst_skills_based_on_salary_query
SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
    INNER JOIN
    skills_job_dim AS sjd
    ON
    job_postings_fact.job_id = sjd.job_id
    INNER JOIN
    skills_dim AS sd
    ON
    sd.skill_id = sjd.skill_id
WHERE
    job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25
;


-- postgres_top_data_scientist_skills_based_on_salary_query
SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
    INNER JOIN
    skills_job_dim AS sjd
    ON
    job_postings_fact.job_id = sjd.job_id
    INNER JOIN
    skills_dim AS sd
    ON
    sd.skill_id = sjd.skill_id
WHERE
    job_title_short = 'Data Scientist' AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25
;


-- sqlite_top_data_scientist_skills_based_on_salary_query
SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
    INNER JOIN
    skills_job_dim AS sjd
    ON
    job_postings_fact.job_id = sjd.job_id
    INNER JOIN
    skills_dim AS sd
    ON
    sd.skill_id = sjd.skill_id
WHERE
    job_title_short = 'Data Scientist' AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25
;


-- postgres_top_data_engineer_skills_based_on_salary_query
SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
    INNER JOIN
    skills_job_dim AS sjd
    ON
    job_postings_fact.job_id = sjd.job_id
    INNER JOIN
    skills_dim AS sd
    ON
    sd.skill_id = sjd.skill_id
WHERE
    job_title_short = 'Data Engineer' AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25
;


-- sqlite_top_data_engineer_skills_based_on_salary_query
SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
    INNER JOIN
    skills_job_dim AS sjd
    ON
    job_postings_fact.job_id = sjd.job_id
    INNER JOIN
    skills_dim AS sd
    ON
    sd.skill_id = sjd.skill_id
WHERE
    job_title_short = 'Data Engineer' AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25
;
