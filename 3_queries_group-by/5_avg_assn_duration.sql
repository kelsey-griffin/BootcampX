SELECT students.name AS student, AVG(assignment_submissions.duration) AS average_assignment_duration
FROM assignment_submissions
JOIN students ON students.id = student_id
GROUP BY students.end_date, students.name
HAVING students.end_date IS NULL
ORDER BY average_assignment_duration DESC;