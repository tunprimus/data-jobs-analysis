/*
What are the features and discoveries related to Nigeria and Germany versus the rest of the world?
*/


-- worldwide_salary_min_mean_median_max_query
WITH sql_median AS (
SELECT ROUND(AVG(salary_year_avg), 1) AS median
FROM (
	SELECT
		salary_year_avg
	FROM
		job_postings_fact
	WHERE
		salary_year_avg IS NOT NULL
	ORDER BY
		salary_year_avg
	LIMIT 2 - (SELECT COUNT(*) FROM job_postings_fact WHERE salary_year_avg IS NOT NULL) % 2
	OFFSET
		(SELECT (COUNT(*) - 1) / 2 FROM job_postings_fact WHERE salary_year_avg IS NOT NULL)

) AS subquery
WHERE
	salary_year_avg IS NOT NULL
)

SELECT
    'Worldwide' AS job_location,
    MIN(salary_year_avg) AS min_salary,
    ROUND(AVG(salary_year_avg), 1) AS avg_salary,
	(SELECT * FROM sql_median) AS median_salary,
    MAX(salary_year_avg) AS max_salary
FROM
    job_postings_fact
WHERE
	salary_year_avg IS NOT NULL
;


-- nigeria_salary_min_mean_median_max_query
WITH sql_median AS (
SELECT ROUND(AVG(salary_year_avg), 1) AS median
FROM (
	SELECT
		salary_year_avg
	FROM
		job_postings_fact
	WHERE
		salary_year_avg IS NOT NULL AND job_location LIKE 'Nigeria'
	ORDER BY
		salary_year_avg
	LIMIT 2 - (SELECT COUNT(*) FROM job_postings_fact WHERE salary_year_avg IS NOT NULL AND job_location LIKE 'Nigeria') % 2
	OFFSET
		(SELECT (COUNT(*) - 1) / 2 FROM job_postings_fact WHERE salary_year_avg IS NOT NULL AND job_location LIKE 'Nigeria')

) AS subquery
WHERE
	salary_year_avg IS NOT NULL
)

SELECT
    job_location,
    MIN(salary_year_avg) AS min_salary,
    ROUND(AVG(salary_year_avg), 1) AS avg_salary,
	(SELECT * FROM sql_median) AS median_salary,
    MAX(salary_year_avg) AS max_salary
FROM
    job_postings_fact
WHERE
	salary_year_avg IS NOT NULL AND job_location LIKE 'Nigeria'
GROUP BY
    job_location
;


-- germany_salary_min_mean_median_max_query
WITH sql_median AS (
SELECT ROUND(AVG(salary_year_avg), 1) AS median
FROM (
	SELECT
		salary_year_avg
	FROM
		job_postings_fact
	WHERE
		salary_year_avg IS NOT NULL AND job_location LIKE 'Germany'
	ORDER BY
		salary_year_avg
	LIMIT 2 - (SELECT COUNT(*) FROM job_postings_fact WHERE salary_year_avg IS NOT NULL AND job_location LIKE 'Germany') % 2
	OFFSET
		(SELECT (COUNT(*) - 1) / 2 FROM job_postings_fact WHERE salary_year_avg IS NOT NULL AND job_location LIKE 'Germany')

) AS subquery
WHERE
	salary_year_avg IS NOT NULL
)

SELECT
    job_location,
    MIN(salary_year_avg) AS min_salary,
    ROUND(AVG(salary_year_avg), 1) AS avg_salary,
	(SELECT * FROM sql_median) AS median_salary,
    MAX(salary_year_avg) AS max_salary
FROM
    job_postings_fact
WHERE
	salary_year_avg IS NOT NULL AND job_location LIKE 'Germany'
GROUP BY
    job_location
;


-- worldwide_remote_vs_onsite_jobs_query
SELECT
	'Worldwide' AS job_location,
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_work_from_home = True THEN 'Remote'
        WHEN job_work_from_home = False THEN 'Onsite'
        ELSE 'Unknown'
    END AS location_category
FROM
    job_postings_fact
GROUP BY
	location_category
;


-- nigeria_remote_vs_onsite_jobs_query
SELECT
	'Nigeria' AS job_location,
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_work_from_home = True THEN 'Remote'
        WHEN job_work_from_home = False THEN 'Onsite'
        ELSE 'Unknown'
    END AS location_category
FROM
    job_postings_fact
WHERE
    job_country LIKE 'Nigeria'
GROUP BY
	location_category
;


-- germany_remote_vs_onsite_jobs_query
SELECT
	'Germany' AS job_location,
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_work_from_home = True THEN 'Remote'
        WHEN job_work_from_home = False THEN 'Onsite'
        ELSE 'Unknown'
    END AS location_category
FROM
    job_postings_fact
WHERE
    job_country LIKE 'Germany'
GROUP BY
	location_category
;


-- united_states_remote_vs_onsite_jobs_query
SELECT
	'United States' AS job_location,
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_work_from_home = True THEN 'Remote'
        WHEN job_work_from_home = False THEN 'Onsite'
        ELSE 'Unknown'
    END AS location_category
FROM
    job_postings_fact
WHERE
    job_country LIKE 'United States'
GROUP BY
	location_category
;


-- india_remote_vs_onsite_jobs_query
SELECT
	'India' AS job_location,
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_work_from_home = True THEN 'Remote'
        WHEN job_work_from_home = False THEN 'Onsite'
        ELSE 'Unknown'
    END AS location_category
FROM
    job_postings_fact
WHERE
    job_country LIKE 'India'
GROUP BY
	location_category
;

