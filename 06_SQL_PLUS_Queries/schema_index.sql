/* ============================================================================
   ####  SCHEMA OBJECTS — TABLES, INDEXES, VIEWS  ####
   Insurance Data Warehouse — Oracle 9i
   ============================================================================ */


/* ----------------------------------------------------------------------------
   ####  1. CREATE INDEXES  ####
   ---------------------------------------------------------------------------- */

-- Single-column index on a frequently filtered column
CREATE INDEX idx_policy_status
    ON policy_dim (policy_status);

-- Composite index for join performance on the fact table
CREATE INDEX idx_claim_fact_keys
    ON claim_fact (customer_key, policy_key, date_key);


/* ----------------------------------------------------------------------------
   ####  2. CREATE / MAINTAIN VIEWS  ####
   ---------------------------------------------------------------------------- */

-- Reporting view for active policies
CREATE OR REPLACE VIEW vw_active_policies AS
SELECT policy_id,
       policy_type,
       policy_status,
       coverage_amount,
       premium_amount
FROM   policy_dim
WHERE  current_flag = 'Y';


/* ----------------------------------------------------------------------------
   ####  3. MAINTAIN TABLE STRUCTURE  ####
   ---------------------------------------------------------------------------- */

-- Add a column to an existing table
ALTER TABLE policy_dim ADD (renewal_flag CHAR(1));


/* ----------------------------------------------------------------------------
   ####  4. INDEX MAINTENANCE  ####
   ---------------------------------------------------------------------------- */

-- Rebuild a fragmented index
ALTER INDEX idx_policy_status REBUILD;

-- Check index status
SELECT index_name,
       table_name,
       status
FROM   dba_indexes
WHERE  table_owner = 'DW_USER';

-- Drop an unused index
DROP INDEX idx_claim_fact_keys;


/* ============================================================================
   ####  END OF SCRIPT  ####
   ============================================================================ */
