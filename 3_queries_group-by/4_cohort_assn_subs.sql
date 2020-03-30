SELECT cohorts.name AS cohort, count(assignments.*) AS total_submissions
FROM cohorts
JOIN students ON cohorts.id = cohort_id
JOIN assignment_submissions ON students.id = student_id
JOIN assignments ON assignments.id = assignment_id
GROUP BY cohorts.name
ORDER BY total_submissions DESC;