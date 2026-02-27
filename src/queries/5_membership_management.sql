.open fittrackpro.db
.mode column

-- 5.1 
SELECT m.member_id, m.first_name, m.last_name, ms.type AS membership_type, m.join_date
FROM members AS m
JOIN memberships AS ms ON m.member_id = ms.member_id
WHERE ms.status = 'Active';

-- 5.2 
SELECT ms.type AS membership_type, 
    AVG((JULIANDAY(a.check_out_time) - JULIANDAY(a.check_in_time)) * 24 * 60) AS avg_visit_duration_minutes
FROM memberships AS ms
JOIN attendance AS a ON ms.member_id = a.member_id
GROUP BY ms.type;

-- 5.3 
SELECT m.member_id, m.first_name, m.last_name, m.email, ms.end_date
FROM members AS m
JOIN memberships AS ms ON m.member_id = ms.member_id
WHERE strftime('%Y', ms.end_date) = '2025';
