-- =========================================
-- RFM CUSTOMER SEGMENTATION ANALYSIS
-- =========================================

-- STEP 1: CREATE RFM ANALYSIS TABLE

CREATE TABLE rfm_analysis AS
SELECT 
    o.user_id,
    DATEDIFF(CURDATE(), MAX(o.order_date)) AS recency,
    COUNT(o.order_id) AS frequency,
    SUM(p.amount) AS monetary
FROM orders o
JOIN payments p 
    ON o.order_id = p.order_id
WHERE p.payment_status = 'success'
GROUP BY o.user_id;


-- =========================================
-- STEP 2: GENERATE RFM SCORES
-- =========================================

CREATE TABLE rfm_scores AS
SELECT 
    user_id,

    -- Recency Score (Lower Recency = Better)
    NTILE(5) OVER (ORDER BY recency ASC) AS r_score,

    -- Frequency Score (Higher Frequency = Better)
    NTILE(5) OVER (ORDER BY frequency DESC) AS f_score,

    -- Monetary Score (Higher Spending = Better)
    NTILE(5) OVER (ORDER BY monetary DESC) AS m_score

FROM rfm_analysis;


-- =========================================
-- STEP 3: CUSTOMER SEGMENTATION
-- =========================================

CREATE TABLE customer_segments AS
SELECT 
    user_id,
    r_score,
    f_score,
    m_score,

    CASE 
        WHEN r_score >= 4 
             AND f_score >= 4 
             AND m_score >= 4 
        THEN 'VIP Customers'

        WHEN r_score >= 3 
             AND f_score >= 3 
        THEN 'Loyal Customers'

        WHEN r_score <= 2 
             AND f_score <= 2 
        THEN 'At Risk Customers'

        ELSE 'Regular Customers'
    END AS customer_segment

FROM rfm_scores;


-- =========================================
-- STEP 4: SEGMENT SUMMARY
-- =========================================

SELECT 
    customer_segment,
    COUNT(*) AS total_customers
FROM customer_segments
GROUP BY customer_segment
ORDER BY total_customers DESC;


-- =========================================
-- STEP 5: TOP HIGH-VALUE CUSTOMERS
-- =========================================

SELECT 
    r.user_id,
    r.recency,
    r.frequency,
    r.monetary,
    c.customer_segment
FROM rfm_analysis r
JOIN customer_segments c
    ON r.user_id = c.user_id
ORDER BY r.monetary DESC
LIMIT 10;
