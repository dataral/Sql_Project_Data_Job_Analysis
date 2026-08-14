WITH top_paying_remote_jobs AS
(
select  
job_id,
job_title,
salary_year_avg,
name AS company_name
from job_postings_fact
left JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title = 'Data Analyst' AND
job_location = 'Anywhere' AND
salary_year_avg IS NOT NULL
order by salary_year_avg desc
limit 10
)

select top_paying_remote_jobs.*,
skills
from top_paying_remote_jobs
inner JOIN skills_job_dim ON top_paying_remote_jobs.job_id = skills_job_dim.job_id
inner JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
