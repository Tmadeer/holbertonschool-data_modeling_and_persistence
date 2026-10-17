SELECT courses.title AS course_title
FROM courses
INNER JOIN assignments ON courses.id = assignments.course_id
GROUP BY courses.id, courses.title
HAVING COUNT(*) > (
    SELECT AVG(assignment_count)
    FROM (
        SELECT COUNT(*) AS assignment_count
        FROM assignments
        GROUP BY course_id
    )
)
ORDER BY courses.title ASC;
