CREATE TABLE kpi_summary (
    metric_name VARCHAR(50),
    metric_value DECIMAL(15,6)
);

INSERT INTO kpi_summary
SELECT 'Total Revenue', SUM(amount)
FROM payments
WHERE payment_status = 'success';

INSERT INTO kpi_summary
SELECT 'Total Orders', COUNT(*)
FROM orders;

INSERT INTO kpi_summary
SELECT 
    'AOV',
    ROUND(SUM(amount)/COUNT(DISTINCT order_id), 6)
FROM payments
WHERE payment_status = 'success';

INSERT INTO kpi_summary
SELECT 
    'Active Users',
    COUNT(DISTINCT o.user_id)
FROM orders o
JOIN payments p ON o.order_id = p.order_id
WHERE p.payment_status = 'success';

INSERT INTO kpi_summary
SELECT   
    'Conversion Rate (%)',
    ROUND(
        (SELECT COUNT(*) FROM orders) * 100.0 /
        (SELECT COUNT(*) FROM sessions),
        6
    );
