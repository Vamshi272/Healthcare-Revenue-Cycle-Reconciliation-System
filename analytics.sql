-- ========================================
-- Healthcare Revenue Cycle Analytics
-- ========================================

-- 1️⃣ Total Billed Revenue
SELECT 
    SUM(claim_amount) AS total_billed_revenue
FROM claims;

-- 2️⃣ Total Collected Revenue
SELECT 
    SUM(paid_amount) AS total_collected_revenue
FROM payments;

-- 3️⃣ Revenue Leakage (Billed - Collected)
SELECT 
    SUM(c.claim_amount) - COALESCE(SUM(p.paid_amount),0) AS revenue_leakage
FROM claims c
LEFT JOIN payments p ON c.claim_id = p.claim_id;

-- 4️⃣ Denial Rate %
SELECT 
    (COUNT(CASE WHEN claim_status = 'Denied' THEN 1 END) * 100.0 
    / COUNT(*)) AS denial_rate_percentage
FROM claims;

-- 5️⃣ Net Collection Rate %
SELECT 
    (SUM(p.paid_amount) * 100.0 / SUM(c.claim_amount)) 
    AS net_collection_rate_percentage
FROM claims c
JOIN payments p ON c.claim_id = p.claim_id;

-- 6️⃣ Average Days in Accounts Receivable
SELECT 
    AVG(DATEDIFF(day, c.submission_date, p.payment_date)) 
    AS avg_days_in_ar
FROM claims c
JOIN payments p ON c.claim_id = p.claim_id;
