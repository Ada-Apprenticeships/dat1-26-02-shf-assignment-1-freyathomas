.open fittrackpro.db
.mode column

-- 8.1 
SELECT p.session_id, 
    m.first_name || ' ' || m.last_name AS member_name, 
    p.session_date, 
    p.start_time, 
    p.end_time
FROM personal_training_sessions AS p
JOIN members AS m ON m.member_id = p.member_id
JOIN staff AS s ON s.staff_id = p.staff_id
WHERE s.first_name = 'Ivy' AND s.last_name = 'Irwin'
ORDER BY p.session_date, p.start_time;

