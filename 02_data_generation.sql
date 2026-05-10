USERS

CREATE TABLE numbers (n INT);

INSERT INTO numbers (n)
SELECT a.N + b.N * 10 + c.N * 100 + d.N * 1000 + 1
FROM 
(SELECT 0 N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 
 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
(SELECT 0 N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 
 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b,
(SELECT 0 N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 
 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c,
(SELECT 0 N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4) d
LIMIT 5000;

INSERT INTO users (user_id, signup_date, country, device_type, marketing_channel)
SELECT 
    n,
    DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND()*180) DAY),
    ELT(FLOOR(1 + RAND()*3),'India','USA','UK'),
    ELT(FLOOR(1 + RAND()*2),'mobile','desktop'),
    ELT(FLOOR(1 + RAND()*3),'ads','organic','referral')
FROM numbers;


SESSIONS
  
INSERT INTO sessions 
(user_id, session_start, session_end, page_views, traffic_source, converted)
SELECT 
    FLOOR(1 + RAND()*5000),
    NOW() - INTERVAL FLOOR(RAND()*30) DAY,
    NOW(),
    FLOOR(1 + RAND()*10),
    ELT(FLOOR(1 + RAND()*3),'ads','organic','email'),
    IF(RAND() > 0.75,1,0)
FROM numbers;


ORDERS

  
INSERT INTO orders (user_id, order_date, order_status)
SELECT 
    user_id,
    session_start + INTERVAL FLOOR(RAND()*60) MINUTE,
    'completed'
FROM sessions
WHERE converted = 1
AND RAND() > 0.3;


ORDER ITEMS

INSERT INTO order_items (order_id, product_id, quantity, price_per_unit)
SELECT 
    order_id,
    FLOOR(1 + RAND()*100),
    FLOOR(1 + RAND()*3),
    FLOOR(100 + RAND()*900)
FROM orders;  


PAYMENTS
INSERT INTO payments (order_id, payment_date, payment_method, payment_status, amount)
SELECT 
    oi.order_id,
    NOW(),
    ELT(FLOOR(1 + RAND()*3),'UPI','card','COD'),
    IF(RAND() > 0.1,'success','failed'),
    SUM(oi.quantity * oi.price_per_unit)
FROM order_items oi
GROUP BY oi.order_id;

