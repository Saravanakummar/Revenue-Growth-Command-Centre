SELECT 
    (SELECT COUNT(*) FROM sessions) AS total_sessions,
    (SELECT SUM(converted) FROM sessions) AS converted_sessions,
    (SELECT COUNT(*) FROM orders) AS total_orders,
    (SELECT COUNT(*) FROM payments WHERE payment_status='success') AS successful_payments;
