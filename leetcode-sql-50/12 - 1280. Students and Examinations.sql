
-- problem url: https://leetcode.com/problems/students-and-examinations/?envType=study-plan-v2&envId=top-sql-50

with examinations_count as (
    select student_id, subject_name, count(1) as total
    from examinations
    group by student_id, subject_name
), students_subjects as (
    select student_id, student_name, subject_name
    from students
    cross join subjects
)

select s.student_id, s.student_name, s.subject_name, COALESCE(total, 0) as attended_exams
from students_subjects s
left join examinations_count exam
    on s.student_id = exam.student_id
    and s.subject_name = exam.subject_name
order by s.student_id, s.subject_name
