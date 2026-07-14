/* ============================================================================
   ####  EXPORT / IMPORT — TABLE & SCHEMA LEVEL  ####
   Insurance Data Warehouse — Oracle 9i
   Note: exp/imp are OS-level utilities, shown here as reference commands
   ============================================================================ */


/* ----------------------------------------------------------------------------
   ####  1. EXPORT AT TABLE LEVEL  ####
   ---------------------------------------------------------------------------- */
-- Run from OS command line:
-- exp dw_user/dw_password file=C:\backup\policy_dim.dmp tables=(policy_dim)


/* ----------------------------------------------------------------------------
   ####  2. EXPORT AT SCHEMA LEVEL  ####
   ---------------------------------------------------------------------------- */
-- Run from OS command line:
-- exp dw_user/dw_password file=C:\backup\dw_user_full.dmp owner=dw_user


/* ----------------------------------------------------------------------------
   ####  3. IMPORT AT TABLE LEVEL  ####
   ---------------------------------------------------------------------------- */
-- Run from OS command line:
-- imp dw_user/dw_password file=C:\backup\policy_dim.dmp tables=(policy_dim) ignore=y


/* ----------------------------------------------------------------------------
   ####  4. IMPORT AT SCHEMA LEVEL  ####
   ---------------------------------------------------------------------------- */
-- Run from OS command line:
-- imp dw_user/dw_password file=C:\backup\dw_user_full.dmp fromuser=dw_user touser=dw_user ignore=y


/* ----------------------------------------------------------------------------
   ####  5. VERIFY IMPORT SUCCESS  ####
   ---------------------------------------------------------------------------- */

-- Compare row counts against the export log
SELECT table_name,
       num_rows
FROM   dba_tables
WHERE  owner = 'DW_USER'
ORDER  BY table_name;

-- Spot-check row counts on key tables
SELECT COUNT(*) AS policy_dim_count   FROM policy_dim;
SELECT COUNT(*) AS customer_dim_count FROM customer_dim;
SELECT COUNT(*) AS claim_fact_count   FROM claim_fact;


/* ============================================================================
   ####  END OF SCRIPT  ####
   ============================================================================ */
