.open fittrackpro.db
.mode column

-- 1.1
SELECT member_id, first_name, last_name, email, join_date
FROM members;

-- 1.2
UPDATE members 
SET phone_number='07000 10005', email='emily.jones.updated@email.com'
WHERE member_id = 5;

-- 1.3
SELECT COUNT(member_id) AS myCount
FROM members;

-- 1.4
SELECT member_id, first_name, last_name, registration_count
FROM members
WHERE (SELECT MAX(registered) 
        FROM class_attendance 
        WHERE( SELECT COUNT(attendance_status)

        group by mid fn ln rgc order by and limit to show one
             

-- 1.5


-- 1.6

