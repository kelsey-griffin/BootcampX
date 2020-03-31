SELECT cohorts.name, AVG(completed_at - started_at) AS average_assistance_time
FROM assistance_requests x
JOIN students ON students.id = x.student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
HAVING AVG(completed_at - started_at) > all(
  SELECT AVG(completed_at - started_at) 
  FROM assistance_requests y
  JOIN students ON students.id =  y.student_id
  JOIN cohorts ON cohorts.id = cohort_id
  WHERE cohort_id = cohort_id)
LIMIT 1;

-- correct answer
-- SELECT cohorts.name, AVG(completed_at - started_at) AS average_assistance_time
-- FROM assistance_requests
-- JOIN students ON students.id = assistance_requests.student_id
-- JOIN cohorts ON cohorts.id = cohort_id
-- GROUP BY cohorts.name
-- ORDER BY average_assistance_time DESC
-- LIMIT 1;