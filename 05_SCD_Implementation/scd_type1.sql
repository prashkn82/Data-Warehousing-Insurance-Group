/* ========================================================================================
   ####  SCD TYPE 1 IMPLEMENTATION  ####
   Overwrite Changes — No History Maintained
   Project : Data Warehousing Insurance Group
   ======================================================================================== */


/* ----------------------------------------------------------------------------------------
   ####  1. UPDATE EXISTING RECORDS (OVERWRITE)  ####
   ---------------------------------------------------------------------------------------- */
/*
   When a change is detected in a dimension attribute,
   SCD Type 1 overwrites the existing record.
*/

UPDATE customer_dim
SET
    first_name      = :new_first_name,
    last_name       = :new_last_name,
    gender          = :new_gender,
    address         = :new_address,
    phone_number    = :new_phone_number
WHERE customer_id   = :src_customer_id;


/* ----------------------------------------------------------------------------------------
   ####  2. POLICY DIMENSION — TYPE 1 UPDATE  ####
   ---------------------------------------------------------------------------------------- */
UPDATE policy_dim
SET
    policy_type       = :new_policy_type,
    policy_status     = :new_policy_status,
    coverage_amount   = :new_coverage_amount,
    premium_amount    = :new_premium_amount
WHERE policy_id       = :src_policy_id;


/* ----------------------------------------------------------------------------------------
   ####  3. AGENT DIMENSION — TYPE 1 UPDATE  ####
   ---------------------------------------------------------------------------------------- */
UPDATE agent_dim
SET
    agent_name            = :new_agent_name,
    region                = :new_region,
    performance_rating    = :new_performance_rating
WHERE agent_id            = :src_agent_id;


/* ============================================================================
   ####  NOTES  ####
   - SCD Type 1 does NOT maintain history.
   - Old values are overwritten permanently.
   - Best used for corrections or non-critical attributes.
   ============================================================================ */
