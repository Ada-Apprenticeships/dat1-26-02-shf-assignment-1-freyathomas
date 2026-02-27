.open fittrackpro.db
.mode column

-- 7.1 
SELECT staff_id, first_name, last_name, position AS role
FROM staff
ORDER BY position;

-- 7.2 
SELECT trainer_id, trainer_name, session_count


