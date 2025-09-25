/*
Question. What are the most optimal skills to learn (aka it is in high demand and a high-paying skill)? Identify skills in high demand and associated with high average salaries for data analyst, data scientist and data engineer roles with concentration on remote positions with specified salaries while ensuring the number of job postings is more than 10.
*/


-- Using CTE
-- postgres_above_10_optimal_remote_data_analyst_skills_cte_query
WITH skills_demand AS (
    SELECT
        sd.skill_id,
        sd.skills,
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
        job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL AND job_work_from_home = True
    GROUP BY
        sd.skill_id
),
#
average_salary AS (
    SELECT
        sjd.skill_id,
        -- skills,
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
        job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL AND job_work_from_home = True
    GROUP BY
        sjd.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
    INNER JOIN
    average_salary
    ON
    skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25
;


-- Using JOIN and HAVING (faster than CTE)
-- postgres_above_10_optimal_remote_data_analyst_skills_query
SELECT
    sd.skill_id,
    sd.skills,
    COUNT(sjd.job_id) AS demand_count,
    ROUND(AVG(jpf.salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact AS jpf
    INNER JOIN
    skills_job_dim AS sjd
    ON
    jpf.job_id = sjd.job_id
    INNER JOIN
    skills_dim AS sd
    ON
    sd.skill_id = sjd.skill_id
WHERE
    job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL AND job_work_from_home = True
GROUP BY
    sd.skill_id
HAVING
    COUNT(sjd.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25
;


-- Using CTE
-- sqlite_above_10_optimal_remote_data_analyst_skills_cte_query
WITH skills_demand AS (
    SELECT
        sd.skill_id,
        sd.skills,
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
        job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL AND job_work_from_home = True
    GROUP BY
        sd.skill_id
),

average_salary AS (
    SELECT
        sjd.skill_id,
        -- skills,
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
        job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL AND job_work_from_home = True
    GROUP BY
        sjd.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
    INNER JOIN
    average_salary
    ON
    skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25
;


-- Using JOIN and HAVING
-- sqlite_above_10_optimal_remote_data_analyst_skills_query
SELECT
    sd.skill_id,
    sd.skills,
    COUNT(sjd.job_id) AS demand_count,
    ROUND(AVG(jpf.salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact AS jpf
    INNER JOIN
    skills_job_dim AS sjd
    ON
    jpf.job_id = sjd.job_id
    INNER JOIN
    skills_dim AS sd
    ON
    sd.skill_id = sjd.skill_id
WHERE
    job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL AND job_work_from_home = True
GROUP BY
    sd.skill_id
HAVING
    COUNT(sjd.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25
;


-- Using CTE
-- postgres_above_10_optimal_remote_data_scientist_skills_cte_query
WITH skills_demand AS (
    SELECT
        sd.skill_id,
        sd.skills,
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
        job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL AND job_work_from_home = True
    GROUP BY
        sd.skill_id
),

average_salary AS (
    SELECT
        sjd.skill_id,
        -- skills,
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
        job_title_short = 'Data Scientist' AND salary_year_avg IS NOT NULL AND job_work_from_home = True
    GROUP BY
        sjd.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
    INNER JOIN
    average_salary
    ON
    skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25
;


-- Using JOIN and HAVING
-- postgres_above_10_optimal_remote_data_scientist_skills_query
SELECT
    sd.skill_id,
    sd.skills,
    COUNT(sjd.job_id) AS demand_count,
    ROUND(AVG(jpf.salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact AS jpf
    INNER JOIN
    skills_job_dim AS sjd
    ON
    jpf.job_id = sjd.job_id
    INNER JOIN
    skills_dim AS sd
    ON
    sd.skill_id = sjd.skill_id
WHERE
    job_title_short = 'Data Scientist' AND salary_year_avg IS NOT NULL AND job_work_from_home = True
GROUP BY
    sd.skill_id
HAVING
    COUNT(sjd.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25
;


-- Using CTE
-- sqlite_above_10_optimal_remote_data_scientist_skills_cte_query
WITH skills_demand AS (
    SELECT
        sd.skill_id,
        sd.skills,
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
        job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL AND job_work_from_home = True
    GROUP BY
        sd.skill_id
),

average_salary AS (
    SELECT
        sjd.skill_id,
        -- skills,
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
        job_title_short = 'Data Scientist' AND salary_year_avg IS NOT NULL AND job_work_from_home = True
    GROUP BY
        sjd.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
    INNER JOIN
    average_salary
    ON
    skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25
;


-- Using JOIN and HAVING
-- sqlite_above_10_optimal_remote_data_scientist_skills_query
SELECT
    sd.skill_id,
    sd.skills,
    COUNT(sjd.job_id) AS demand_count,
    ROUND(AVG(jpf.salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact AS jpf
    INNER JOIN
    skills_job_dim AS sjd
    ON
    jpf.job_id = sjd.job_id
    INNER JOIN
    skills_dim AS sd
    ON
    sd.skill_id = sjd.skill_id
WHERE
    job_title_short = 'Data Scientist' AND salary_year_avg IS NOT NULL AND job_work_from_home = True
GROUP BY
    sd.skill_id
HAVING
    COUNT(sjd.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25
;


-- Using CTE
-- postgres_above_10_optimal_remote_data_engineer_skills_cte_query
WITH skills_demand AS (
    SELECT
        sd.skill_id,
        sd.skills,
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
        job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL AND job_work_from_home = True
    GROUP BY
        sd.skill_id
),

average_salary AS (
    SELECT
        sjd.skill_id,
        -- skills,
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
        job_title_short = 'Data Engineer' AND salary_year_avg IS NOT NULL AND job_work_from_home = True
    GROUP BY
        sjd.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
    INNER JOIN
    average_salary
    ON
    skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25
;


-- Using JOIN and HAVING
-- postgres_above_10_optimal_remote_data_engineer_skills_query
SELECT
    sd.skill_id,
    sd.skills,
    COUNT(sjd.job_id) AS demand_count,
    ROUND(AVG(jpf.salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact AS jpf
    INNER JOIN
    skills_job_dim AS sjd
    ON
    jpf.job_id = sjd.job_id
    INNER JOIN
    skills_dim AS sd
    ON
    sd.skill_id = sjd.skill_id
WHERE
    job_title_short = 'Data Engineer' AND salary_year_avg IS NOT NULL AND job_work_from_home = True
GROUP BY
    sd.skill_id
HAVING
    COUNT(sjd.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25
;


-- Using CTE
-- sqlite_above_10_optimal_remote_data_engineer_skills_cte_query
WITH skills_demand AS (
    SELECT
        sd.skill_id,
        sd.skills,
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
        job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL AND job_work_from_home = True
    GROUP BY
        sd.skill_id
),

average_salary AS (
    SELECT
        sjd.skill_id,
        -- skills,
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
        job_title_short = 'Data Engineer' AND salary_year_avg IS NOT NULL AND job_work_from_home = True
    GROUP BY
        sjd.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
    INNER JOIN
    average_salary
    ON
    skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25
;


-- Using JOIN and HAVING
-- sqlite_above_10_optimal_remote_data_engineer_skills_query
SELECT
    sd.skill_id,
    sd.skills,
    COUNT(sjd.job_id) AS demand_count,
    ROUND(AVG(jpf.salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact AS jpf
    INNER JOIN
    skills_job_dim AS sjd
    ON
    jpf.job_id = sjd.job_id
    INNER JOIN
    skills_dim AS sd
    ON
    sd.skill_id = sjd.skill_id
WHERE
    job_title_short = 'Data Engineer' AND salary_year_avg IS NOT NULL AND job_work_from_home = True
GROUP BY
    sd.skill_id
HAVING
    COUNT(sjd.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25
;
