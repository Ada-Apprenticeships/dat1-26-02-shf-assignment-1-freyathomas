.open fittrackpro.db
.mode column

-- 1.1
SELECT member_id, 
    first_name, 
    last_name, 
    email, 
    join_date
FROM members;

-- 1.2
UPDATE members 
SET phone_number='07000 10005', 
        email='emily.jones.updated@email.com'
WHERE member_id = 5;

-- 1.3
SELECT COUNT(*) AS myCount -- * counts everything 
FROM members;

-- 1.4
SELECT m.member_id, 
    m.first_name, 
    m.last_name, 
    COUNT(c.member_id) AS registration_count
FROM members AS m
JOIN class_attendance AS c 
    ON m.member_id = c.member_id
GROUP BY 
    m.member_id, 
    m.first_name, 
    m.last_name
ORDER BY registration_count DESC -- descending to get highest at the top
LIMIT 1; -- limiting by 1 to get the top result

-- 1.5
SELECT m.member_id, 
    m.first_name, 
    m.last_name, 
    COUNT(c.member_id) AS registration_count
FROM members AS m
LEFT JOIN class_attendance AS c 
    ON m.member_id = c.member_id
GROUP BY 
    m.member_id, 
    m.first_name, 
    m.last_name
ORDER BY registration_count ASC --ascending to get the lowest at the top
LIMIT 1; --limits by 1 to get the lowest (which is at the top)

-- 1.6
SELECT COUNT(*) AS Count
FROM (
        SELECT m.member_id
        FROM members AS m
        JOIN class_attendance AS c
                ON m.member_id = c.member_id
        WHERE c.attendance_status = 'Attended'
        GROUP BY m.member_id
        HAVING COUNT(c.member_id) >= 2
);

