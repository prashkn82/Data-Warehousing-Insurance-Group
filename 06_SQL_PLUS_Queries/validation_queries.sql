/* ============================================================
   VALIDATION QUERIES
   Insurance Data Warehouse – Oracle 9i
   Used for ETL Verification, SCD Validation, FK Checks, and DW QA
   ============================================================ */

/* ============================================================
   1. VALIDATE DIMENSION RECORD COUNTS
   ============================================================ */

-- Customer Dimension Count
SELECT COUNT(*) AS customer_dim_count
FROM customer_dim;

-- Policy Dimension Count
SELECT COUNT(*) AS policy_dim_count
FROM policy_dim;

-- Agent Dimension Count
SELECT COUNT(*) AS agent_dim_count
FROM agent_dim;

-- Claim Type Dimension Count
SELECT COUNT(*) AS claim_type_dim_count
FROM claim_type_dim;

/* ============================================================
   2. VALIDATE FACT TABLE RECORD COUNTS
   ============================================================ */

-- Policy Fact Count
SELECT COUNT(*) AS policy_fact_count
FROM policy_fact;

-- Claim Fact Count
SELECT COUNT(*) AS claim_fact_count
FROM claim_fact;

/* ============================================================
   3. CHECK FOR NULL FOREIGN KEYS IN FACT TABLES
   ============================================================ */

-- Policy Fact FK Validation
SELECT COUNT(*) AS invalid_policy_fact_records
FROM policy_fact
WHERE policy_key IS NULL
   OR customer_key IS NULL
   OR agent_key IS NULL
   OR date_key IS NULL;

-- Claim Fact FK Validation
SELECT COUNT(*) AS invalid_claim_fact_records
FROM claim_fact
WHERE customer_key IS NULL
   OR policy_key IS NULL
   OR claim_type_key IS NULL
   OR date_key IS NULL;

/* ============================================================
   4. CHECK REFERENTIAL INTEGRITY
   ============================================================ */

-- Policy Fact → Policy Dim
SELECT COUNT(*) AS missing_policy_dim_fk
FROM policy_fact pf
WHERE NOT EXISTS (
    SELECT 1 FROM policy_dim pd
    WHERE pf.policy_key = pd.policy_key
);

-- Claim Fact → Customer Dim
SELECT COUNT(*) AS missing_customer_dim_fk
FROM claim_fact cf
WHERE NOT EXISTS (
    SELECT 1 FROM customer_dim cd
    WHERE cf.customer_key = cd.customer_key
);

/* ============================================================
   5. VALIDATE SCD TYPE 2 HISTORY
   ============================================================ */

-- Check if any customer has overlapping effective dates
SELECT customer_id, effective_start_dt, effective_end_dt
FROM customer_dim
WHERE effective_end_dt < effective_start_dt;

-- Check if multiple active records exist for same customer
SELECT customer_id, COUNT(*) AS active_record_count
FROM customer_dim
WHERE current_flag = 'Y'
GROUP BY customer_id
HAVING COUNT(*) > 1;

/* ============================================================
   6. CHECK DATE DIMENSION COMPLETENESS
   ============================================================ */

-- Missing dates in Date Dimension
SELECT COUNT(*) AS missing_dates
FROM (
    SELECT TO_CHAR(full_date, 'YYYYMMDD') AS date_key
    FROM date_dim
)
WHERE date_key IS NULL;

/* ============================================================
   7. VALIDATE PREMIUM & CLAIM AMOUNTS
   ============================================================ */

-- Negative premium amounts (invalid)
SELECT policy_id, premium_amount
FROM policy_fact
WHERE premium_amount < 0;

-- Negative claim amounts (invalid)
SELECT claim_id, claim_amount
FROM claim_fact
WHERE claim_amount < 0;

/* ============================================================
   END OF SCRIPT
   ============================================================ */
