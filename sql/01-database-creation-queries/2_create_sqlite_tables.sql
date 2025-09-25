-- Create company_dim table with primary key
CREATE TABLE company_dim
(
    company_id INTEGER PRIMARY KEY,
    name TEXT,
    link TEXT,
    link_google TEXT,
    thumbnail TEXT
) STRICT;

-- Create skills_dim table with primary key
CREATE TABLE skills_dim
(
    skill_id INTEGER PRIMARY KEY,
    skills TEXT,
    type TEXT
) STRICT;

-- Create job_postings_fact table with primary key
CREATE TABLE job_postings_fact
(
    job_id INTEGER PRIMARY KEY,
    company_id INT,
    job_title_short TEXT,
    job_title TEXT,
    job_location TEXT,
    job_via TEXT,
    job_schedule_type TEXT,
    job_work_from_home INT,
    search_location TEXT,
    job_posted_date TEXT,
    job_no_degree_mention INT,
    job_health_insurance INT,
    job_country TEXT,
    salary_rate TEXT,
    salary_year_avg REAL,
    salary_hour_avg REAL,
    FOREIGN KEY (company_id) REFERENCES company_dim (company_id)
) STRICT;

-- Create skills_job_dim table with a composite primary key and foreign keys
CREATE TABLE skills_job_dim
(
    job_id INT,
    skill_id INT,
    PRIMARY KEY (job_id, skill_id),
    FOREIGN KEY (job_id) REFERENCES job_postings_fact (job_id),
    FOREIGN KEY (skill_id) REFERENCES skills_dim (skill_id)
) STRICT;

-- Create indices on foreign key columns for better performance
CREATE INDEX idx_company_id ON job_postings_fact (company_id);
CREATE INDEX idx_skill_id ON skills_job_dim (skill_id);
CREATE INDEX idx_job_id ON skills_job_dim (job_id);

