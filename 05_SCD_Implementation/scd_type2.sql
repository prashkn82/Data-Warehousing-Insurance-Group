/* ============================================================
   SCD TYPE 2 IMPLEMENTATION
   Full History Tracking – New Record for Every Change
   Data Warehousing Insurance Group Project
   ============================================================ */

/* ============================================================
   1. CHECK IF RECORD EXISTS (MATCH ON NATURAL KEY)
   ============================================================ */
SELECT customer_key,
       first_name,
       last_name,
       gender,
       address,
       phone_number,
       effective_start_dt,
       effective_end_dt,
       current_flag
FROM customer_dim
WHERE customer_id = :src_customer_id
  AND current_flag = 'Y';

/* ============================================================
   2. COMPARE SOURCE & TARGET VALUES
   ============================================================ */
/*
   If any attribute has changed, we perform SCD Type 2:
   - Close the existing record (set end date, current_flag = 'N')
   - Insert a new record with updated values
*/

/* ============================================================
   3. CLOSE EXISTING RECORD
   ============================================================ */
UPDATE customer_dim
SET effective_end_dt = SYSDATE,
    current_flag     = 'N'
WHERE customer_id    = :src_customer_id
  AND current_flag   = 'Y';

/* ============================================================
   4. INSERT NEW RECORD (UPDATED VALUES)
   ============================================================ */
INSERT INTO customer_dim (
    customer_key,
    customer_id,
    first_name,
    last_name,
    gender,
    address,
    phone_number,
    effective_start_dt,
    effective_end_dt,
    current_flag
)
VALUES (
    customer_seq.NEXTVAL,
    :src_customer_id,
    :new_first_name,
    :new_last_name,
    :new_gender,
    :new_address,
    :new_phone_number,
    SYSDATE,
    TO_DATE('31-DEC-9999','DD-MON-YYYY'),
    'Y'
);

/* ============================================================
   5. POLICY DIMENSION – TYPE 2 LOGIC
   ============================================================ */

UPDATE policy_dim
SET effective_end_dt = SYSDATE,
    current_flag     = 'N'
WHERE policy_id      = :src_policy_id
  AND current_flag   = 'Y';

INSERT INTO policy_dim (
    policy_key,
    policy_id,
    policy_type,
    policy_status,
    coverage_amount,
    premium_amount,
    effective_start_dt,
    effective_end_dt,
    current_flag
)
VALUES (
    policy_seq.NEXTVAL,
    :src_policy_id,
    :new_policy_type,
    :new_policy_status,
    :new_coverage_amount,
    :new_premium_amount,
    SYSDATE,
    TO_DATE('31-DEC-9999','DD-MON-YYYY'),
    'Y'
);

/* ============================================================
   NOTES:
   - SCD Type 2 maintains full history.
   - Every change creates a new record.
   - current_flag = 'Y' marks the active record.
   - effective_end_dt = 31-DEC-9999 represents "still active".
   ============================================================ */
