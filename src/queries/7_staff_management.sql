.open fittrackpro.db
.mode column

-- 7.1 
SELECT staff_id, 
    first_name, 
    last_name, 
    position AS role
FROM staff
ORDER BY position;


-- 7.2 
SELECT p.staff_id AS trainer_id, 
    s.first_name || ' ' || s.last_name AS trainer_name, 
    COUNT(p.session_id) AS session_count
FROM personal_training_sessions AS p
JOIN staff AS s ON s.staff_id = p.staff_id
WHERE session_date <= date('2025-01-20', '+30 days')
GROUP BY p.staff_id, trainer_name;

