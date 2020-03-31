SELECT teachers.name AS teacher, cohorts.name AS cohort, count(teacher_id)AS total_assistances
FROM assistance_requests
JOIN teachers ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY teacher, cohort
HAVING cohorts.name = 'JUL02'
ORDER BY teacher;