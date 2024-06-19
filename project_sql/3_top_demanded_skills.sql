/*
Question: What are the most in-demand skills for data analyst?
- Join job postings to inner join table similar to query 2
- Indentify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrives the top 5 skills with the highest demand in the job market,
  providing insights inot the most valuable skills for job seekers.
*/

SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON
    job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON
    skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'India'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5


/*
[
  {
    "skills": "sql",
    "demand_count": "1016"
  },
  {
    "skills": "excel",
    "demand_count": "717"
  },
  {
    "skills": "python",
    "demand_count": "687"
  },
  {
    "skills": "tableau",
    "demand_count": "545"
  },
  {
    "skills": "power bi",
    "demand_count": "402"
  }
]
*/