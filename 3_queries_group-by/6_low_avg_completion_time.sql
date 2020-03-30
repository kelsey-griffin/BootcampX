SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration, AVG(assignments.duration) AS average_estimated_duration
FROM assignment_submissions 
JOIN students ON student_id = students.id
JOIN assignments ON assignment_id = assignments.id
WHERE end_date IS NULL
GROUP BY student
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY average_assignment_duration ASC;