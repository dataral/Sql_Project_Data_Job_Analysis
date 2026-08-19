
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT (skills_job_dim.job_id) AS demand_count,
        round(AVG(salary_year_avg), 0) as avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' 
    AND job_work_from_home = TRUE 
    AND salary_year_avg IS NOT NULL
GROUP BY 
    skills_dim.skill_id
having 
    COUNT (skills_job_dim.job_id) > 10
order by 
    avg_salary desc, demand_count desc
    limit 25;