SELECT AVG(total_duration) AS average_total_duration
FROM (
  SELECT cohorts.name AS cohort, sum(completed_at - started_at) AS total_duration
  FROM assistance_requests
  JOIN students ON students.id = assistance_requests.student_id
  JOIN cohorts ON cohorts.id = cohort_id
  GROUP BY cohort
  ORDER BY total_duration
) AS all_cohort_durations;