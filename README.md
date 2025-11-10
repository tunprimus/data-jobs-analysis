# data-jobs-analysis

## About The Project

As an aspiring data nerd looking to analyse top-paying roles and skill by using SQL queries to explore a large dataset about role(s) of interest.

The following questions were important to be answered.

1. What are the top-paying jobs for roles that interest me?
2. What are the skills required for these top-paying roles?
3. What are the most in-demand skills for these roles?
4. What are the top skills based on salary for these roles?
5. What are the most optimal skills to learn? (Optimal: High Demand AND High Paying).
6. What are the features and discoveries related to Nigeria and Germany?
7. What features are important in determining yearly salary?
8. What challenges were faced during this project and how were they tackled?


### Project Structure

```markdown
.
├── __init__.py
└── public
    ├── css
    │   └── styles.css
    ├── images
    │   ├── comparison-remote-vs-onsite-job-offer-worldwide-nigeria-germany.svg
    │   ├── comparison-salary-ranges-worldwide-nigeria-germany.svg
    │   ├── datanerd-jobs-ERD.svg
    │   ├── job-postings-that-did-not-require-degree.svg
    │   ├── job-postings-that-require-degree.svg
    │   ├── min-mean-median-max-salaries-onsite-jobs.svg
    │   ├── min-mean-median-max-salaries-remote-jobs.svg
    │   ├── top-10-features-predicting-yearly-salary-for-data-professionals.svg
    │   ├── top-7-in-demand-skills-for-data-analysts.svg
    │   ├── top-7-in-demand-skills-for-data-engineers.svg
    │   └── top-7-in-demand-skills-for-data-scientists.svg
    ├── index.html
    ├── __init__.py
    ├── notebooks
    │   ├── data-jobs-analysis.ipynb
    │   ├── __init__.py
    │   └── prepare-data.ipynb
    ├── README.md
    ├── sql
    │   ├── 01-database-creation-queries
    │   │   ├── 1_create_database.sql
    │   │   ├── 2_create_postgres_tables.sql
    │   │   ├── 2_create_sqlite_tables.sql
    │   │   ├── 3_load_csv_data_into_postgres_tables.sql
    │   │   └── 3_load_csv_data_into_sqlite_tables.sql
    │   └── 02-analysis-queries
    │       ├── 00_databases_check_queries.sql
    │       ├── 01_top_paying_jobs.sql
    │       ├── 02_top_paying_job_skills.sql
    │       ├── 03_top_demanded_skills.sql
    │       ├── 04_top_paying_skills.sql
    │       ├── 05_optimal_skills.sql
    │       ├── 06_country_highlights.sql
    │       └── 07_combined_tables.sql
    └── utils
        ├── __init__.py
        ├── __pycache__
        │   ├── __init__.cpython-38.pyc
        │   └── utils.cpython-38.pyc
        └── utils.py

```

### Technology, Techniques, Tools and Libraries

- SQL, Postgres, SQLite;
- Python, Pandas, Fireducks, Matplotlib, Seaborn, Scikit-Learn, scikit-optimize, CatBoost, category-encoder, LightGBM;
- HTML5, CSS3 and vanilla JavaScript;
- Jupyter and Kaggle notebooks;
- GitLab Pages, GitLab CI/CD;
- Browsers: ResponsivelyApp, SeaMonkey, Firefox ESR, LibreWolf, Chromium;

## Getting Started & Usage

Clone this repo and open the index.html file in the browser or with a live server.

A live version is also available [check here](https://tunprimus.gitlab.io/data-jobs-analysis/)

Follow the instructions in the home page.

Create a .env file with the access components for a Postgres database.

The notebooks combine the codes used for this project.

## Licence

This project is licensed under the GNU General Public License v3.0 or later. [Learn more](https://www.gnu.org/licenses/gpl-3.0-standalone.html)
