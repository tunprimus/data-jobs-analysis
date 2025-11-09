/*
Combine all the tables to create a single table with all job postings data.
N.B. This table is large.
*/


-- full_dataset_verbose_query
SELECT DISTINCT
	jpf.job_id,
	jpf.job_title_short AS job_title,
	cd.name AS company_name,
	jpf.job_location AS job_location,
	sd.skills AS skill,
	sd.type AS field,
	jpf.job_via AS job_via,
	jpf.job_schedule_type AS job_schedule,
	jpf.job_work_from_home AS remote_job,
	jpf.job_no_degree_mention AS need_degree,
	jpf.job_health_insurance AS has_insurance,
	jpf.job_country AS country,
	jpf.salary_hour_avg AS hourly_salary,
	jpf.salary_year_avg AS yearly_salary
FROM
	job_postings_fact AS jpf
	LEFT JOIN
	company_dim AS cd
	ON jpf.company_id = cd.company_id
	LEFT JOIN
	skills_job_dim AS sjd
	ON jpf.job_id = sjd.job_id
	LEFT JOIN
	skills_dim AS sd
	ON sjd.skill_id = sd.skill_id
GROUP BY
	jpf.job_id,
    company_name,
	skill,
    field
;
