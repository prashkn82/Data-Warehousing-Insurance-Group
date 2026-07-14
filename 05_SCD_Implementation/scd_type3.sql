/* ============================================================================
   ####  SCD TYPE 3 IMPLEMENTATION  ####
   Limited History — Stores Current & Previous Value Only
   Project : Data Warehousing Insurance Group
   ============================================================================ */


/* ----------------------------------------------------------------------------
   ####  1. ADD SUPPORTING COLUMNS (ONE-TIME SETUP)  ####
   Adds current/previous tracking columns to policy_dim
   ---------------------------------------------------------------------------- */
ALTER TABLE policy_dim ADD (
    current_policy_status    VARCHAR2(20),
    previous_policy_status   VARCHAR2(20)
);


/* ----------------------------------------------------------------------------
   ####  2. CHECK CURRENT VALUE BEFORE UPDATE  ####
   ---------------------------------------------------------------------------- */
SELECT policy_id,
       current_policy_status,
       previous_policy_status
FROM   policy_dim
WHERE  policy_id = :src_policy_id;


/* ----------------------------------------------------------------------------
   ####  3. SHIFT CURRENT VALUE INTO PREVIOUS, APPLY NEW VALUE  ####
   No new row is inserted — the same record is updated in place
   ---------------------------------------------------------------------------- */
UPDATE policy_dim
SET    previous_policy_status = current_policy_status,
       current_policy_status  = :new_policy_status
WHERE  policy_id               = :src_policy_id;


/* ----------------------------------------------------------------------------
   ####  4. AGENT DIMENSION — TYPE 3 LOGIC  ####
   Tracks only the previous region for each agent
   ---------------------------------------------------------------------------- */
ALTER TABLE agent_dim ADD (
    current_region     VARCHAR2(50),
    previous_region    VARCHAR2(50)
);

UPDATE agent_dim
SET    previous_region = current_region,
       current_region  = :new_region
WHERE  agent_id         = :src_agent_id;


/* ----------------------------------------------------------------------------
   ####  5. VERIFY THE CHANGE  ####
   ---------------------------------------------------------------------------- */
SELECT policy_id,
       current_policy_status,
       previous_policy_status
FROM   policy_dim
WHERE  policy_id = :src_policy_id;


/* ============================================================================
   ####  NOTES  ####
   - SCD Type 3 stores only ONE prior value, not full history.
   - No new rows are inserted — existing rows are updated in place.
   - Best suited for attributes where only the last change matters
     (e.g. policy status, agent region).
   - Cannot answer "what was the value 3 changes ago" — use Type 2 for that.
   ============================================================================ */
