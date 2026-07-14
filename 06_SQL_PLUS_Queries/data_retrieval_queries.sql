/* ============================================================================
   ####  SQL*PLUS DATA RETRIEVAL QUERIES  ####
   Insurance Data Warehouse — Oracle 9i
   ============================================================================ */


/* ----------------------------------------------------------------------------
   ####  1. BASIC SELECT QUERIES  ####
   ---------------------------------------------------------------------------- */

-- Retrieve all active customers
SELECT customer_key,
       customer_id,
       first_name,
       last_name,
       gender
FROM   customer_dim
WHERE  current_flag = 'Y';

-- Retrieve active policies
SELECT policy_key,
       policy_id,
       policy_type,
       policy_status
FROM   policy_dim
WHERE  current_flag = 'Y';


/* ----------------------------------------------------------------------------
   ####  2. FILTERING & SORTING  ####
   ---------------------------------------------------------------------------- */

-- Customers from a specific city
SELECT first_name,
       last_name,
       address
FROM   customer_dim
WHERE  address LIKE '%Chicago%'
ORDER  BY last_name;

-- Policies with premium above threshold
SELECT policy_id,
       premium_amount
FROM   policy_dim
WHERE  premium_amount > 5000
ORDER  BY premium_amount DESC;


/* ----------------------------------------------------------------------------
   ####  3. JOINING FACT & DIMENSION TABLES  ####
   ---------------------------------------------------------------------------- */

-- Claim details with customer and policy info
SELECT cf.claim_id,
       cd.first_name || ' ' || cd.last_name AS customer_name,
       pd.policy_type,
       cf.claim_amount,
       cf.settlement_duration
FROM   claim_fact    cf
JOIN   customer_dim  cd ON cf.customer_key = cd.customer_key
JOIN   policy_dim    pd ON cf.policy_key   = pd.policy_key
WHERE  cd.current_flag = 'Y'
AND    pd.current_flag = 'Y';


/* ----------------------------------------------------------------------------
   ####  4. DATE DIMENSION USAGE  ####
   ---------------------------------------------------------------------------- */

-- Claims by year
SELECT d.year,
       COUNT(*) AS total_claims
FROM   claim_fact cf
JOIN   date_dim    d ON cf.date_key = d.date_key
GROUP  BY d.year
ORDER  BY d.year;


/* ----------------------------------------------------------------------------
   ####  5. AGGREGATION & GROUPING  ####
   ---------------------------------------------------------------------------- */

-- Total premium collected per policy type
SELECT pd.policy_type,
       SUM(pf.premium_amount) AS total_premium
FROM   policy_fact  pf
JOIN   policy_dim   pd ON pf.policy_key = pd.policy_key
GROUP  BY pd.policy_type
ORDER  BY total_premium DESC;


/* ----------------------------------------------------------------------------
   ####  6. TOP-N ANALYSIS  ####
   ---------------------------------------------------------------------------- */

-- Top 5 highest claim amounts
SELECT *
FROM (
    SELECT claim_id,
           claim_amount
    FROM   claim_fact
    ORDER  BY claim_amount DESC
)
WHERE ROWNUM <= 5;


/* ----------------------------------------------------------------------------
   ####  7. VALIDATION QUERIES  ####
   ---------------------------------------------------------------------------- */

-- Check SCD Type 2 history for a customer
SELECT customer_id,
       address,
       effective_start_dt,
       effective_end_dt,
       current_flag
FROM   customer_dim
WHERE  customer_id = :customer_id
ORDER  BY effective_start_dt;

-- Check foreign key integrity
SELECT COUNT(*) AS invalid_records
FROM   claim_fact cf
WHERE  NOT EXISTS (
    SELECT 1
    FROM   customer_dim cd
    WHERE  cf.customer_key = cd.customer_key
);


/* ============================================================================
   ####  END OF SCRIPT  ####
   ============================================================================ */
