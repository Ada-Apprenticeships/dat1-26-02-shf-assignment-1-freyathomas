.open fittrackpro.db
.mode column

-- 3.1 
SELECT equipment_id, name, next_maintenance_date
FROM equipment
WHERE date <= (next_maintenance_date, '+30 days')

-- 3.2 
SELECT equipment_type, count
FROM equipment

-- 3.3 

