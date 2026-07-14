/* ============================================================================
   ####  USER, ROLE & PRIVILEGE MANAGEMENT  ####
   Insurance Data Warehouse — Oracle 9i
   ============================================================================ */


/* ----------------------------------------------------------------------------
   ####  1. CREATE USERS  ####
   ---------------------------------------------------------------------------- */
CREATE USER dw_analyst
    IDENTIFIED BY analyst_pwd
    DEFAULT TABLESPACE insurance_data
    TEMPORARY TABLESPACE insurance_temp;


/* ----------------------------------------------------------------------------
   ####  2. CREATE AND ASSIGN ROLES  ####
   ---------------------------------------------------------------------------- */

-- Create a custom role
CREATE ROLE dw_readonly;

-- Grant privileges to the role
GRANT CONNECT, CREATE SESSION TO dw_readonly;
GRANT SELECT ANY TABLE        TO dw_readonly;

-- Assign role to user
GRANT dw_readonly TO dw_analyst;


/* ----------------------------------------------------------------------------
   ####  3. VIEW USERS, ROLES & PRIVILEGES  ####
   ---------------------------------------------------------------------------- */

-- View all users
SELECT username,
       account_status,
       default_tablespace,
       created
FROM   dba_users
ORDER  BY created DESC;

-- View roles granted to a user
SELECT grantee,
       granted_role
FROM   dba_role_privs
WHERE  grantee = 'DW_ANALYST';

-- View system privileges granted directly to a user
SELECT grantee,
       privilege
FROM   dba_sys_privs
WHERE  grantee = 'DW_USER';

-- View object-level privileges
SELECT grantee,
       owner,
       table_name,
       privilege
FROM   dba_tab_privs
WHERE  grantee = 'DW_USER';


/* ----------------------------------------------------------------------------
   ####  4. REVOKE PRIVILEGES  ####
   ---------------------------------------------------------------------------- */
REVOKE CREATE VIEW FROM dw_analyst;


/* ----------------------------------------------------------------------------
   ####  5. LOCK / UNLOCK USER ACCOUNTS  ####
   ---------------------------------------------------------------------------- */
ALTER USER dw_analyst ACCOUNT LOCK;
ALTER USER dw_analyst ACCOUNT UNLOCK;


/* ============================================================================
   ####  END OF SCRIPT  ####
   ============================================================================ */
