.open fittrackpro.db
.mode column

-- 4.1 
SELECT DISTINCT cs.class_id, c.name AS class_name, s.first_name AS instructor_name
FROM class_schedule AS cs
JOIN classes AS c ON cs.class_id = c.class_id
JOIN staff AS s ON cs.staff_id = s.staff_id
WHERE s.position = 'Trainer'
ORDER BY cs.class_id;

-- 4.2 
SELECT cs.class_id, c.name, cs.start_time, cs.end_time, c.capacity AS available_spots
FROM class_schedule AS cs
JOIN classes AS c ON cs.class_id = c.class_id
WHERE date(cs.start_time) = '2025-02-01';

-- 4.3 
INSERT INTO class_attendance (schedule_id,member_id,attendance_status) VALUES
( 1, 11, 'Registered');

-- 4.4 
DELETE FROM class_attendance
WHERE member_id = 3 AND schedule_id = 7;

-- 4.5 
SELECT cs.class_id, c.name AS class_name, COUNT(ca.attendance_status) AS registration_count
FROM class_attendance AS ca
JOIN class_schedule AS cs ON cs.schedule_id = ca.schedule_id
JOIN classes AS c ON cs.class_id = c.class_id
WHERE ca.attendance_status = 'Registered'
GROUP BY cs.class_id, c.name
ORDER BY registration_count DESC
LIMIT 1;

-- 4.6 
SELECT AVG(classes_per_member)
FROM (
    SELECT member_id, COUNT(*) AS classes_per_member
    FROM class_attendance
    GROUP BY member_id
);
