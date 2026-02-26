.open fittrackpro.db
.mode column

-- 2.1 
INSERT INTO payments (payment_id,member_id,amount,payment_date,payment_method,payment_type) VALUES
(8,11,50.00,'now','Credit Card','Monthly membership fee');

-- 2.2 
SELECT month, COUNT(*) AS total_revenue(
    SELECT revenue 

-- 2.3 

