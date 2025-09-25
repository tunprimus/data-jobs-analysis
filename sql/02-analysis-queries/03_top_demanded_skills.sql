/*
Question. What are the most in-demand skills? Identify the top 7 in-demand skills for a data analyst, data scientist and data engineer from all job postings.
*/


-- postgres_top_in_demand_skills_for_data_analyst_query
SELECT
    skills,
    COUNT(sjd.job_id) AS demand_count
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
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 7
;


-- sqlite_top_in_demand_skills_for_data_analyst_query
SELECT
    skills,
    COUNT(sjd.job_id) AS demand_count
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
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 7
;


-- postgres_top_in_demand_skills_for_data_scientist_query
SELECT
    skills,
    COUNT(sjd.job_id) AS demand_count
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
    job_title_short = 'Data Scientist'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 7
;


-- sqlite_top_in_demand_skills_for_data_scientist_query
SELECT
    skills,
    COUNT(sjd.job_id) AS demand_count
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
    job_title_short = 'Data Scientist'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 7
;


-- postgres_top_in_demand_skills_for_data_engineer_query
SELECT
    skills,
    COUNT(sjd.job_id) AS demand_count
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
    job_title_short = 'Data Engineer'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 7
;


-- sqlite_top_in_demand_skills_for_data_engineer_query
SELECT
    skills,
    COUNT(sjd.job_id) AS demand_count
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
    job_title_short = 'Data Engineer'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 7
;
